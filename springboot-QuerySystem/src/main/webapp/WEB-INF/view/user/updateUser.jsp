<%@page import="querysystem.model.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserDto userDto = (UserDto)request.getAttribute("userDto");
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Update User information</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css">
		<link rel="stylesheet" href="/querysystem/css/buttons.css">
	</head>
	<body style="background-color: #f4e500">
		<%@ include file="/WEB-INF/view/menu.jsp" %>
		<form style="padding: 15px" class="pure-form" method="post" action ="/user/update">
			<fieldset>
				<legend>更新使用者資料</legend>
				序號: <input type="text" name="userId" value="<%=userDto.getId() %>" readonly /><p />
				帳號: <input type="text" name="username" value="<%=userDto.getName() %>" readonly /><p />				
				啟用: <input type = "radio" name="active" value="true" <%=userDto.isActive() ? "checked" : ""%>>True
					  <input type = "radio" name="active" value="false" <%=userDto.isActive() ? "" : "checked"%>>False<p />
							
				權限: <select name="role">
							<option value="ADMIN" <%=userDto.getRole().equals("ADMIN")?"selected":"" %>>ADMIN</option>
							<option value="EMPLOYEE" <%=userDto.getRole().equals("EMPLOYEE")?"selected":"" %>>EMPLOYEE</option>
							<option value="CUSTOMER" <%=userDto.getRole().equals("CUSTOMER")?"selected":"" %>>CUSTOMER</option>
					  </select><p />
				<button type="submit" class="button-success pure-button">Update</button>
			</fieldset>		
		</form>
	</body>
</html>