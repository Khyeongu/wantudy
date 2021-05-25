package dev.team3.wantudy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.team3.wantudy.dto.MemberDTO;
import dev.team3.wantudy.service.SignService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping
public class SignController {

	@Autowired
	private SignService signService;

	/* �� ù��° ������ */
	@GetMapping(value = { "", "/sign" })
	public String sign() {
		return "sign/sign";
	}

	@PostMapping(value = { "", "/sign" })
	public ModelAndView sign(@ModelAttribute MemberDTO memberDTO, HttpSession session, HttpServletRequest request) {

		
			try {
				signService.signup(memberDTO);
				MemberDTO userInfo = signService.getUser(memberDTO);
				session.setAttribute("userInfo", userInfo);
				log.info(userInfo.toString());
				ModelAndView mav = new ModelAndView("redirect:signupAbilitylvl");
				// mav.addObject("url", "signupAbilitylvl");
				return mav;
			} catch (Exception e) {
				e.printStackTrace();
				ModelAndView mav = new ModelAndView("result");
				mav.addObject("msg", "�̹� ������� ID �Դϴ�.");
				mav.addObject("url", "javascript:history.back();");
				return mav;
			}
		

	}

	/* ȸ������ ���� ��, ability level �Է� ������ */
	@GetMapping(value = { "/signupAbilitylvl" })
	public String signupDetail() {
		return "sign/signupAbilitylvl";
	}

	@PostMapping(value = { "/signupAbilitylvl" })
	public ModelAndView signupDetail(@ModelAttribute MemberDTO memberDTO, HttpSession session,
			HttpServletRequest request) {
		MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");
		log.info(userInfo.toString());
		/*
		 * try { signService.signup(memberDTO); log.info(memberDTO.toString());
		 * ModelAndView mav = new ModelAndView("signupInterest"); mav.addObject("url",
		 * "signupInterest"); return mav; } catch (Exception e) { e.printStackTrace();
		 * ModelAndView mav = new ModelAndView("result"); mav.addObject("msg",
		 * "���� �߻�."); mav.addObject("url", "javascript:history.back();"); return mav; }
		 */
		return null;

	}

	/* interest �Է� ������ */

	@GetMapping(value = { "/signupInterest" })
	public String signupInterest() {
		return "sign/signupInterest";
	}

	@PostMapping(value = { "/signupInterest" })
	public ModelAndView signupInterest(@ModelAttribute MemberDTO memberDTO, HttpSession session,
			HttpServletRequest request) {

		try {
			signService.signup(memberDTO);
			log.info(memberDTO.toString());
			ModelAndView mav = new ModelAndView("signupInterest");
			mav.addObject("url", "sign/signupInterest");
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("sign/result");
			mav.addObject("msg", "���� �߻�.");
			mav.addObject("url", "javascript:history.back();");
			return mav;
		}

	}

	/* signin (�α���) ������ */
	@GetMapping(value = { "/signin" })
	public String signin() {
		return "sign/signin";
	}

	@PostMapping(value = { "/signin" })
	public String signin(@ModelAttribute MemberDTO memberDTO, Model model, HttpSession session) {
		log.info(memberDTO.toString());
		try {
			MemberDTO userInfo = signService.getUser(memberDTO);
			log.info(userInfo.toString());

			session.setAttribute("userInfo", userInfo);
			return "home";
		} catch (Exception e) {
			log.info(e.getMessage());
			model.addAttribute("msg", e.getMessage());
			model.addAttribute("url", "./");
			return "sign/result";
		}
	}

	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");
		session.invalidate();

		ModelAndView mav = new ModelAndView("sign/result");
		mav.addObject("msg", userInfo.getName() + "(" + userInfo.getId() + ")���� �α׾ƿ� �Ͽ����ϴ�.");
		mav.addObject("url", "./");
		return mav;
	}
}