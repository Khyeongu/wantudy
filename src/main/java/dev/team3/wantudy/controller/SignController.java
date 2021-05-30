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
import dev.team3.wantudy.dto.InterestDTO;
import dev.team3.wantudy.dto.InterestInfoDTO;
import dev.team3.wantudy.dto.MemberDTO;
import dev.team3.wantudy.service.AbilitylvlService;
import dev.team3.wantudy.service.InterestService;
import dev.team3.wantudy.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping({ "sign", "" })
public class SignController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private InterestService interestService;

	@Autowired
	private AbilitylvlService abilitylvlService;

	/* 처음 웹 페이지 */
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
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("/sign/result");
			mav.addObject("msg", "이미 존재하는 아이디입니다.");
			mav.addObject("url", "javascript:history.back();");
			return mav;
		}

	}

	/* 로그인(signin) 페이지 */
	@GetMapping(value = { "/signin" })
	public String signin() {
		return "sign/signin";
	}

	@PostMapping(value = { "/signin" })
	public ModelAndView signin(@ModelAttribute MemberDTO memberDTO, Model model, HttpSession session) {
		log.info(memberDTO.toString());
		try {
			MemberDTO userInfo = memberService.getUser(memberDTO);
			log.info(userInfo.toString());
			ModelAndView mav = new ModelAndView("redirect:/home");
			session.setAttribute("userInfo", userInfo);
			return mav;
		} catch (Exception e) {
			log.info(e.getMessage());
			ModelAndView mav = new ModelAndView("/sign/result");
			mav.addObject("msg", "아이디가 없거나 비밀번호가 일치하지 않습니다.");
			mav.addObject("url", "javascript:history.back();");
			return mav;
		}
	}

	/* 개인 역량 입력 페이지 */
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

		// parsing
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
				abilitylvlService.signupAbilitylvl(map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return mav;
	}

	/* 관심 분야 입력 페이지 */

	@GetMapping(value = { "/signupInterest" })
	public String signupInterest() {
		return "sign/signupInterest";
	}

	@PostMapping(value = { "/signupInterest" })
	public ModelAndView signupInterest(@ModelAttribute InterestInfoDTO interestInfoDTO, HttpSession session,
			HttpServletRequest request) {
		MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");

		try {
			InterestDTO interestDTO = new InterestDTO();

			interestDTO.setMember_no(userInfo.getNo());
			interestDTO.setInterest_no(1);
			interestDTO.setCategory_no(interestInfoDTO.getInterest1());
			interestService.signupInterest(interestDTO);

			interestDTO.setMember_no(userInfo.getNo());
			interestDTO.setInterest_no(2);
			interestDTO.setCategory_no(interestInfoDTO.getInterest2());
			interestService.signupInterest(interestDTO);

			interestDTO.setMember_no(userInfo.getNo());
			interestDTO.setInterest_no(3);
			interestDTO.setCategory_no(interestInfoDTO.getInterest3());
			interestService.signupInterest(interestDTO);

			ModelAndView mav = new ModelAndView("redirect:/home");
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("/sign/result");
			mav.addObject("msg", "이미 존재하는 아이디입니다.");
			mav.addObject("url", "javascript:history.back();");
			return mav;
		}

	}

}
