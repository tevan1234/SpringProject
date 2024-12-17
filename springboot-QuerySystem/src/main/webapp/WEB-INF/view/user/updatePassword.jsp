<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Update Password</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css">
		<link rel="stylesheet" href="/querysystem/css/buttons.css">
		
		<script>
	        function showAlertAndRedirect(message, redirectUrl) {
	            alert(message);
	            window.location.href = redirectUrl;
	        }
	    </script>
	</head>
	<body style="background-color: #fff400a6;">
		<%@ include file="/WEB-INF/view/menu.jsp" %>
		<form style="padding: 15px" class="pure-form" method="post" action="/user/update/password">
			<fieldset>
				<legend>Update Password</legend>
					帳號  : ${ userCert.username }<p />
					原密碼: <input type="text" name="oldPassword" placeholder="請輸入原密碼" required /><p /><p />
					新密碼: <input type="text" name="newPassword" placeholder="請輸入新密碼" required /><p />
					<button type="reset" class="button-warning pure-button">Reset</button>
					<button type="submit" class="button-success pure-button">Submit</button>
			</fieldset>
		</form>
		<%
			String message = (String) request.getAttribute("message");
			Boolean redirect = (Boolean) request.getAttribute("redirect");
			if (message != null && Boolean.TRUE.equals(redirect)) {
		%>
		<p class="alert"><%= message %></p>
		<script>
			showAlertAndRedirect("<%= message %>", "/home");
		</script>
		<%
			}
		%>
	</body>
</html>