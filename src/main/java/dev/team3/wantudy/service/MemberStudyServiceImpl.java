package dev.team3.wantudy.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import dev.team3.wantudy.dao.ChattinglogDAO;
import dev.team3.wantudy.dao.EnrollDAO;
import dev.team3.wantudy.dao.MemberDAO;
import dev.team3.wantudy.dao.StudyDAO;
import dev.team3.wantudy.dto.ApplyMemberDTO;
import dev.team3.wantudy.dto.ChattinglogDTO;
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
	
	@Autowired
	@Qualifier(value = "chattinglogDAO")
	private ChattinglogDAO chattinglogDAO;
	
	@Autowired
	@Qualifier(value = "memberDAO")
	private MemberDAO memberDAO;

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

	@Override
	public List<ChattinglogDTO> getChattinglog(int study_no) {
		return chattinglogDAO.getCattinglog(study_no);
	}

	@Override
	public void insertchattinglog(ChattinglogDTO chattinglogDTO) {
		chattinglogDAO.insertchattinglog(chattinglogDTO);
	}

	@Override
	public int applyMemberListCount(int study_no) {
		
		try {
			return memberDAO.applyMemberListCount(study_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public List<ApplyMemberDTO> getApplyMemberList(HashMap<String, Object> pagingInfo) {
		// TODO Auto-generated method stub
		try {
			return memberDAO.getApplyMemberList(pagingInfo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public int studyMemberListCount(int study_no) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.studyMemberListCount(study_no);
	}

	@Override
	public List<ApplyMemberDTO> getStudyMemberList(HashMap<String, Object> pagingInfo) {
		// TODO Auto-generated method stub
		try {
			return memberDAO.getStudyMemberList(pagingInfo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	
	
}
