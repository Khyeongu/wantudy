package dev.team3.wantudy.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import dev.team3.wantudy.dao.EnrollDAO;
import dev.team3.wantudy.dao.StudyDAO;
import dev.team3.wantudy.dto.EnrollDTO;
import dev.team3.wantudy.dto.MemberDTO;
import dev.team3.wantudy.dto.StudyDTO;

@Service
public class MemberStudyServiceImpl implements MemberStudyService{

	@Autowired
	@Qualifier(value = "enrollDAO")
	private EnrollDAO enrollDAO;
	
	
	@Autowired
	@Qualifier(value = "studyDAO")
	private StudyDAO studyDAO;
	

	@Override
	public List<EnrollDTO> selectAllEnrolls(MemberDTO memberDTO) {
		try {
			return enrollDAO.selectAllEnrolls(memberDTO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public StudyDTO getStudy(int study_no) {
		try {
			return studyDAO.getStudy(study_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
}
