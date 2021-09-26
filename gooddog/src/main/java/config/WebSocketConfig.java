package config;
 
import handler.SocketHandler;
import handler.WebSocketHandler;
import lombok.RequiredArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
 
@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketConfigurer {
	
	@Autowired
	SocketHandler socketHandler;
    
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(socketHandler, "/chating");
	}
}
 