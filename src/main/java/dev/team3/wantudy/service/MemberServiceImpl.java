package dev.team3.wantudy.service;


import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


import dev.team3.wantudy.dao.MemberDAO;
import dev.team3.wantudy.dto.MemberDTO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service

public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;

	@Override
	public void signup(MemberDTO memberDTO) throws Exception {
		try {
			memberDAO.signup(memberDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}

	}

	@Override
	public MemberDTO getUser(MemberDTO memberDTO) throws Exception {
		try {
			MemberDTO userInfo = memberDAO.getUser(memberDTO);
			if (userInfo == null) {
				throw new RuntimeException("ID doesn't exist or Password doesn't match.");
			}
			return userInfo;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void signupAbilitylvl(HashMap<String, Object> map) throws Exception {
		try {
			memberDAO.signupAbilitylvl(map);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		
	}

@Autowired
@Resource(name="memberDAO")
private MemberDAO memberDAO;

	@Override
	public void modifyMemberInfo(MemberDTO memberDTO) throws Exception {
		memberDAO.modifyMemberInfo(memberDTO);
	}


}
