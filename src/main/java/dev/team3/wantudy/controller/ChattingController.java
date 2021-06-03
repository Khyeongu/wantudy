package dev.team3.wantudy.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.team3.wantudy.dto.ChattinglogDTO;
import dev.team3.wantudy.dto.EnrollDTO;
import dev.team3.wantudy.dto.MemberDTO;
import dev.team3.wantudy.dto.StudyDTO;
import dev.team3.wantudy.service.MemberStudyService;

@Controller
@RequestMapping(value="/chatting")
public class ChattingController {
	
	@Autowired
	private MemberStudyService chattingService;
	
	
	@GetMapping(value="/member")
	public String chattingmember() {
		return "chatting/member";
	}
	
	@GetMapping(value="/main")
	public String getchattinglist(Model model, HttpSession session) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("userInfo");
		List<EnrollDTO> enrolllist = chattingService.selectavailableEnrolls(memberDTO);
		List<StudyDTO> studylist = new ArrayList<StudyDTO>();
		Map<Integer,String> lastloglist = new HashMap<Integer,String>();
		
		System.out.println();
		for(EnrollDTO enroll : enrolllist) {
			int study_no = enroll.getStudy_no();
			StudyDTO studyDTO = chattingService.getStudy(study_no);
			System.out.println(studyDTO.getName());
			studylist.add(studyDTO);
			
			try {
				ChattinglogDTO chattinglogDTO = chattingService.getlastlog(study_no);
				lastloglist.put(study_no, chattinglogDTO.getContent());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		model.addAttribute("lastloglist",lastloglist);
		model.addAttribute("enrolllist",enrolllist);
		model.addAttribute("studylist",studylist);
		return "chatting/chat";
	}
	
	@ResponseBody
	@PostMapping(value="/getlog",produces = "application/json; charset = utf-8")
	public HashMap getchattinglog(@RequestParam("study_no") int study_no ,@RequestParam("endNo") int endNo ,Model model, HttpSession session) {
		List<ChattinglogDTO> chattingloglist = chattingService.getChattinglogscroll(study_no,endNo);
		HashMap<String, List<ChattinglogDTO>> chattingloglistmap = new HashMap<String, List<ChattinglogDTO>>();
		
		chattingloglistmap.put("chattingloglist", chattingloglist);
		return chattingloglistmap;
	}
	
	@ResponseBody
	@PostMapping(value="/getmembername",produces = "application/json; charset = utf-8")
	public HashMap getmembername(@RequestParam("member_no") int member_no ) {
		HashMap<String,String> member = new HashMap<String,String>();
		System.out.println("getmembernameController:"+member_no);
		try {
			String member_name = chattingService.getmembername(member_no);
			System.out.println("serviceÈÄ member_name:"+member_name);
			member.put("member_name", member_name);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return member;
	}
	
	
	@RequestMapping(value="/insertlog")
	public ModelAndView insertchattinglog(@ModelAttribute ChattinglogDTO chattinglogDTO) {
		chattingService.insertchattinglog(chattinglogDTO);
		return new ModelAndView("chatting/chat");
	}
}
