package dev.team3.wantudy.service;

import java.util.HashMap;

import dev.team3.wantudy.dto.MemberDTO;

public interface MemberService {

	void signup(MemberDTO memberDTO) throws Exception;

	MemberDTO getUser(MemberDTO memberDTO) throws Exception;

	void signupAbilitylvl(HashMap<String, Object> map) throws Exception;
}
