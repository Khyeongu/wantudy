package dev.team3.wantudy.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.team3.wantudy.dao.EnrollDAO;
import dev.team3.wantudy.dto.EnrollDTO;
import dev.team3.wantudy.dto.StudyDTO;

@Service
public class EnrollServiceImpl implements EnrollService{

	@Autowired
	@Resource(name="enrollDAO")
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

}
