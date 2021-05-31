package dev.team3.wantudy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dev.team3.wantudy.dto.CategoryDTO;
import dev.team3.wantudy.dto.EnrollDTO;
import dev.team3.wantudy.dto.MemberDTO;
import dev.team3.wantudy.dto.StudyDTO;
import dev.team3.wantudy.service.CategoryService;
import dev.team3.wantudy.service.StudyService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping({ "createStudy" })
public class CreateStudyController {

	@Autowired
	private StudyService studyService;

	@Autowired
	private CategoryService categoryService;

	/* 스터디 추가 페이지 */
	@GetMapping(value = { "" })
	public String createStudy(Model model, HttpSession session) {
		MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");
		session.setAttribute("userInfo", userInfo);

		List<CategoryDTO> categoryList = null;

		try {
			categoryList = categoryService.getCategoryAll();
			model.addAttribute("categoryList", categoryList);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "createStudy/createStudy";
	}

	@PostMapping(value = { "" })
	public ModelAndView createStudy(@ModelAttribute StudyDTO studyDTO, Model model, HttpSession session) {
		try {
			MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");

			studyDTO.setMember_no(userInfo.getNo());
			int studyno = studyService.createStudyNo();
			studyDTO.setNo(studyno);
			
			EnrollDTO enrollDTO = new EnrollDTO();
			enrollDTO.setMember_no(userInfo.getNo());
			enrollDTO.setStudy_no(studyDTO.getNo());

			
			studyService.createStudy(studyDTO);
			studyService.insertStudyMasterEnroll(enrollDTO);

			ModelAndView mav = new ModelAndView("redirect:/home");
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("/sign/result");
			mav.addObject("msg", "스터디 생성 실패.");
			mav.addObject("url", "javascript:history.back();");
			return mav;
		}

	}
}
