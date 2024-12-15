<%@page import="querysystem.model.dto.UserDto"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
	List<UserDto>userDtos = (List<UserDto>)request.getAttribute("userDtos");
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>使用者變更</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css">
		<link rel="stylesheet" href="/querysystem/css/buttons.css">
		
		<!-- Jquery -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<!-- CSS -->
		<link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.dataTables.css" />  
		<script src="https://cdn.datatables.net/2.1.8/js/dataTables.js"></script>
		
	</head>
	<body style="background-color: #f4e500">
		<%@ include file="/WEB-INF/view/menu.jsp" %>
		<div style="padding: 15px ">
			<form class="pure-form" method="post" action="/user/add">
				<fieldset>
					<legend>使用者新增</legend>
					身分證字號: <input type="text" name="cardNumber" placeholder="請輸入 身分證字號" required /><p /><p />
					帳號: <input type="text" name="username" placeholder="請輸入 username" required /><p />
					密碼: <input type="text" name="password" placeholder="請輸入 password" required /><p />
					手機: <input type="text" name="phone" placeholder="請輸入 phone" required /><p />
					電郵: <input type="email" name="mail" placeholder="請輸入 email" required /><p />
					權限: <select name="role">
								<option value="CUSTOMER">CUSTOMER</option>
								<option value="EMPLOYEE">EMPLOYEE</option>
								<option value="ADMIN">ADMIN</option>
						  </select><p/>
					<button type="reset" class="button-warning pure-button">重置</button>
					<button type="submit" class="button-success pure-button">送出</button>
				</fieldset>
			</form>
		</div>
		<form class="pure-form" style="padding: 15px">
			<fieldset>
				<legend>使用者列表</legend>
				<table id="myTable" class="pure-table pure-table-bordered" style="background-color: white;">
					<thead>
						<tr>
							<th>ID</th><th>權限</th><th>身分證字號</th><th>帳號</th><th>手機</th><th>郵件</th><th>帳號啟用</th>
							<th>修改</th><th>刪除</th>
						</tr>
					</thead>
					<%for(UserDto userDto : userDtos) { %>
						<tr>
							<td><%= userDto.getId() %></td>
							<td><%= userDto.getRole() %></td>
							<td><%= userDto.getCardNumber() %></td>
							<td><%= userDto.getName() %></td>
							<td><%= userDto.getPhone() %></td>
							<td><%= userDto.getMail() %></td>
							<td><%= userDto.isActive()%></td>
							
							<td><a href="/user/get?username=<%= userDto.getName() %>" class="button-secondary pure-button">修改</a></td>
							<td><a href="/user/delete?userId=<%= userDto.getId() %>" class="button-error pure-button">刪除</a></td>
						</tr>
					<% } %>
				</table>
			</fieldset>
		</form>
		<script>
			$(document).ready( function () {
			    $('#myTable').DataTable({
			    	"language":{
                        url: "https://cdn.datatables.net/plug-ins/1.11.3/i18n/zh_Hant.json" 
                    },
                    "lengthMenu":[5, 10, 15],
                    "pageLength":'5'
			    });
			} );
		</script>
	</body>
</html>