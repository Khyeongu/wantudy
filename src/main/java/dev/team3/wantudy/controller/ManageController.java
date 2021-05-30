package dev.team3.wantudy.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import dev.team3.wantudy.dto.EnrollDTO;
import dev.team3.wantudy.dto.InterestDTO;
import dev.team3.wantudy.dto.MemberDTO;
import dev.team3.wantudy.dto.MemberStudyDTO;
import dev.team3.wantudy.dto.StudyDTO;
import dev.team3.wantudy.service.CategoryService;
import dev.team3.wantudy.service.EnrollService;
import dev.team3.wantudy.service.InterestService;
import dev.team3.wantudy.service.MemberService;
import dev.team3.wantudy.service.MemberStudyService;
import dev.team3.wantudy.service.StudyService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ManageController {
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private EnrollService enrollService;
		
	@Autowired
	private StudyService studyService;
	
	
	@GetMapping(value = "/manage/mystudy")
	public String mystudy(Locale locale, Model model, HttpSession session) {
		log.info(((MemberDTO)session.getAttribute("userInfo")).toString());
		
		try {
			List<StudyDTO> mystudyList = studyService.getMemberStudy(((MemberDTO)session.getAttribute("userInfo")).getNo());
			List<MemberStudyDTO> memberStudyList = new ArrayList<MemberStudyDTO>();
			
			for(StudyDTO s : mystudyList) {
				MemberStudyDTO ms = new MemberStudyDTO();
				EnrollDTO e = new EnrollDTO();
				
				e=enrollService.selectMemberStudyEnroll(s);
				
				ms.setEnroll_member_no(((MemberDTO)session.getAttribute("userInfo")).getNo());
				ms.setEnroll_study_no(s.getNo());
				ms.setEnroll_status(e.getStatus());
				ms.setEnroll_skip(e.getSkip());
				ms.setStudy_name(s.getName());
				ms.setStudy_content(s.getContent());
				ms.setStudy_startdate(s.getStartdate());
				ms.setStudy_enddate(s.getEnddate());
				ms.setStudy_capacity(s.getCapacity());
				ms.setStudy_member_no(((MemberDTO)session.getAttribute("userInfo")).getNo());
				ms.setStudy_category(categoryService.getCategory(s.getCategory_no()));
				ms.setStudy_member_count(enrollService.getMemberCount(s.getNo()));
				if(ms.getEnroll_status().equals("심사중")) {
					ms.setStatusImg("/resources/img/status/yellow.png");
				}else if(ms.getEnroll_status().equals("진행중")) {
					ms.setStatusImg("/resources/img/status/green.png");
				}else if(ms.getEnroll_status().equals("종료")) {
					ms.setStatusImg("/resources/img/status/black.png");
				}else if(ms.getEnroll_status().equals("탈락")) {
					ms.setStatusImg("/resources/img/status/red.png");
				}
				memberStudyList.add(ms);
			}
			model.addAttribute("memberStudyList", memberStudyList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/manage/mystudy";
	}             
	
	@GetMapping(value = "/manage/studyinfo/{study_no}")
	public String mystudy(@PathVariable int study_no, Model model, HttpSession session) {
		
		return "/manage/studyinfo";
	}

}
