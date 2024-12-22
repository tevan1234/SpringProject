<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>忘記密碼</title>
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
		<form style="padding: 15px" class="pure-form" method="post" action="/user/reset/sendMail">
            <fieldset>
                <legend>重設新密碼</legend>
                帳戶: <input type="text" name="username" placeholder="請輸入 username" required /><p /><p />
                電郵: <input type="email" name="mail" placeholder="請輸入綁定 email" required /><p />
                <button type="submit" class="button-secondary pure-button"  onclick="show()">送出</button>
            </fieldset>
        </form>		
		
		<%
			String message = (String) request.getAttribute("message");
			Boolean redirect = (Boolean) request.getAttribute("redirect");
			if (message != null && Boolean.TRUE.equals(redirect)) {
		%>
		<p class="alert"><%= message %></p>
		<script>
			showAlertAndRedirect("<%= message %>", "/user/reset/sendMail");
		</script>
		<%
			}
		%>
	</body>
</html>