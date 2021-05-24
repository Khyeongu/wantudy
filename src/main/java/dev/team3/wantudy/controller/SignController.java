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
import dev.team3.wantudy.service.SignService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("")
public class SignController {

	@Autowired
	private SignService signService;

	@GetMapping(value = { "", "sign" })
	public String sign() {
		return "sign";
	}

	@PostMapping(value = { "", "sign" })
	public ModelAndView sign(@ModelAttribute MemberDTO memberDTO, HttpSession session, HttpServletRequest request) {

		if (memberDTO.getPassword().equals(memberDTO.getConfirmPassword())) {
			try {
				signService.signup(memberDTO);
				log.info(memberDTO.toString());
				ModelAndView mav = new ModelAndView("result");
				mav.addObject("msg", "Signup complete. Please sign in.");
				mav.addObject("url", "/signin");
				return mav;
			} catch (Exception e) {
				e.printStackTrace();
				ModelAndView mav = new ModelAndView("result");
				mav.addObject("msg", "Failed Signup. ID is already used.");
				mav.addObject("url", "javascript:history.back();");
				return mav;
			}
		} else {

			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "Password and Confirm Password don\\\'t match.");
			mav.addObject("url", "javascript:history.back();");
			return mav;
		}

	}

	@GetMapping("/signin")
	public String signin() {
		return "signin";
	}

}
