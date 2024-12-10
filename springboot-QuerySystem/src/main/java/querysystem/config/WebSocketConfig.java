package querysystem.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

import querysystem.service.impl.ExchangeServiceImpl;

@Configuration
public class WebSocketConfig {
	
	@Bean
	public ServerEndpointExporter serverEndpointExporter() {
		ServerEndpointExporter exporter = new ServerEndpointExporter();
		// 註冊 WebSocket 端點
		// 門號: /channel/chat, /time-service
		
		exporter.setAnnotatedEndpointClasses(ExchangeServiceImpl.class);
		return exporter;
	}
	
}