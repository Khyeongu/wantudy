package dev.team3.wantudy.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.team3.wantudy.dao.EnrollDAO;
import dev.team3.wantudy.dto.EnrollDTO;
import dev.team3.wantudy.dto.StudyDTO;

@Service
public class EnrollServiceImpl implements EnrollService {

	@Autowired
	@Resource(name = "enrollDAO")
	EnrollDAO enrollDAO;

	@Override
	public int getMemberCount(int study_no) throws Exception {
		// TODO Auto-generated method stub
		return enrollDAO.getMemberCount(study_no);
	}

	@Override
	public EnrollDTO selectMemberStudyEnroll(StudyDTO studyDTO) throws Exception {
		// TODO Auto-generated method stub
		return enrollDAO.selectMemberStudyEnroll(studyDTO);
	}

	@Override
	public void acceptMember(HashMap<String, Object> memberInfo) throws Exception {
		// TODO Auto-generated method stub
		enrollDAO.acceptMember(memberInfo);
	}

	@Override
	public void refuseMember(HashMap<String, Object> memberInfo) throws Exception {
		// TODO Auto-generated method stub
		enrollDAO.refuseMember(memberInfo);
	}

	@Override
	public void kickMember(HashMap<String, Object> memberInfo) throws Exception {
		// TODO Auto-generated method stub
		enrollDAO.kickMember(memberInfo);
	}

	@Override
	public void insertMemberEnroll(EnrollDTO enrollDTO) throws Exception {
		enrollDAO.insertMemberEnroll(enrollDTO);

	}

	@Override
	public void insertStudyMasterEnroll(EnrollDTO enrollDTO) throws Exception {
		// TODO Auto-generated method stub
		enrollDAO.insertStudyMasterEnroll(enrollDTO);
	}

	@Override
	public int checkAlreadyEnrolled(EnrollDTO enrollDTO) throws Exception {
		// TODO Auto-generated method stub
		return enrollDAO.checkAlreadyEnrolled(enrollDTO);

	}

}
