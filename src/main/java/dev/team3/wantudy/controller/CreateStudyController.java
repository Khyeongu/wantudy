package dev.team3.wantudy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dev.team3.wantudy.dto.MemberDTO;
import dev.team3.wantudy.dto.StudyDTO;
import dev.team3.wantudy.service.StudyService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping({ "createStudy" })
public class CreateStudyController {

	@Autowired
	private StudyService studyService;

	/* 스터디 추가 페이지 */
	@GetMapping(value = { "" })
	public String createStudy() {
		return "createStudy/createStudy";
	}

	@PostMapping(value = { "/createstudy" })
	public ModelAndView createStudy(@ModelAttribute StudyDTO studyDTO, HttpSession session,
			HttpServletRequest request) {
		System.out.println("asdfasdf");

		try {
			MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");
			studyDTO.setMember_no(userInfo.getNo());
			log.info(studyDTO.toString());
			studyService.createStudy(studyDTO);

			ModelAndView mav = new ModelAndView("redirect:home/home");
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
