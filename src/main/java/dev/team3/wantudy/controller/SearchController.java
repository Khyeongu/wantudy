package dev.team3.wantudy.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.team3.wantudy.dto.EnrollDTO;
import dev.team3.wantudy.dto.MemberDTO;
import dev.team3.wantudy.dto.SearchDTO;
import dev.team3.wantudy.dto.StudyRnumDTO;
import dev.team3.wantudy.dto.StudyStatusDTO;
import dev.team3.wantudy.dto.StudyStatusForJspDTO;
import dev.team3.wantudy.service.CategoryService;
import dev.team3.wantudy.service.EnrollService;
import dev.team3.wantudy.service.MemberStudyService;
import dev.team3.wantudy.service.StudyService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping({ "search" })
public class SearchController {

	@Autowired
	private StudyService studyService;

	@Autowired
	private EnrollService enrollService;

	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private MemberStudyService memberStudyService;

	/* �솃 �럹�씠吏� */
	@GetMapping(value = { "" })
	public String searchMain(Model model, HttpSession session) {
		MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");
		session.setAttribute("userInfo", userInfo);

		return "search/search";
	}

	@ResponseBody
	@PostMapping(value = { "" })
	public Map<String, Object> showRecentStudy(Model model, HttpSession session) {
		MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");
		session.setAttribute("userInfo", userInfo);
		try {
			List<StudyRnumDTO> studyList = studyService.getRecentStudy();
			List<StudyStatusForJspDTO> recentStudyList = new ArrayList<StudyStatusForJspDTO>();

			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			for (StudyRnumDTO s : studyList) {
				StudyStatusForJspDTO ss = new StudyStatusForJspDTO();

				ss.setNo(s.getNo());
				ss.setName(s.getName());
				ss.setContent(s.getContent());
				ss.setStartdate(dateFormat.format(s.getStartdate()));
				ss.setEnddate(dateFormat.format(s.getEnddate()));
				ss.setCapacity(s.getCapacity());
				ss.setMember_no(s.getMember_no());
				ss.setCategory_no(s.getCategory_no());
				ss.setMember_count(enrollService.getMemberCount(s.getNo()));
				ss.setCategory(categoryService.getCategory(s.getCategory_no()));
				ss.setCategory_imgpath(memberStudyService.getCategoryImgpath(s.getCategory_no()));

				recentStudyList.add(ss);
			}

			Map<String, Object> result = new HashMap<String, Object>();
			result.put("recentStudyList", recentStudyList);

			return result;
		} catch (

		Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	/* �솃 �럹�씠吏� */
	@ResponseBody
	@PostMapping(value = { "/enrollMember" })
	public HashMap<String, String> enroll(@RequestBody String httpParam, Model model, HttpSession session) {
		MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");
		session.setAttribute("userInfo", userInfo);
		EnrollDTO enrollDTO = new EnrollDTO();
		HashMap<String, String> map = new HashMap<String, String>();

		try {

			JSONParser jsonParser = new JSONParser();
			JSONObject insertParam = null;

			insertParam = (JSONObject) jsonParser.parse(httpParam);

			enrollDTO.setStudy_no((int) (long) (insertParam.get("studyno")));
			enrollDTO.setMember_no(userInfo.getNo());

			if (enrollService.checkAlreadyEnrolled(enrollDTO) == 0) {
				enrollService.insertMemberEnroll(enrollDTO);
				map.put("message", "스터디 신청 성공.");
				return map;

			} else {
				map.put("message", "스터디에 이미 참여중이거나 심사중입니다.");
				return map;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	@ResponseBody
	@PostMapping(value = "/list")
	public HashMap<String, String> list(@ModelAttribute SearchDTO searchDTO, HttpSession session) {

		MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");
		session.setAttribute("userInfo", userInfo);
		
		try {
			List<StudyRnumDTO> searchResult = studyService.getStudyListWithSearch(searchDTO);

			for (StudyRnumDTO studyRnumDTO : searchResult) {
				System.out.println(studyRnumDTO);
			}

			Map<String, Object> result = new HashMap<String, Object>();
			result.put("searchResult", searchResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		

		return null;
	}

}
