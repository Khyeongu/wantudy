package dev.team3.wantudy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import dev.team3.wantudy.dao.ChattinglogDAO;
import dev.team3.wantudy.dao.EnrollDAO;
import dev.team3.wantudy.dao.StudyDAO;
import dev.team3.wantudy.dto.ChattinglogDTO;
import dev.team3.wantudy.dto.EnrollDTO;
import dev.team3.wantudy.dto.MemberDTO;
import dev.team3.wantudy.dto.StudyDTO;

@Service
public class ChattingServiceImpl implements ChattingService{

	@Autowired
	@Qualifier(value = "enrollDAO")
	private EnrollDAO enrollDAO;
	
	
	@Autowired
	@Qualifier(value = "studyDAO")
	private StudyDAO studyDAO;
	
	@Autowired
	@Qualifier(value = "chattinglogDAO")
	private ChattinglogDAO chattinglogDAO;

	@Override
	public List<EnrollDTO> selectAllEnrolls(MemberDTO memberDTO) {
		return enrollDAO.selectAllEnrolls(memberDTO);
	}

	@Override
	public StudyDTO getStudy(int study_no) {
		return studyDAO.getStudy(study_no);
	}

	@Override
	public List<ChattinglogDTO> getChattinglog(int study_no) {
		return chattinglogDAO.getCattinglog(study_no);
	}
	
	
	
}
