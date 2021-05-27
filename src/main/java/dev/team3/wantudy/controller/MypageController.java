package dev.team3.wantudy.controller;

import java.util.List;
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

import dev.team3.wantudy.dto.InterestDTO;
import dev.team3.wantudy.dto.MemberDTO;
import dev.team3.wantudy.dto.MemberInfoDTO;
import dev.team3.wantudy.service.InterestService;
import dev.team3.wantudy.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MypageController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private InterestService interestService;
	
	@GetMapping(value = "/mypage/myinfo")
	public String mypage(Locale locale, Model model, HttpSession session) {
		MemberDTO memberdto = new MemberDTO();
		memberdto.setNo(1);
		memberdto.setId("id");
		memberdto.setPassword("password");
		memberdto.setName("name");
		session.setAttribute("userInfo", memberdto);
		
		List<InterestDTO> interestList = null;
		try {
			interestList = interestService.getInterest(((MemberDTO)session.getAttribute("userInfo")).getNo());
			log.info(interestList.get(0).toString());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("interestList", interestList);
		
		
		return "mypage/myinfo";
	}
	
	@PostMapping(value="/mypage/myinfo")
	public void modifyMemberInfo(@ModelAttribute MemberInfoDTO memberinfoDTO, HttpSession session ) {
		memberinfoDTO.setNo(((MemberDTO)session.getAttribute("userInfo")).getNo());
		memberinfoDTO.setId(((MemberDTO)session.getAttribute("userInfo")).getId());
		log.info(memberinfoDTO.toString());
		try {
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setNo(memberinfoDTO.getNo());
			memberDTO.setId(memberinfoDTO.getId());
			memberDTO.setName(memberinfoDTO.getName());
			memberDTO.setPassword(memberinfoDTO.getPassword());
			
			int[] interestList = {memberinfoDTO.getInterest1(), memberinfoDTO.getInterest2(), memberinfoDTO.getInterest3()};
			
			for(int i=0; i<3; i++) {
				InterestDTO interestDTO = new InterestDTO();
				interestDTO.setMember_no(memberinfoDTO.getNo());
				interestDTO.setInterest_no(i+1);
				interestDTO.setCategory_no(interestList[i]);
				
				interestService.updateInterest(interestDTO);
			}
			
			memberService.modifyMemberInfo(memberDTO);
			session.setAttribute("userInfo", memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping(value = "/mypage/myapply")
	public String myapply(Locale locale, Model model, HttpSession session) {
		
		List<InterestDTO> interestList = null;
		try {
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "mypage/myapply";
	}
}
