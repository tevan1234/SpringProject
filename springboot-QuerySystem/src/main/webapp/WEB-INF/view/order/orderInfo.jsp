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
		<title>查看保單詳情</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css">
		<link rel="stylesheet" href="/querysystem/css/buttons.css">
	</head>
	<body style="background-color: #f4e500">
		<%@ include file="/WEB-INF/view/menu.jsp" %>			
		<form id="form1" class="row g-3" style="padding: 15px ;">
			
			<h1>保單編號 : <%= orderDto.getId() %></h1>
			<div class="col-md-6">
				<label for="inputEmail4" class="form-label">要保人</label> 
				<input type="text" class="form-control" value="${ orderDto.holder }" readonly>
			</div>
			<div class="col-md-6">
				<label for="inputPassword4" class="form-label">要保人身分證字號</label> 
				<input type="text" class="form-control" value="${ orderDto.holderCardNumber }" readonly>
			</div>
			<div class="col-md-6">
				<label for="inputEmail4" class="form-label">被保人</label> 
				<input type="text" class="form-control" value="${ orderDto.insured }" readonly>
			</div>
			<div class="col-md-6">
				<label for="inputPassword4" class="form-label">被保人身分證字號</label> 
				<input type="text" class="form-control" value="${ orderDto.insuredCardNumber }" readonly>
			</div>
			<div class="col-3">
				<label for="inputAddress" class="form-label">保險種類</label> 
				<input type="text" class="form-control" value=<%= orderDto.getType() %> readonly>
			</div>
			<div class="col-3">
				<label for="inputAddress" class="form-label">繳費年期</label> 
				<input type="text" class="form-control" value=<%= orderDto.getPayType() %> readonly>
			</div>
			<div class="col-3">
				<label for="inputAddress" class="form-label">保額</label> 
				<input type="text" class="form-control" value=<%= orderDto.getOrderPrice() %> readonly>
			</div>
			<div class="col-3">
				<label for="inputAddress" class="form-label">簽約日期</label> 
				<input type="date" class="form-control" value=<%= orderDto.getDate() %> readonly>
			</div>
			<div class="col-6">
				<label for="inputAddress2" class="form-label">負責業務</label> 
				<input type="text" class="form-control" value=<%= orderDto.getCharge() %> readonly>
			</div>
			<div class="col-md-6">
				<label for="inputCity" class="form-label">負責業務聯絡方式</label> 
				<input type="text" class="form-control" value=<%= orderDto.getContact() %> readonly>
			</div>
			<p/>
			<div class="col-12">
				<div class="input-group">
					<span class="input-group-text">備註</span>
					<textarea class="form-control" aria-label="With textarea" placeholder="限制100字以內" readonly><%= orderDto.getComment() %></textarea>
				</div>
			</div>
			<div class="col-12">
				<a href="/order" class="button-secondary pure-button" style="display: ${userCert.role == 'EMPLOYEE' || userCert.role == 'ADMIN' ? 'inline-block' : 'none'};">返回上一頁</a>
				<a href="/user/info?cardNumber=${ userCert.cardNumber }" class="button-secondary pure-button" style="display: ${userCert.role == 'CUSTOMER' ? 'inline-block' : 'none'};">返回上一頁</a>
				
			</div>
		</form>
	</body>
</html>