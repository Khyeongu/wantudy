package dev.team3.wantudy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;

import dev.team3.wantudy.dto.ChattinglogDTO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class StompChatController {
	
	@Autowired
	private SimpMessageSendingOperations messagingTemplate;
	
	@MessageMapping("/chat/message")
	public void send(ChattinglogDTO message) {
		messagingTemplate.convertAndSend("/sub/chat/room/"+message.getStudy_no(),message);
	}
}
