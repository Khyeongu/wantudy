package dev.team3.wantudy.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
		return "member";
	}
	
	@PostMapping(value="/main")
	public String getchattinglist(@ModelAttribute MemberDTO memberDTO ,Model model, HttpSession session) {
		session.setAttribute("member_no", memberDTO.getNo());
		List<EnrollDTO> enrolllist = chattingService.selectAllEnrolls(memberDTO);
		List<StudyDTO> studylist = new ArrayList<StudyDTO>();
		for(EnrollDTO enroll : enrolllist) {
			int study_no = enroll.getStudy_no();
			StudyDTO studyDTO = chattingService.getStudy(study_no);
			System.out.println(studyDTO.getName());
			studylist.add(studyDTO);
		}
		model.addAttribute("enrolllist",enrolllist);
		model.addAttribute("studylist",studylist);
		return "chat";
	}
	
	@ResponseBody
	@PostMapping(value="/getlog",produces = "application/json; charset = utf-8")
	public HashMap getchattinglog(@RequestParam("study_no") int study_no ,Model model, HttpSession session) {
		List<ChattinglogDTO> chattingloglist = chattingService.getChattinglog(study_no);
		HashMap<String, List<ChattinglogDTO>> chattingloglistmap = new HashMap<String, List<ChattinglogDTO>>();
		
		chattingloglistmap.put("chattingloglist", chattingloglist);
		return chattingloglistmap;
	}
	
	@RequestMapping(value="/insertlog")
	public ModelAndView insertchattinglog(@ModelAttribute ChattinglogDTO chattinglogDTO) {
		chattingService.insertchattinglog(chattinglogDTO);
		return new ModelAndView("chat");
	}
}
