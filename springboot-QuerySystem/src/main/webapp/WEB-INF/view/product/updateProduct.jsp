<%@page import="querysystem.model.dto.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ProductDto productDto = (ProductDto)request.getAttribute("productDto");
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>更新商品資料</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css">
		<link rel="stylesheet" href="/querysystem/css/buttons.css">
	</head>
	<body style="background-color: #f4e500">
		<%@ include file="/WEB-INF/view/menu.jsp" %>
		<form style="padding: 15px" class="pure-form" method="post" action ="/product/update">
			<fieldset>
				<legend>更新商品資料</legend>
				序號: <input type="text" name="productId" value="<%=productDto.getId() %>" readonly /><p />
				保險種類: <select name="productType">
							<option value="汽車險" <%=productDto.getType().equals("汽車險")?"selected":"" %>>汽車險</option>
							<option value="旅平險" <%=productDto.getType().equals("旅平險")?"selected":"" %>>旅平險</option>
							<option value="重大傷病險" <%=productDto.getType().equals("重大傷病險")?"selected":"" %>>重大傷病險</option>
							<option value="意外險" <%=productDto.getType().equals("意外險")?"selected":"" %>>意外險</option>
							<option value="天災險" <%=productDto.getType().equals("天災險")?"selected":"" %>>天災險</option>
							<option value="儲蓄險" <%=productDto.getType().equals("儲蓄險")?"selected":"" %>>儲蓄險</option>
					  </select><p />
				年繳額:<input type="text" name="price" placeholder="請輸入年繳額" required /><p />
				商品上架: <input type = "radio" name="productStatus" value="true" <%=productDto.getStatus() ? "checked" : ""%>>在售
					  	  <input type = "radio" name="productStatus" value="false" <%=productDto.getStatus() ? "" : "checked"%>>已停售<p />
				
				<button type="submit" class="button-success pure-button">Update</button>
			</fieldset>		
		</form>
	</body>
</html>