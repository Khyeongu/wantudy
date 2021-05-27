package dev.team3.wantudy.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dev.team3.wantudy.dto.AbilityLevelDTO;
import dev.team3.wantudy.dto.MemberDTO;
import dev.team3.wantudy.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("sign")
public class SignController {

	@Autowired
	private MemberService memberService;

	/* 웹 페이지 가장 처음 화면 */
	@GetMapping(value = { "" })
	public String sign() {
		return "sign/sign";
	}

	@PostMapping(value = { "" })
	public ModelAndView sign(@ModelAttribute MemberDTO memberDTO, HttpSession session, HttpServletRequest request) {

		try {
			memberService.signup(memberDTO);
			MemberDTO userInfo = memberService.getUser(memberDTO);
			session.setAttribute("userInfo", userInfo);
			log.info(userInfo.toString());
			ModelAndView mav = new ModelAndView("redirect:/sign/signupAbilitylvl");
			// mav.addObject("url", "signupAbilitylvl");
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("/sign/result");
			mav.addObject("msg", "이미 존재하는 아이디입니다.");
			mav.addObject("url", "javascript:history.back();");
			return mav;
		}
	}

	/* ȸ������ ���� ��, ability level �Է� ������ */
	@GetMapping(value = { "/signupAbilitylvl" })
	public String signupAbilitylvl() {
		return "sign/signupAbilitylvl";
	}

	@PostMapping(value = { "/signupAbilitylvl" })
	public ModelAndView signupAbilitylvl(@RequestBody String httpParam, HttpSession session,
			HttpServletRequest request) {

		ModelAndView mav = new ModelAndView("redirect:/sign/signupInterest");

		JSONParser jsonParser = new JSONParser();
		JSONArray insertParam = null;

		MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");
		session.setAttribute("userInfo", userInfo);

		// 파싱
		try {
			insertParam = (JSONArray) jsonParser.parse(httpParam);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		for (int i = 0; i < insertParam.size(); i++) {
			JSONObject insertData = (JSONObject) insertParam.get(i);
			AbilityLevelDTO abilityLevelDTO = new AbilityLevelDTO();
			abilityLevelDTO.setName((String) insertData.get("name"));
			abilityLevelDTO.setScore(Integer.parseInt((String) insertData.get("score")));

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("abilityLevelDTO", abilityLevelDTO);
			map.put("memberNo", userInfo.getNo());
			try {
				memberService.signupAbilitylvl(map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return mav;
	}

	/* interest �Է� ������ */

	@GetMapping(value = { "/signupInterest" })
	public String signupInterest() {
		System.out.println("화면전환 된거야??");
		return "sign/signupInterest";
	}

	@PostMapping(value = { "/signupInterest" })
	public ModelAndView signupInterest(@ModelAttribute MemberDTO memberDTO, HttpSession session,
			HttpServletRequest request) {

		try {
			memberService.signup(memberDTO);
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
			MemberDTO userInfo = memberService.getUser(memberDTO);
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
