package dev.team3.wantudy.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import dev.team3.wantudy.dto.StudyDTO;
import dev.team3.wantudy.service.ChattingService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class SocketHandler extends TextWebSocketHandler {
	@Autowired
	private ChattingService chattingService;
	
	private List<Map<String, Object>> sessionList = new ArrayList<Map<String, Object>>();

	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws IOException {
		System.out.println("πﬁ±‚controller");
		String msg = message.getPayload();
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String,String> mapReceive = objectMapper.readValue(msg,Map.class);

		System.out.println("session:" + session);
		System.out.println("cmd:"+mapReceive.get("cmd"));
		if(mapReceive.get("cmd").equals("Enter")) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("study_no", mapReceive.get("study_no"));
			map.put("session", session);
			map.put("member_no", mapReceive.get("member_no"));
			sessionList.add(map);
			
			System.out.println("¿‘¿Âcontroller");

			for(int i = 0; i<sessionList.size(); i++) {
				Map<String,Object> mapSessionList = sessionList.get(i);
				String study_no = (String) mapSessionList.get("study_no");
				String member_no = (String) mapSessionList.get("member_no");
				WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");
				
				if(study_no.equals(mapReceive.get("study_no"))) {
					Map<String,String> mapToSend = new HashMap<String,String>();
					mapToSend.put("study_no", study_no);
					mapToSend.put("cmd", "Enter");
					mapToSend.put("msg",member_no+"¥‘¿Ã ¿‘¿Â«œºÃΩ¿¥œ¥Ÿ.");
					
					String jsonStr = objectMapper.writeValueAsString(mapToSend);
					sess.sendMessage(new TextMessage(jsonStr));
				}
			}
			
		}
		else {
			for (int i = 0; i < sessionList.size(); i++) {
				Map<String, Object> mapSessionList = sessionList.get(i);
				String study_no = (String) mapSessionList.get("study_no");
				String member_no = (String) mapSessionList.get("member_no");
				WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");

				if (study_no.equals(mapReceive.get("study_no"))) {
					Map<String, String> mapToSend = new HashMap<String, String>();
					mapToSend.put("study_no", study_no);
					mapToSend.put("cmd", "Send");
					mapToSend.put("msg", member_no + " : " + mapReceive.get("msg"));

					String jsonStr = objectMapper.writeValueAsString(mapToSend);
					sess.sendMessage(new TextMessage(jsonStr));
				}
			}

		}
	

	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		log.info("≤˜∞ÂΩ¿¥œ¥Ÿ.");
	}
}
