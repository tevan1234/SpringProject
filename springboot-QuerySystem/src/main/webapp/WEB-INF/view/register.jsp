<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>註冊帳戶</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css">
        <link rel="stylesheet" href="/querysystem/css/buttons.css">
        <script>
            // 讀取 Cookie 的工具函數
            function getCookie(name) {
 
            	const allCookies = document.cookie;
                const value = allCookies;
               	console.log(value);
                const parts = value.split(`=`); // 分割找到的 Cookie
               	console.log(parts);

                if (parts.length === 2) {
                    const code = parts.pop().shift(); // 提取指定 Cookie 的值
                   	console.log(code);

                    return parseInt(code, 10); // 將字符串轉換為整數（基數 10）
                }
                return null; // 如果找不到，返回 null
            }

            // 驗證用戶輸入的驗證碼
            function validateCodeInput(event) {
                const userInput = document.querySelector('input[name="code"]').value.trim();
                const emailInput = document.querySelector('input[name="mail"]').value.trim();
                const storedCode = getCookie("verifycode");
				console.log(storedCode);
				if (emailInput === "" || userInput === "") {
		            return; // 不執行任何驗證
		        }
                if (!storedCode) {
                    alert("驗證碼已過期或不存在，請重新發送驗證碼！");
                    event.preventDefault(); // 阻止表單提交
                    return;
                }

                if (parseInt(userInput, 10) !== storedCode) {
                    alert("驗證碼錯誤！");
                    event.preventDefault(); // 阻止表單提交
                    return;
                }
				if(window.confirm("驗證成功！")){
				    alert("驗證成功！");
				}else{
					return;
				}
            }
            
        </script>
    </head>
    <body style="background-color: #f4e500">
    	<%@ include file="/WEB-INF/view/menu.jsp" %>
        <div style="padding: 15px">
            <!-- 發送驗證碼功能 -->
            <form class="pure-form" method="post" action="/register/sendMail">
                <fieldset>
                    <legend>綁定郵件</legend>
                    電郵: <input type="email" name="mail" placeholder="選填 email" required />
                    <button type="submit" class="button-secondary pure-button">發送驗證碼</button>
                </fieldset>
            </form>

            <!-- 註冊帳戶功能 -->
            <form class="pure-form" method="post" action="/register/active" onsubmit="validateCodeInput(event)">
                <fieldset>
                    <legend>註冊帳號</legend>
                    身分證字號: <input type="text" name="cardNumber" placeholder="請輸入 身分證字號" required /><p />
                    帳號: <input type="text" name="username" placeholder="請輸入 username" required /><p />
                    密碼: <input type="text" name="password" placeholder="請輸入 password" required /><p />
                    手機: <input type="text" name="phone" placeholder="請輸入 phone" required /><p />
                    電郵: <input type="email" name="mail" placeholder="選填 email" value="<%= session.getAttribute("savedMail") != null ? session.getAttribute("savedMail") : "" %>"  /><p />
                    驗證碼: <input type="text" name="code" placeholder="請輸入 四位數驗證碼"  /><p />
                    <button type="reset" class="button-warning pure-button">Reset</button>
                    <button type="submit" class="button-success pure-button">Submit</button>
                </fieldset>
            </form>
        </div>
    </body>
</html>
