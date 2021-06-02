package dev.team3.wantudy.service;

import java.util.HashMap;
import java.util.Map;

import dev.team3.wantudy.dto.MemberDTO;

public interface MemberService {

	void signup(MemberDTO memberDTO) throws Exception;

	MemberDTO getUser(MemberDTO memberDTO) throws Exception;

	void modifyMemberInfo(MemberDTO memberDTO) throws Exception;
}
