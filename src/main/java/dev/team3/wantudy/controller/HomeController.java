package dev.team3.wantudy.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dev.team3.wantudy.dto.EnrollDTO;
import dev.team3.wantudy.dto.MemberDTO;
import dev.team3.wantudy.dto.MemberStudyDTO;
import dev.team3.wantudy.dto.StudyDTO;
import dev.team3.wantudy.service.CategoryService;
import dev.team3.wantudy.service.EnrollService;
import dev.team3.wantudy.service.MemberStudyService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
		
	@Autowired
	private MemberStudyService memberStudyService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private EnrollService enrollService;
	

	@GetMapping(value = "/home")
	public String home(Locale locale, Model model, HttpSession session) {
		log.info(((MemberDTO)session.getAttribute("userInfo")).toString());
		try {
			
			int index=0;
			
			List<EnrollDTO> enrollList = memberStudyService.selectStudyingEnrolls((MemberDTO)session.getAttribute("userInfo"));
			
			List<MemberStudyDTO> memberStudyList = new ArrayList<MemberStudyDTO>();
			for(EnrollDTO enroll : enrollList) {
				MemberStudyDTO ms = new MemberStudyDTO();
				int study_no = enroll.getStudy_no();
				StudyDTO studyDTO = memberStudyService.getStudy(study_no);
				
				ms.setEnroll_member_no(((MemberDTO)session.getAttribute("userInfo")).getNo());
				ms.setEnroll_study_no(enrollList.get(index).getStudy_no());
				ms.setEnroll_status(enrollList.get(index).getStatus());
				ms.setEnroll_skip(enrollList.get(index).getSkip());
				ms.setStudy_name(studyDTO.getName());
				ms.setStudy_content(studyDTO.getContent());
				ms.setStudy_startdate(studyDTO.getStartdate());
				ms.setStudy_enddate(studyDTO.getEnddate());
				ms.setStudy_capacity(studyDTO.getCapacity());
				ms.setStudy_member_no(studyDTO.getMember_no());
				ms.setStudy_category(categoryService.getCategory(studyDTO.getCategory_no()));
				ms.setCategory_imgpath(memberStudyService.getCategoryImgpath(studyDTO.getCategory_no()));
				if(ms.getEnroll_status().equals("심사중")) {
					ms.setStatusImg("/resources/img/status/yellow.png");
				}else if(ms.getEnroll_status().equals("진행중")) {
					ms.setStatusImg("/resources/img/status/green.png");
				}else if(ms.getEnroll_status().equals("종료")) {
					ms.setStatusImg("/resources/img/status/black.png");
				}else if(ms.getEnroll_status().equals("탈락")) {
					ms.setStatusImg("/resources/img/status/red.png");
				}
				ms.setStudy_member_count(enrollService.getMemberCount(ms.getEnroll_study_no()));
				index++;
				memberStudyList.add(ms);
			}
			model.addAttribute("memberStudyList", memberStudyList);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/home/home";
	}
	
	@PostMapping(value = "/home")
	@ResponseBody
	public void addStudyNoToSession(Locale locale, @RequestParam(value = "study_no") int study_no, Model model, HttpSession session) {
		session.setAttribute("study_no", study_no);
	}
}
