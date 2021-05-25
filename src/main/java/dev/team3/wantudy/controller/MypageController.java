package dev.team3.wantudy.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController {
	
	@GetMapping(value = "/mypage/myinfo")
	public String mypage(Locale locale, Model model) {
		
		return "mypage/myinfo";
	}
}
