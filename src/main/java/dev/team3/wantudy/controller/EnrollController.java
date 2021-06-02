//package dev.team3.wantudy.controller;
//
//import java.util.HashMap;
//import java.util.Map;
//
//import javax.servlet.http.HttpSession;
//
//import org.json.simple.JSONObject;
//import org.json.simple.parser.JSONParser;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;
//
//import dev.team3.wantudy.dto.EnrollDTO;
//import dev.team3.wantudy.dto.MemberDTO;
//import dev.team3.wantudy.service.CategoryService;
//import dev.team3.wantudy.service.EnrollService;
//import dev.team3.wantudy.service.StudyService;
//import lombok.extern.slf4j.Slf4j;
//
//@Slf4j
//@Controller
//@RequestMapping({ "enroll" })
//public class EnrollController {
//
//	@Autowired
//	private StudyService studyService;
//
//	@Autowired
//	private EnrollService enrollService;
//
//	@Autowired
//	private CategoryService categoryService;
//
//	/* �솃 �럹�씠吏� */
//	@PostMapping(value = { "/member" })
//	public void enroll(@RequestBody String httpParam, Model model, HttpSession session) {
//		MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");
//		session.setAttribute("userInfo", userInfo);
//		EnrollDTO enrollDTO = new EnrollDTO();
//
//		try {
//
//			JSONParser jsonParser = new JSONParser();
//			JSONObject insertParam = null;
//
//			insertParam = (JSONObject) jsonParser.parse(httpParam);
//
//			enrollDTO.setStudy_no((int) (long) (insertParam.get("studyno")));
//			enrollDTO.setMember_no(userInfo.getNo());
//
//			if (enrollService.checkAlreadyEnrolled(enrollDTO) == 0) {
//				enrollService.insertMemberEnroll(enrollDTO);
//				System.out.println("스터디 신청 성공");
//
//
//			} else {
//				System.out.println("이미 신청한 스터디");
//
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//	}
//
//}
