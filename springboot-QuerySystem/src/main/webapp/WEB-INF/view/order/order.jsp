<%@page import="querysystem.model.dto.UserCert"%>
<%@page import="querysystem.model.dto.OrderDto"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
	List<OrderDto>orderDtos = (List<OrderDto>)request.getAttribute("orderDtos");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>保單系統</title>
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- DataTables -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

    <!-- DataTables Buttons -->
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.4.1/css/buttons.dataTables.min.css">
    <script src="https://cdn.datatables.net/buttons/2.4.1/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.print.min.js"></script>
</head>
<body style="background-color: #f4e500">
	<%@ include file="/WEB-INF/view/menu.jsp" %>
	<div style="padding: 15px">
			<button onclick="show()">新增保單</button>
			<button id="btn1" onclick="hide()"style="display: none;">收起表單</button>
		</div>
		<script>
			// 設定簽約日期預設值為當天
	        document.addEventListener("DOMContentLoaded", function () {
			    const today = new Date().toISOString().split('T')[0];
			    const orderDateElement = document.getElementById('orderDate');
			    if (orderDateElement) {
			        orderDateElement.setAttribute("max", today);
			    }
			});
	        
	        //顯示新增保單表格
			function show() {
				document.getElementById("form1").style.display = "inline-block";
				document.getElementById("btn1").style.display = "inline-block";
			}
			function hide() {
				document.getElementById("form1").style.display = "none";
				document.getElementById("btn1").style.display = "none";
			}
		</script>
		<div id="form1" style="display: none;">
			<form  class="row g-3" method="post" style="padding: 15px ;" action="/order/add">
				<!--  <h1>保單編號:####</h1>-->
				<div class="col-md-6">
					<label for="inputEmail4" class="form-label">要保人</label> 
					<input type="text" name="holder" class="form-control" >
				</div>
				<div class="col-md-6">
					<label for="inputPassword4" class="form-label">要保人身分證字號</label> 
					<input type="text" name="holderCN" class="form-control" >
				</div>
				<div class="col-md-6">
					<label for="inputEmail4" class="form-label">被保人</label> 
					<input type="text" name="insured" class="form-control" >
				</div>
				<div class="col-md-6">
					<label for="inputPassword4" class="form-label">被保人身分證字號</label> 
					<input type="text" name="insuredCN" class="form-control" >
				</div>
				<!-- <div class="col-4">
					<label for="inputAddress" class="form-label">保險種類(下拉選單)</label> 
					<select name="orderType" class="form-control" >
						<option value="汽車險">汽車險</option>
						<option value="旅平險">旅平險</option>
						<option value="重大傷病險">重大傷病險</option>
						<option value="意外險">意外險</option>
						<option value="天災險">天災險</option>
						<option value="儲蓄險">儲蓄險</option>
					</select>
				</div> -->
				<div class="col-4">
					<label for="inputAddress" class="form-label">保險種類(下拉選單)</label> 
					<select name="orderType" class="form-control" >
						<c:forEach var="value" items="${statusMap.keySet()}">
						    <c:if test="${statusMap[value]}">
						        <option value="${value}">${value}</option>
						    </c:if>
						</c:forEach>
					</select>
				</div>
				<div class="col-4">
					<label for="inputAddress" class="form-label">繳費年期</label> 
					<input type="number" name="payType" class="form-control" value="1" min="1" max="20">
				</div>
				<div class="col-4">
				<label for="inputAddress" class="form-label">簽約日期</label> 
				<input type="date" id="orderDate" name="orderDate" class="form-control" >
				</div>
				<div class="col-6">
					<label for="inputAddress2" class="form-label">負責業務</label> 
					<input type="text" name="charge" class="form-control" value= ${ userCert.username } readonly>
				</div>
				<div class="col-md-6">
					<label for="inputCity" class="form-label">負責業務聯絡方式</label> 
					<input type="text" name="contact" class="form-control" value= ${ userCert.phone } readonly>
				</div>
				<p/>
				<div class="col-12">
					<div class="input-group">
						<span class="input-group-text">備註</span>
						<textarea class="form-control" name="comment" aria-label="With textarea"></textarea>
					</div>
				</div>
				
				<button type="submit" class="btn btn-success">送出表單</button>
				
			</form>
		</div>
    <div class="container mt-4">
        <h1>保單列表</h1>
        
        <table id="myTable" class="display" style="background-color: white; width:100%">
            <thead>
                <tr>
                    <th>保單編號</th>
                    <th>要保人</th>
                    <th>被保人</th>
                    <th>保險種類</th>
                    <th>負責業務</th>
                    <th>修改</th>
                    <th>詳細資訊</th>
                </tr>
            </thead>
            <tbody>
                <% for(OrderDto orderDto : orderDtos) { %>
                    <tr>
                        <td><%= orderDto.getId() %></td>
                        <td><%= orderDto.getHolder() %></td>
                        <td><%= orderDto.getInsured() %></td>
                        <td><%= orderDto.getType() %></td>
                        <td><%= orderDto.getCharge() %></td>
                        <td><a href="/order/get?orderId=<%= orderDto.getId() %>" class="btn btn-secondary">修改</a></td>
                        <td><a href="/order/info?orderId=<%= orderDto.getId() %>" class="btn btn-info">詳細資訊</a></td>
                    </tr>
                <% } %>
            </tbody>
            <tfoot>
	            <tr>
	                <th>保單編號</th>
                    <th>要保人</th>
                    <th>被保人</th>
                    <th>保險種類</th>
                    <th>負責業務</th>
	            </tr>
	        </tfoot>
        </table>
    </div>

    <script>
        $(document).ready(function() {
            $('#myTable').DataTable({
            	
                language: {
                    url: "https://cdn.datatables.net/plug-ins/1.11.3/i18n/zh_Hant.json"
                },
                lengthMenu: [5, 10, 15],
                
                pageLength: 5,
                dom: 'RlBfrtip',
                layout: {
			        topStart: {
			            buttons: ['copy', 'csv', 'excel', 'pdf', 'print']
			        }
			    },
			    initComplete: function () {
			        this.api()
			            .columns()
			            .every(function () {
			                let column = this;
			                let title = column.footer().textContent;
			 
			                // Create input element
			                let input = document.createElement('input');
			                input.placeholder = title;
			                column.footer().replaceChildren(input);
			 
			                // Event listener for user input
			                input.addEventListener('keyup', () => {
			                    if (column.search() !== this.value) {
			                        column.search(input.value).draw();
			                    }
			                });
			            });
			    }
			    
            });
        });
    </script>
</body>
</html>