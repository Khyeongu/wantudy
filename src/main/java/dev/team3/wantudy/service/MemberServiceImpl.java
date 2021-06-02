package dev.team3.wantudy.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.team3.wantudy.dao.MemberDAO;
import dev.team3.wantudy.dto.MemberDTO;
import dev.team3.wantudy.utils.PagingUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service

public class MemberServiceImpl implements MemberService {

	@Autowired
	@Resource(name = "memberDAO")
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
	public void modifyMemberInfo(MemberDTO memberDTO) throws Exception {
		memberDAO.modifyMemberInfo(memberDTO);
	}
	
}
