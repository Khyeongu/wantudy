package dev.team3.wantudy.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dev.team3.wantudy.dto.MemberDTO;
import dev.team3.wantudy.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MypageController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping(value = "/mypage/myinfo")
	public String mypage(Locale locale, Model model, HttpSession session) {
		MemberDTO memberdto = new MemberDTO();
		memberdto.setNo(1);
		memberdto.setId("id");
		memberdto.setPassword("password");
		memberdto.setName("name");
		session.setAttribute("userInfo", memberdto);
		return "mypage/myinfo";
	}
	
	@PostMapping(value="/mypage/myinfo")
	public void modifyMemberInfo(@ModelAttribute MemberDTO memberDTO, HttpSession session ) {
		memberDTO.setNo(((MemberDTO)session.getAttribute("userInfo")).getNo());
		memberDTO.setId(((MemberDTO)session.getAttribute("userInfo")).getId());
		log.info(memberDTO.toString());
		try {
			memberService.modifyMemberInfo(memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
