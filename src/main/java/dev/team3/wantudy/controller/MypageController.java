package dev.team3.wantudy.controller;

import java.util.ArrayList;
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

import dev.team3.wantudy.dto.EnrollDTO;
import dev.team3.wantudy.dto.InterestDTO;
import dev.team3.wantudy.dto.MemberDTO;
import dev.team3.wantudy.dto.MemberInfoDTO;
import dev.team3.wantudy.dto.MemberStudyDTO;
import dev.team3.wantudy.dto.StudyDTO;
import dev.team3.wantudy.service.CategoryService;
import dev.team3.wantudy.service.EnrollService;
import dev.team3.wantudy.service.InterestService;
import dev.team3.wantudy.service.MemberService;
import dev.team3.wantudy.service.MemberStudyService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MypageController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private InterestService interestService;
	
	@Autowired
	private MemberStudyService memberStudyService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private EnrollService enrollService;
	
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
		log.info(((MemberDTO)session.getAttribute("userInfo")).toString());
		try {
			
			int index=0;
			
			List<EnrollDTO> enrollList = memberStudyService.selectAllEnrolls((MemberDTO)session.getAttribute("userInfo"));
			
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
				if(ms.getEnroll_status().equals("심사중")) {
					ms.setStatusImg("/resources/img/status/yellow.png");
				}else if(ms.getEnroll_status().equals("진행중")) {
					ms.setStatusImg("/resources/img/status/green.png");
				}else if(ms.getEnroll_status().equals("완료")) {
					ms.setStatusImg("/resources/img/status/black.png");
				}else if(ms.getEnroll_status().equals("탈락")) {
					ms.setStatusImg("/resources/img/status/red.png");
				}
				ms.setStudy_member_count(enrollService.getMemberCount(ms.getEnroll_study_no()));
				index++;
				memberStudyList.add(ms);
			}
			for(MemberStudyDTO msdto : memberStudyList) {
				log.info(msdto.toString());
			}
			model.addAttribute("memberStudyList", memberStudyList);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "mypage/myapply";
	}                                                                                            
}
