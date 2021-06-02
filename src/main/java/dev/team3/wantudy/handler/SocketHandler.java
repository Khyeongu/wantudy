package dev.team3.wantudy.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import dev.team3.wantudy.service.MemberStudyService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class SocketHandler extends TextWebSocketHandler {
	@Autowired
	private MemberStudyService chattingService;
	
	private List<Map<String, Object>> sessionList = new ArrayList<Map<String, Object>>();

	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws IOException {
		System.out.println("chatting controller");
		String msg = message.getPayload();
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String,String> mapReceive = objectMapper.readValue(msg,Map.class);
		int alreadyin = 0;
		
		System.out.println("session:" + session);
		System.out.println("cmd:"+mapReceive.get("cmd"));
		if(mapReceive.get("cmd").equals("Enter")) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("study_no", mapReceive.get("study_no"));
			map.put("session", session);
			map.put("member_no", mapReceive.get("member_no"));
			
			//이미 있는 session이면 등록 안함
			for(int i = 0; i<sessionList.size(); i++) {
				Map<String,Object> mapSessionList = sessionList.get(i);
				String study_no = (String) mapSessionList.get("study_no");
				String member_no = (String) mapSessionList.get("member_no");
				WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");
				
				System.out.println("sess:"+sess);
				System.out.println(mapReceive.get("study_no"));
				
				if(session.equals(sess) && member_no.equals(mapReceive.get("member_no")) && study_no.equals(mapReceive.get("study_no")) ) {
					alreadyin = 1;
				}
			
			}
			System.out.println("sessionin:"+alreadyin);
			if(alreadyin == 0) {
				sessionList.add(map);
			}

			
			System.out.println("입장controller");
			System.out.println("sessionList:"+sessionList);
			
			for(int i = 0; i<sessionList.size(); i++) {
				Map<String,Object> mapSessionList = sessionList.get(i);
				String study_no = (String) mapSessionList.get("study_no");
				String member_no = (String) mapSessionList.get("member_no");
				WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");
				System.out.println("sess:"+sess);
				System.out.println(mapReceive.get("study_no"));
				
				if(study_no.equals(mapReceive.get("study_no"))) {
					Map<String,String> mapToSend = new HashMap<String,String>();
					mapToSend.put("study_no", study_no);
					mapToSend.put("member_no", (String)map.get("member_no"));
					mapToSend.put("cmd", "Enter");
					mapToSend.put("msg","님이 입장하셨습니다.");
					
					String jsonStr = objectMapper.writeValueAsString(mapToSend);
					sess.sendMessage(new TextMessage(jsonStr));
				}
			}
			
		}
		else {
			System.out.println("sessionList:"+sessionList);
			for (int i = 0; i < sessionList.size(); i++) {
				Map<String, Object> mapSessionList = sessionList.get(i);
				String study_no = (String) mapSessionList.get("study_no");
				String member_no = (String) mapSessionList.get("member_no");
				WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");

				
				if (study_no.equals(mapReceive.get("study_no"))) {
					Map<String, String> mapToSend = new HashMap<String, String>();
					mapToSend.put("study_no", study_no);
					mapToSend.put("cmd", "Send");
					mapToSend.put("member_no", mapReceive.get("member_no"));
					mapToSend.put("msg", mapReceive.get("msg"));

					String jsonStr = objectMapper.writeValueAsString(mapToSend);
					sess.sendMessage(new TextMessage(jsonStr));
				}
			}

		}
	

	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		ObjectMapper objectMapper = new ObjectMapper();
		String now_study_no="";
		for (int i = 0 ; i <sessionList.size(); i++) {
			Map<String,Object> map = sessionList.get(i);
			String study_no = (String) map.get("study_no");
			WebSocketSession sess  = (WebSocketSession) map.get("session");
			
			if(session.equals(sess)) {
				now_study_no = study_no;
				sessionList.remove(map);
				break;
			}
		}
		log.info("socket연결끊김");
	}
}
