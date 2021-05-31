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
import dev.team3.wantudy.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping({ "home" })
public class HomeController {

	@Autowired
	private MemberService memberService;

	/* �솃 �럹�씠吏� */
	@GetMapping(value = { "" })
	public String sign() {
		return "home/home";
	}

	@PostMapping(value = { "" })
	public ModelAndView sign(@ModelAttribute MemberDTO memberDTO, HttpSession session, HttpServletRequest request) {

		try {
			memberService.signup(memberDTO);
			MemberDTO userInfo = memberService.getUser(memberDTO);
			session.setAttribute("userInfo", userInfo);
			log.info(userInfo.toString());
			ModelAndView mav = new ModelAndView("redirect:/sign/signupAbilitylvl");
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("/sign/result");
			mav.addObject("msg", "�씠誘� 議댁옱�븯�뒗 �븘�씠�뵒�엯�땲�떎.");
			mav.addObject("url", "javascript:history.back();");
			return mav;
		}

	}

}
