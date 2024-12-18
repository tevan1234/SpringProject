<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Exchange Rate Service</title>
</head>
<body>
	<h1>Exchange Rate Service</h1>
	<div>
		<button id="connectButton">連接 WebSocket</button>
		<button id="disconnectButton" disabled>斷開 WebSocket</button>
	</div>

	<div style="margin-top: 20px;">
		<button id="subscribeButton" disabled>訂閱查詢匯率服務</button>
		<button id="unsubscribeButton" disabled>取消訂閱查詢匯率服務</button>
	</div>

	<div style="margin-top: 20px;">
		<h2>接收的訊息</h2>
		<div id="messages"
			style="border: 1px solid #ccc; padding: 10px; height: 350px; overflow-y: scroll;"></div>
	</div>

	<script>
        let websocket;

        // 日誌函數
        const logMessage = (message) => {
            const messagesDiv = document.getElementById("messages");
            //messagesDiv.innerHTML += `${message}<br>`;
            messagesDiv.innerHTML = `${message}<br>`;
            //messagesDiv.scrollTop = messagesDiv.scrollHeight; // 滾動到最底部
        };

        // 按鈕元素
        const connectButton = document.getElementById("connectButton");
        const disconnectButton = document.getElementById("disconnectButton");
        const subscribeButton = document.getElementById("subscribeButton");
        const unsubscribeButton = document.getElementById("unsubscribeButton");

        // 連接 WebSocket
        connectButton.onclick = () => {
            websocket = new WebSocket("ws://localhost:8081/rate-service");

            websocket.onopen = () => {
                logMessage("WebSocket 連接成功！");
                connectButton.disabled = true;
                disconnectButton.disabled = false;
                subscribeButton.disabled = false;
            };

            websocket.onmessage = (event) => {
                logMessage(`收到訊息：${event.data}`);
            };

            websocket.onclose = () => {
                logMessage("WebSocket 已斷開連接");
                connectButton.disabled = false;
                disconnectButton.disabled = true;
                subscribeButton.disabled = true;
                unsubscribeButton.disabled = true;
            };

            websocket.onerror = (error) => {
                logMessage("WebSocket 發生錯誤");
                console.error(error);
            };
        };

        // 斷開 WebSocket
        disconnectButton.onclick = () => {
            if (websocket) {
                websocket.close();
                logMessage("主動斷開 WebSocket 連接");
            }
        };

        // 訂閱時間服務
        subscribeButton.onclick = () => {
            if (websocket && websocket.readyState === WebSocket.OPEN) {
                websocket.send("SUBSCRIBE_RATE");
                logMessage("已發送訂閱指令");
                subscribeButton.disabled = true;
                unsubscribeButton.disabled = false;
            }
        };

        // 取消訂閱時間服務
        unsubscribeButton.onclick = () => {
            if (websocket && websocket.readyState === WebSocket.OPEN) {
                websocket.send("UNSUBSCRIBE_RATE");
                logMessage("已發送取消訂閱指令");
                subscribeButton.disabled = false;
                unsubscribeButton.disabled = true;
            }
        };
    </script>
</body>
</html>