package dev.team3.wantudy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import dev.team3.wantudy.dao.MemberDAO;
import dev.team3.wantudy.dto.MemberDTO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService{
	
@Autowired
@Resource(name="memberDAO")
private MemberDAO memberDAO;

	@Override
	public void modifyMemberInfo(MemberDTO memberDTO) throws Exception {
		memberDAO.modifyMemberInfo(memberDTO);
	}

}
