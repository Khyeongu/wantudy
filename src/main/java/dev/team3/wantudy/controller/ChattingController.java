package dev.team3.wantudy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import dev.team3.wantudy.dto.EnrollDTO;
import dev.team3.wantudy.dto.MemberDTO;
import dev.team3.wantudy.dto.StudyDTO;
import dev.team3.wantudy.service.MemberStudyService;

@Controller
public class ChattingController {
	
	@Autowired
	private MemberStudyService chattingService;
	
	@GetMapping(value="/chattingmain")
	public String chattingmain(@ModelAttribute MemberDTO memberDTO ,Model model) {
		List<EnrollDTO> enrolllist = chattingService.selectAllEnrolls(memberDTO);
		List<StudyDTO> studylist = null;
		for(EnrollDTO enroll : enrolllist) {
			int study_no = enroll.getStudy_no();
			StudyDTO studyDTO = chattingService.getStudy(study_no);
			studylist.add(studyDTO);
		}
		return "chatting";
	}
}
