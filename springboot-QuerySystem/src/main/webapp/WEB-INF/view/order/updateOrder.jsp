<%@page import="querysystem.model.dto.OrderDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	OrderDto orderDto = (OrderDto)request.getAttribute("orderDto");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>更改保單負責人員資料</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css">
		<link rel="stylesheet" href="/querysystem/css/buttons.css">
	</head>
	<body style="background-color: #f4e500">
		<form style="padding: 15px" class="pure-form" method="post" action="order/update">
			<fieldset>
				<legend>更改保單負責人員資料</legend>
				保單序號:<input type="text" name="orderId" value="<%= orderDto.getId() %>" readonly><p />
				負責業務:<input type="text" name="charge" placeholder="請輸入業務姓名" required><p />
				業務聯絡方式:<input type="text" name="contact" placeholder="請輸入電話號碼" required><p />
				繳費狀態:<input type="radio" name="orderStatus" value="true" <%= orderDto.getStatus() ?"checked":"" %>>已繳完
						<input type="radio" name="orderStatus" value="false" <%= orderDto.getStatus() ?"":"checked" %>>未繳完<p />
				<textarea class="form-control" name="comment"><%=orderDto.getComment() %></textarea>
				<button type="submit" class="button-success pure-button">確認修改</button>
			</fieldset>			
		</form>
	</body>
</html>