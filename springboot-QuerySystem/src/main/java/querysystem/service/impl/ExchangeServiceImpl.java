package querysystem.service.impl;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import org.springframework.stereotype.Service;

import jakarta.websocket.OnClose;
import jakarta.websocket.OnError;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;
import querysystem.util.ExchangeRate;

@ServerEndpoint(value = "/rate-service")
public class ExchangeServiceImpl{

private static final Set<Session> subscribers = Collections.synchronizedSet(new HashSet<>());
	
	private static final ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
	
	static {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss E");
		
		Runnable task = () -> {
			Map<String, String[]> map = ExchangeRate.getRate();
			StringBuilder messageBuilder = new StringBuilder();
			
			messageBuilder.append("<table style='border: 1px solid black ; border-collapse: collapse ; text-align : center'>")
            .append("<tr>")
            .append("<th>幣別</th><th>更新時間</th><th>現金買入</th>")
            .append("<th>現金賣出</th><th>即期買入</th><th>即期賣出</th><th>查詢時間</th>")
            .append("</tr>");

			map.forEach((key, value) -> {
			  messageBuilder.append("<tr>")
			                .append("<td>").append(key).append("</td>")
			                .append("<td>").append(value[0]).append("</td>")
			                .append("<td>").append(value[1]).append("</td>")
			                .append("<td>").append(value[2]).append("</td>")
			                .append("<td>").append(value[3]).append("</td>")
			                .append("<td>").append(value[4]).append("</td>")
			                .append("<td>").append(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss E").format(new Date())).append("</td>")
			                .append("</tr>");
			});

			// 關閉 HTML 表格
			messageBuilder.append("</table>");
			
			String message = messageBuilder.toString();
			for(Session session : subscribers) {
				sendMessage(session, message);
			}
		};
		scheduler.scheduleAtFixedRate(task, 0, 3, TimeUnit.SECONDS);
	}
	
	@OnOpen
	public void onOpen(Session session) {
		// 發送歡迎消息
		sendMessage(session, "Welcome! 可用指令: SUBSCRIBE_RATE, UNSUBSCRIBE_RATE");
	}
	
	@OnMessage
	public void onMessage(Session session, String message) {
		switch(message) {
			case "SUBSCRIBE_RATE":
				subscribers.add(session); // 加入訂閱
				sendMessage(session, "[已訂閱]查詢匯率服務成功");
				break;
			case "UNSUBSCRIBE_RATE":
				subscribers.remove(session); // 取消訂閱
				sendMessage(session, "[已取消]查詢匯率服務成功");
				break;
			default:
				sendMessage(session, "指令錯誤! 可用指令: SUBSCRIBE_RATE, UNSUBSCRIBE_RATE");
		}
	}
	
	@OnClose
	public void onClose(Session session) {
		// 客戶端斷開連線時要取消該客戶的訂閱
		subscribers.remove(session);
		sendMessage(session, "[已取消]查詢匯率服務成功, 因客戶端斷開連線");
	}
	
	@OnError
	public void onError(Session session, Throwable throwable) {
		// 出現錯誤時取消訂閱
		subscribers.remove(session);
		// 印出錯誤訊息
		throwable.printStackTrace();
	}
	
	// 發送訊息
	private static void sendMessage(Session session, String message) {
		try {
			if(session.isOpen()) {
				session.getBasicRemote().sendText(message); // 同步送出
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
