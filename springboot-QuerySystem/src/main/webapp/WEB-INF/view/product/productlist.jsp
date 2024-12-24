<%@page import="querysystem.model.dto.ProductDto"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
	List<ProductDto>productDtos = (List<ProductDto>)request.getAttribute("productDtos");
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>保險商品變更</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css">
		<link rel="stylesheet" href="/querysystem/css/buttons.css">
		
		<!-- DataTables -->
	    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
	    
	    <!-- DataTables Buttons -->
	    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.4.1/css/buttons.dataTables.min.css">
	    <script src="https://cdn.datatables.net/buttons/2.4.1/js/dataTables.buttons.min.js"></script>
	    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
	    <script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.html5.min.js"></script>
	    <script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.print.min.js"></script> -->
	    
	</head>
	<body style="background-color: #f4e500">
		<%@ include file="/WEB-INF/view/menu.jsp" %>
		<div style="padding: 15px ; display: ${userCert.role == 'EMPLOYEE' ? 'none' : 'block'}">
			<form class="pure-form" method="post" action="/product/add">
				<fieldset>
					<legend>商品新增</legend>					
					保險種類: <input type="text" name="productType" placeholder="請輸入 保險種類" required /><p /><p />
					年繳額: <input type="text" name="price" placeholder="請輸入 年繳額" required /><p />
					
					<button type="reset" class="button-warning pure-button">重置</button>
					<button type="submit" class="button-success pure-button">送出</button>
				</fieldset>
			</form>
		</div>
		<form class="pure-form" style="padding: 15px">
			<fieldset>
				<legend>
			        商品列表
			        <a href="/product/rank" class="btn btn-outline-success" style="margin-left: 20px;">保單銷售排行</a>
			    </legend>				
				<table id="myTable" class="pure-table pure-table-bordered" style="background-color: white;">
					<thead>
						<tr>
							<th>ID</th><th>保險種類</th><th>年繳額</th><th>上架情形</th><th>售出件數</th>
							<th>修改</th><th>刪除</th>
						</tr>
					</thead>
					<%for(ProductDto productDto : productDtos) { %>
						<tr>
							<td><%= productDto.getId() %></td>
							<td><%= productDto.getType() %></td>
							<td><%= productDto.getPrice() %></td>
							<td><%= productDto.getStatus() ? "在售":"已停售" %></td>
							<td><%= productDto.getSales() %></td>							
							
							<td><a href="/product/get?productId=<%= productDto.getId() %>" class="button-secondary pure-button"<c:if test="${userCert.role == 'EMPLOYEE'}">disabled</c:if>>修改</a></td>
							<td><a href="/product/delete?productId=<%= productDto.getId() %>" class="button-error pure-button"<c:if test="${userCert.role == 'EMPLOYEE'}">disabled</c:if>>刪除</a></td>
						</tr>
					<% } %>
					
				</table>
			</fieldset>
		</form>
		<script>
	        $(document).ready(function() {
	            $('#myTable').DataTable({
	            	
	                language: {
	                    url: "https://cdn.datatables.net/plug-ins/1.11.3/i18n/zh_Hant.json"
	                },
	                lengthMenu: [10, 15, 20],	                
	                pageLength: 10,
	                dom: 'RlBfrtip',
	                
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