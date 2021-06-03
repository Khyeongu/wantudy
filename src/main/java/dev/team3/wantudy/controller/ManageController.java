package dev.team3.wantudy.controller;

import java.awt.Dialog.ModalExclusionType;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dev.team3.wantudy.dto.AbilityLevelDTO;
import dev.team3.wantudy.dto.ApplyMemberDTO;
import dev.team3.wantudy.dto.CategoryDTO;
import dev.team3.wantudy.dto.EnrollDTO;
import dev.team3.wantudy.dto.InterestDTO;
import dev.team3.wantudy.dto.MemberDTO;
import dev.team3.wantudy.dto.MemberStudyDTO;
import dev.team3.wantudy.dto.RequirementDTO;
import dev.team3.wantudy.dto.StudyDTO;
import dev.team3.wantudy.service.AbilitylvlService;
import dev.team3.wantudy.service.CategoryService;
import dev.team3.wantudy.service.EnrollService;
import dev.team3.wantudy.service.InterestService;
import dev.team3.wantudy.service.MemberService;
import dev.team3.wantudy.service.MemberStudyService;
import dev.team3.wantudy.service.RequirementService;
import dev.team3.wantudy.service.StudyService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ManageController {
	
	private int limit = 5; //한 페이지 개수
	@Autowired
	private CategoryService categoryService;

	@Autowired
	private EnrollService enrollService;

	@Autowired
	private StudyService studyService;

	@Autowired
	private AbilitylvlService abilitylvlService;

	@Autowired
	private RequirementService requirementService;

	@Autowired
	private MemberStudyService memberStudyService;

	@GetMapping(value = "/manage/mystudy")
	public String mystudy(Locale locale, Model model, HttpSession session) {
		log.info(((MemberDTO) session.getAttribute("userInfo")).toString());

		try {
			List<StudyDTO> mystudyList = studyService
					.getMemberStudy(((MemberDTO) session.getAttribute("userInfo")).getNo());
			List<MemberStudyDTO> memberStudyList = new ArrayList<MemberStudyDTO>();

			for (StudyDTO s : mystudyList) {
				MemberStudyDTO ms = new MemberStudyDTO();
				EnrollDTO e = new EnrollDTO();

				e = enrollService.selectMemberStudyEnroll(s);

				ms.setEnroll_member_no(((MemberDTO) session.getAttribute("userInfo")).getNo());
				ms.setEnroll_study_no(s.getNo());
				ms.setEnroll_status(e.getStatus());
				ms.setEnroll_skip(e.getSkip());
				ms.setStudy_name(s.getName());
				ms.setStudy_content(s.getContent());
				ms.setStudy_startdate(s.getStartdate());
				ms.setStudy_enddate(s.getEnddate());
				ms.setStudy_capacity(s.getCapacity());
				ms.setStudy_member_no(((MemberDTO) session.getAttribute("userInfo")).getNo());
				ms.setStudy_category(categoryService.getCategory(s.getCategory_no()));
				ms.setStudy_member_count(enrollService.getMemberCount(s.getNo()));
				if (ms.getEnroll_status().equals("심사중")) {
					ms.setStatusImg("/resources/img/status/yellow.png");
				} else if (ms.getEnroll_status().equals("진행중")) {
					ms.setStatusImg("/resources/img/status/green.png");
				} else if (ms.getEnroll_status().equals("종료")) {
					ms.setStatusImg("/resources/img/status/black.png");
				} else if (ms.getEnroll_status().equals("탈락")) {
					ms.setStatusImg("/resources/img/status/red.png");
				}
				memberStudyList.add(ms);
			}
			model.addAttribute("memberStudyList", memberStudyList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/manage/mystudy";
	}

	@GetMapping(value = "/manage/studyinfo/{study_no}")
	public String studyinfo(@PathVariable int study_no, Model model, HttpSession session) {

		// 세션과 스터디 장 일치하는지 확인기능 추가해야함
		List<CategoryDTO> categoryList = null;
		try {
			categoryList = categoryService.getCategoryAll();
			model.addAttribute("categoryList", categoryList);
			StudyDTO studyDTO = studyService.getStudy(study_no);
			model.addAttribute("studyDTO", studyDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/manage/studyinfo";
	}

	@PostMapping(value = "/manage/studyinfo/{study_no}")
	public String updateStudyInfo(@PathVariable int study_no, @ModelAttribute StudyDTO s, Model model,
			HttpSession session) {
		try {
			StudyDTO studyDTO = studyService.getStudy(study_no);
			studyDTO.setName(s.getName());
			studyDTO.setContent(s.getContent());
			studyDTO.setEnddate(s.getEnddate());
			studyDTO.setCapacity(s.getCapacity());
			studyDTO.setCategory_no(s.getCategory_no());
			studyService.updateStudyInfo(studyDTO);
			return "redirect:/manage/studyinfo/" + study_no;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			model.addAttribute("title", "에러");
			model.addAttribute("url", "./");
			return "result";
		}

	}

	@GetMapping(value = "/manage/studyability/{study_no}")
	public String studyability(@PathVariable int study_no, Model model, HttpSession session) {

		try {
			List<String> abilityList = abilitylvlService.getAbilityName();// 역량 리스트
			List<Integer> requirementScore = requirementService.getStudyRequirementScore(study_no);
			ArrayList<AbilityLevelDTO> abilityScoreList = new ArrayList<>();
			for (int i = 0; i < requirementScore.size(); i++) {
				AbilityLevelDTO abilityScore = new AbilityLevelDTO();
				abilityScore.setNo(i);
				abilityScore.setName(abilityList.get(i));
				abilityScore.setScore(requirementScore.get(i));
				abilityScoreList.add(abilityScore);
			}
			model.addAttribute("abilityScoreList", abilityScoreList);
			model.addAttribute("study_no", study_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/manage/studyability";
	}

	@PostMapping(value = "/manage/studyability/{study_no}")
	@ResponseBody
	public String updateStudyAbility(@PathVariable int study_no, @RequestBody List<AbilityLevelDTO> abilityLevelDTOList,
			HttpSession session) {

		try {
			requirementService.deleteStudyRequirementScore(study_no);

			for (AbilityLevelDTO al : abilityLevelDTOList) {
				RequirementDTO requirementDTO = new RequirementDTO();
				requirementDTO.setStudy_no(study_no);
				requirementDTO.setAbilityLevel_no(abilitylvlService.getAbilityScore(al));
				requirementService.insertStudyRequirementScore(requirementDTO);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "/manage/studyability/" + study_no;
	}

	@GetMapping(value = "/manage/studyapply/{study_no}")
	public String studyapply(@PathVariable int study_no, Model model, HttpSession session) {
		try {
			StudyDTO studyDTO = studyService.getStudy(study_no);
			model.addAttribute("studyDTO", studyDTO);

			int applyMemberListCount = memberStudyService.applyMemberListCount(study_no);
			// 총 페이지수
			int maxpage = (applyMemberListCount + limit - 1) / limit;
			// 시작 페이지
			int startpage = 1;
			// 마지막 페이지
			int endpage = startpage + 10 - 1;

			if (endpage > maxpage)
				endpage = maxpage;

			model.addAttribute("startpage", startpage);
			model.addAttribute("endpage", endpage);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/manage/studyapply";
	}

	@PostMapping(value = "/manage/studyapply/{study_no}")
	@ResponseBody
	public Map<String, Object> getApplyMemberList(@PathVariable int study_no,
			@RequestParam(value = "page_num") int page_num, Model model, HttpSession session) {
		try {
			StudyDTO studyDTO = studyService.getStudy(study_no);
			model.addAttribute("studyDTO", studyDTO);

			Map<String, Object> result = new HashMap<String, Object>();

			int applyMemberListCount = memberStudyService.applyMemberListCount(study_no);
			// 총 페이지수
			int maxpage = (applyMemberListCount + limit - 1) / limit;
			// 시작 페이지
			int startpage = ((page_num - 1) / 10) * 10 + 1;
			// 마지막 페이지
			int endpage = startpage + 10 - 1;

			if (endpage > maxpage)
				endpage = maxpage;

			HashMap<String, Object> pagingInfo = new HashMap<String, Object>();
			pagingInfo.put("study_no", study_no);
			pagingInfo.put("limit", limit);
			pagingInfo.put("page_num", page_num);

			List<ApplyMemberDTO> applyMemberList = memberStudyService.getApplyMemberList(pagingInfo);
			
			//img 경로
			for(ApplyMemberDTO am : applyMemberList) {
				am.setMember_img("/wantudy/resources/img/userimg.png");
			}
			result.put("applyMemberList", applyMemberList);
			result.put("page_num", page_num);
			result.put("startpage", startpage);
			result.put("endpage", endpage);
			result.put("maxpage", maxpage);

			return result;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	@PostMapping(value = "/manage/studyapply/acceptmember/{study_no}")
	@ResponseBody
	public String acceptMember(@PathVariable int study_no, @RequestParam(value = "member_no") int member_no, Model model, HttpSession session) {
		try {
			HashMap<String, Object> memberInfo = new HashMap<String, Object>();
			memberInfo.put("member_no", member_no);
			memberInfo.put("study_no", study_no);
			enrollService.acceptMember(memberInfo);
			
		} catch (Exception e) {

		}
		
		return "200 ok";
	}
	
	@PostMapping(value = "/manage/studyapply/refusemember/{study_no}")
	@ResponseBody
	public void refuseMember(@PathVariable int study_no, @RequestParam(value = "member_no") int member_no, Model model, HttpSession session) {
		try {
			HashMap<String, Object> memberInfo = new HashMap<String, Object>();
			memberInfo.put("member_no", member_no);
			memberInfo.put("study_no", study_no);
			enrollService.refuseMember(memberInfo);
			
		} catch (Exception e) {

		}
	}

	@GetMapping(value = "/manage/studymember/{study_no}")
	public String studymember(@PathVariable int study_no, Model model, HttpSession session) {

		try {
			StudyDTO studyDTO = studyService.getStudy(study_no);
			model.addAttribute("studyDTO", studyDTO);
			
			int studyMemberListCount = memberStudyService.studyMemberListCount(study_no);
			// 총 페이지수
			int maxpage = (studyMemberListCount + limit - 1) / limit;
			// 시작 페이지
			int startpage = 1;
			// 마지막 페이지
			int endpage = startpage + 10 - 1;

			if (endpage > maxpage)
				endpage = maxpage;

			model.addAttribute("startpage", startpage);
			model.addAttribute("endpage", endpage);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/manage/studymember";
	}
	
	@PostMapping(value = "/manage/studymember/{study_no}")
	@ResponseBody
	public Map<String, Object> getStudyMemberList(@PathVariable int study_no,
			@RequestParam(value = "page_num") int page_num, Model model, HttpSession session) {
		try {
			StudyDTO studyDTO = studyService.getStudy(study_no);
			model.addAttribute("studyDTO", studyDTO);

			Map<String, Object> result = new HashMap<String, Object>();

			int studyMemberListCount = memberStudyService.studyMemberListCount(study_no);
			// 총 페이지수
			int maxpage = (studyMemberListCount + limit - 1) / limit;
			// 시작 페이지
			int startpage = ((page_num - 1) / 10) * 10 + 1;
			// 마지막 페이지
			int endpage = startpage + 10 - 1;

			if (endpage > maxpage)
				endpage = maxpage;

			HashMap<String, Object> pagingInfo = new HashMap<String, Object>();
			pagingInfo.put("study_no", study_no);
			pagingInfo.put("limit", limit);
			pagingInfo.put("page_num", page_num);

			List<ApplyMemberDTO> studyMemberList = memberStudyService.getStudyMemberList(pagingInfo);

			result.put("studyMemberList", studyMemberList);
			result.put("page_num", page_num);
			result.put("startpage", startpage);
			result.put("endpage", endpage);
			result.put("maxpage", maxpage);
			result.put("session_no",((MemberDTO) session.getAttribute("userInfo")).getNo());

			return result;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	@PostMapping(value = "/manage/studymember/kickmember/{study_no}")
	@ResponseBody
	public void kickMember(@PathVariable int study_no, @RequestParam(value = "member_no") int member_no, Model model, HttpSession session) {
		try {
			HashMap<String, Object> memberInfo = new HashMap<String, Object>();
			memberInfo.put("member_no", member_no);
			memberInfo.put("study_no", study_no);
			enrollService.kickMember(memberInfo);
			
		} catch (Exception e) {

		}
	}
	
	@PostMapping(value = "/manage/studyapply/memberDetail/{study_no}")
	@ResponseBody
	public Map<String, Object> memberDetail(@PathVariable int study_no, @RequestParam(value = "member_no") int member_no, Model model, HttpSession session) {
		try {
			List<EnrollDTO> memberDetailEnrollList = enrollService.memberDetail(member_no);
			List<Map<String, Object>> memberDetailList = new ArrayList<Map<String,Object>>();
			
			
			Map<String, Object> result2 = new HashMap<String, Object>();
			
			for(EnrollDTO e : memberDetailEnrollList) {
				Map<String, Object> result = new HashMap<String, Object>();
				result.put("skip", e.getSkip());
				result.put("studyName", studyService.getStudyName(e.getStudy_no()));
				memberDetailList.add(result);
			}
			result2.put("memberDetailList", memberDetailList);
			return result2;
		} catch (Exception e) {
			return null;
		}
	}

}
