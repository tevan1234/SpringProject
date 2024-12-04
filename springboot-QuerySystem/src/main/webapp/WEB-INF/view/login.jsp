<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login page</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css">
		<link rel="stylesheet" href="/InsuranceSystem/css/buttons.css">
		<style>
			html, body {
				height: 100%;
				margin: 0;
				display: flex;
				justify-content: center;
				align-items: center;
			}
			.wrapper {
				text-align: center;
			}
		</style>
		<script>
	        function showAlertAndRedirect(message, redirectUrl) {
	            alert(message);
	            window.location.href = redirectUrl;
	        }
	    </script>
	</head>
	<body style="padding: 15px ; background-color: #fff400a6;">
		<form class="pure-form" method="post" action="/login">
			<fieldset>
				<legend>🎫Login</legend>
				👤:<input type="text" name="username" placeholder="請輸入帳號" required /><p />
				🔐:<input type="password" name="password" placeholder="請輸入密碼" required /><p />
				<button type="reset" class="pure-button">重置</button>
				<button type="submit" class="pure-button pure-button-primary">登入</button>
			</fieldset>
		</form>
		
		<%
		    String errorMessage = (String) request.getAttribute("errorMessage");
		    Boolean redirect = (Boolean) request.getAttribute("redirect");
		
		    if (errorMessage != null && Boolean.TRUE.equals(redirect)) {
		%>
		    <script>
		        showAlertAndRedirect("<%= errorMessage %>", "/register");
		    </script>
		<%
		    }
		%>
		
	</body>
</html>