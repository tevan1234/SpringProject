<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login Page</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css">
		<link rel="stylesheet" href="/InsuranceSystem/css/buttons.css">
		<style>
			html, body {
				height: 100%;
				margin: 0;
				display: flex;
				justify-content: center;
				align-items: center;
				font-family: Arial, sans-serif;
				background: linear-gradient(135deg, #f4e500, #ff9900);
				color: #333;
			}
			.wrapper {
				text-align: center;
				background: #fff;
				border-radius: 10px;
				box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
				padding: 30px;
				width: 400px; /* 增加寬度 */
				animation: fadeIn 1s ease-in-out;
			}
			@keyframes fadeIn {
				from { opacity: 0; transform: translateY(-20px); }
				to { opacity: 1; transform: translateY(0); }
			}
			legend {
				font-size: 28px;
				font-weight: bold;
				margin-bottom: 20px;
				color: #ff5722;
			}
			input[type="text"], input[type="password"] {
				width: calc(100% - 20px);
				padding: 12px;
				margin: 12px 0;
				border: 1px solid #ccc;
				border-radius: 5px;
				box-sizing: border-box;
				font-size: 14px;
			}
			.buttons {
				display: grid;
				grid-template-columns: repeat(2, 1fr); /* 2 列 */
				grid-gap: 10px; /* 按鈕間距 */
				margin-top: 10px;
			}
			button {
				width: 100%; /* 使按鈕填滿格子 */
				padding: 12px;
				border: none;
				border-radius: 5px;
				font-size: 16px;
				cursor: pointer;
				transition: background-color 0.3s, color 0.3s;
			}
			button[type="reset"] {
				background-color: #e0e0e0;
				color: #333;
			}
			button[type="submit"] {
				background-color: #ff5722;
				color: white;
			}
			button:hover {
				opacity: 0.9;
			}
			button:focus {
				outline: none;
				box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
			}
			button[type="button"] {
				background-color: #007bff;
				color: white;
			}
			button[type="button"]:hover {
				background-color: #0056b3;
			}
			.alert {
				color: red;
				font-weight: bold;
				margin-top: 15px;
			}
		</style>
		<script>
	        function showAlertAndRedirect(message, redirectUrl) {
	            alert(message);
	            window.location.href = redirectUrl;
	        }
	    </script>
	</head>
	<body>
		<div class="wrapper">
			<form class="pure-form" method="post" action="/login">
				<fieldset>
					<legend>🎫 Login</legend>
					<label for="username">👤 帳號：</label>
					<input type="text" id="username" name="username" placeholder="請輸入帳號" required />
					<label for="password">🔐 密碼：</label>
					<input type="password" id="password" name="password" placeholder="請輸入密碼" required />
					<div class="buttons">
						<button type="reset" class="pure-button">重置</button>
						<button type="submit" class="pure-button pure-button-primary">登入</button>
						<button type="button" class="pure-button" onclick="window.location.href='/user/reset/sendMail';">忘記密碼</button>
						<button type="button" class="pure-button" onclick="window.location.href='/register';">註冊</button>
					</div>
				</fieldset>
			</form>
			<%
			    String errorMessage = (String) request.getAttribute("errorMessage");
			    Boolean redirect = (Boolean) request.getAttribute("redirect");
			    if (errorMessage != null && Boolean.TRUE.equals(redirect)) {
			%>
				<p class="alert"><%= errorMessage %></p>
				<script>
				    showAlertAndRedirect("<%= errorMessage %>", "/login");
				</script>
			<%
			    }
			%>
		</div>
	</body>
</html>
