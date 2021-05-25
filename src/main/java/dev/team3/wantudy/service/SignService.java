package dev.team3.wantudy.service;

import dev.team3.wantudy.dto.MemberDTO;

public interface SignService {

	void signup(MemberDTO memberDTO) throws Exception;

	MemberDTO getUser(MemberDTO memberDTO) throws Exception;
}
