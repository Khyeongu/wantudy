package dev.team3.wantudy.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dev.team3.wantudy.dto.AbilityLevelDTO;
import dev.team3.wantudy.dto.CategoryDTO;
import dev.team3.wantudy.dto.EnrollDTO;
import dev.team3.wantudy.dto.MemberDTO;
import dev.team3.wantudy.dto.StudyDTO;
import dev.team3.wantudy.service.AbilitylvlService;
import dev.team3.wantudy.service.CategoryService;
import dev.team3.wantudy.service.RequirementService;
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

	@Autowired
	private AbilitylvlService abilitylvlService;

	@Autowired
	private RequirementService requirementService;

	/* 스터디 추가 페이지 */
	@GetMapping(value = { "" })
	public String createStudy(Model model, HttpSession session) {
		MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");
		session.setAttribute("userInfo", userInfo);

		List<CategoryDTO> categoryList = null;

		try {
			categoryList = categoryService.getCategoryAll();
			model.addAttribute("categoryList", categoryList);

			List<String> abilityList = abilitylvlService.getAbilityName();
			for (String al : abilityList) {
				// log.info(al);
			}
			model.addAttribute("abilityList", abilityList);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "createStudy/createStudy";
	}

	@PostMapping(value = { "" })
	public ModelAndView createStudy(@RequestBody String httpParam, Model model, HttpSession session) {

		MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");
		session.setAttribute("userInfo", userInfo);
		ModelAndView mav = null;
		int studyno;

		try {
			JSONParser jsonParser = new JSONParser();
			JSONObject insertParam = null;

			insertParam = (JSONObject) jsonParser.parse(httpParam);

			StudyDTO studyDTO = new StudyDTO();
			studyDTO.setName((String) insertParam.get("name"));
			studyDTO.setContent((String) insertParam.get("content"));
			studyDTO.setStartdate(java.sql.Date.valueOf((String) insertParam.get("startdate")));
			studyDTO.setEnddate(java.sql.Date.valueOf((String) insertParam.get("enddate")));
			studyDTO.setCapacity(Integer.parseInt((String) insertParam.get("capacity")));
			studyDTO.setCategory_no(Integer.parseInt((String) insertParam.get("category_no")));
			studyDTO.setMember_no(userInfo.getNo());

			// study 테이블에 insert
			studyno = studyService.createStudyNo();
			studyDTO.setNo(studyno);
			studyService.createStudy(studyDTO);

			// 스터디장(studymaster) 을 enroll에 insert
			EnrollDTO enrollDTO = new EnrollDTO();
			enrollDTO.setMember_no(userInfo.getNo());
			enrollDTO.setStudy_no(studyDTO.getNo());
			studyService.insertStudyMasterEnroll(enrollDTO);

			// requirement 테이블에 insert
			JSONArray abilityArry = (JSONArray) insertParam.get("abilityarry");

			for (int i = 0; i < abilityArry.size(); i++) {
				JSONObject insertData = (JSONObject) abilityArry.get(i);

				AbilityLevelDTO abilityLevelDTO = new AbilityLevelDTO();

				abilityLevelDTO.setName((String) insertData.get("name"));
				abilityLevelDTO.setScore(Integer.parseInt((String) insertData.get("score")));

				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("abilityLevelDTO", abilityLevelDTO);
				map.put("studyNo", studyno);

				requirementService.insertRequirement(map);

			}

			mav = new ModelAndView("redirect:/home");

		} catch (Exception e) {
			e.printStackTrace();
			mav = new ModelAndView("/sign/result");
			mav.addObject("msg", "스터디 생성 실패.");
			mav.addObject("url", "javascript:history.back();");
			return mav;
		}

		return mav;

	}

}
