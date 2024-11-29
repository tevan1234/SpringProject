<%@page import="java.util.List"%>
<%@page import="querysystem.model.dto.OrderDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<OrderDto> orderDtos = (List<OrderDto>)request.getAttribute("orderDtos");
%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>個人資訊頁面</title>
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
		
	    <style>
	        body {
	            background-color: #f4e500;
	            font-family: Arial, sans-serif;
	        }
	        .profile-container {
	            display: flex;
	            gap: 20px;
	            margin: 20px;
	        }
	        .profile-image {
	            width: 150px;
	            height: 150px;
	            border-radius: 50%;
	            background-color: #f0f0f0;
	            display: flex;
	            justify-content: center;
	            align-items: center;
	            font-size: 24px;
	            color: #555;
	        }
	        .basic-info, .academic-info {
	            border: 2px solid #b3d9ff;
	            border-radius: 10px;
	            background-color: #fff;
	            padding: 15px;
	            flex: 1;
	        }
	        .academic-info table {
	            width: 100%;
	            margin-top: 10px;
	        }
	        .academic-info table th, .academic-info table td {
	            text-align: left;
	            padding: 8px;
	            border-bottom: 1px solid #ddd;
	        }
	        .tabs {
	            display: flex;
	            gap: 15px;
	            margin-bottom: 25px;
	        }
	        .tabs button {
	            background-color: #007bff;
	            color: white;
	            border: none;
	            padding: 10px 15px;
	            border-radius: 5px;
	            cursor: pointer;
	        }
	        .tabs button.active {
	            background-color: #0056b3;
	        }
	    </style>
	</head>
	<body style="background-color: #f4e500">
		<%@ include file="/WEB-INF/view/menu.jsp" %>
		<div style="padding: 15px">
		    <div class="profile-container" >
		        <!-- 左側：個人圖片 -->
		        <div class="profile-image" style="padding-top: 20px">
		            <img src="<%= request.getContextPath() %>/image/user.jpg" class="figure-img img-fluid rounded">
		        </div>
		
		        <!-- 右側：個人基本資訊 -->
		        <div class="basic-info">
		            <h4>個人基本資料</h4>
		            <table>
		                <tr>
		                    <th>姓名 : </th>
		                    <td>${ userCert.username }</td>
		                </tr>
		                <tr>
		                    <td><strong>手機 : </strong></td>
		                    <td>${ userCert.phone }</td>
		                </tr>
		                <tr>
		                    <td><strong>郵件 : </strong></td>
		                    <td>${ userCert.mail }</td>
		                </tr>
		                <tr>
		                    <td><strong>保單 : </strong></td>
		                    <td>持有 <%= orderDtos.size() %> 張</td>
		                </tr>
		            </table>
		        </div>
		    </div>
		
		    <!-- 下方：個人保單資料 -->
		    <form style="padding: 15px;">
		    	<fieldset>
					<legend>持有保單</legend>
					<!-- <div>
						<ul style="display: flex; gap: 60px; list-style: none; padding: 0; margin: 0;">
							<li>汽車險 : </li>
						    <li>旅平險 :</li>
						    <li>重大傷病險 : </li>
						    <li>意外險 : </li>
						    <li>天災險 :</li>
						    <li>儲蓄險 : </li>
						</ul>
					</div> -->
		        	<table id="myTable" class="display" style="background-color: white;">
		        		<thead>
		        			<tr>
		        				<th>保單編號</th><th>保險種類</th><th>繳費年期</th><th>繳費狀態</th><th style="text-align: center;">詳情</th>
		        			</tr>
		        		</thead>
		        		<p />
		        		<%for(OrderDto orderDto : orderDtos) { %>
		        			<tr>
		        				<td><%=orderDto.getId() %></td>
		        				<td><%=orderDto.getType() %></td>
		        				<td><%=orderDto.getPayType() %></td>
		        				<td><%=(orderDto.getStatus())?"已繳完":"未繳完" %></td>
		        				<td><a class="btn btn-secondary" href="/order/info?orderId=<%= orderDto.getId() %>">詳情</a></td>
		        			</tr>
		        		<% } %>
		        	</table>
		    	</fieldset>
		    </form>		    
	    </div>
	    <script>
			$(document).ready( function () {
			    $('#myTable').DataTable({
			    	"language":{
                        url: "https://cdn.datatables.net/plug-ins/1.11.3/i18n/zh_Hant.json" 
                    },
                    "lengthMenu":[5, 10, 15],
                    "pageLength":'5',
                    
                    dom: 'Blfrtip',
                    layout: {
    			        topStart: {
    			            buttons: ['copy', 'csv', 'excel', 'pdf', 'print']
    			        }
    			    }
			    });
			} );
		</script>
	</body>
</html>