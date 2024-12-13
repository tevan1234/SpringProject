<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Exchange Rate Service</title>
</head>
<body style="background-color: #f4e500">
	<%@ include file="/WEB-INF/view/menu.jsp" %>
	<div style = "padding : 20px">
		<h1>即時查詢外幣匯率</h1>
		<!-- <div>
			<button id="connectButton">連接 WebSocket</button>
			<button id="disconnectButton" disabled>斷開 WebSocket</button>
		</div>
	
		<div style="margin-top: 20px;">
			<button id="subscribeButton" disabled>訂閱查詢匯率服務</button>
			<button id="unsubscribeButton" disabled>取消訂閱查詢匯率服務</button>
		</div> -->
	
		<div style="margin-top: 20px;">
			<h2>接收的訊息</h2>
			<div id="messages"
				style="border: 1px solid #ccc; padding: 10px; height: 360px; overflow-y: scroll;"></div>
		</div>
	</div>
	<script>
        //let websocket;
		// 建立 WebSocket 連線
        const socket = new WebSocket('ws://localhost:8081/rate-service');

        // 當 WebSocket 連線開啟時觸發
        socket.onopen = function(event) {
            console.log('連線成功，發送訂閱指令');
            socket.send('SUBSCRIBE_RATE');  // 自動訂閱匯率服務
        };

        // 當接收到訊息時觸發
        socket.onmessage = function(event) {
            const responseDiv = document.getElementById('messages');
            responseDiv.innerHTML = event.data;  // 顯示來自伺服器的訊息
        };

        // 當 WebSocket 發生錯誤時觸發
        socket.onerror = function(event) {
            console.error('WebSocket 發生錯誤:', event);
        };

        // 當 WebSocket 連線關閉時觸發
        socket.onclose = function(event) {
            console.log('WebSocket 連線已關閉');
        };
        // 日誌函數
        /*const logMessage = (message) => {
            const messagesDiv = document.getElementById("messages");
            //messagesDiv.innerHTML += `\${message}<br>`;
            messagesDiv.innerHTML = `\${message}<br>`;
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
            	//console.log("WebSocket 連接成功");
                logMessage("WebSocket 連接成功！");
                connectButton.disabled = true;
                disconnectButton.disabled = false;
                subscribeButton.disabled = false;
            };
            
        	//websocket.onmessage = (event) => {
           	//	logMessage(`收到訊息：${event.data}`);
        	//};
            websocket.onmessage = (event) => {
    			const data = event.data; // Extract only the message data
    			logMessage(data);
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
        */
    </script>
</body>
</html>