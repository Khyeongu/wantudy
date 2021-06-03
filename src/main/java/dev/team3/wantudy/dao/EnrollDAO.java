package dev.team3.wantudy.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import dev.team3.wantudy.dto.EnrollDTO;
import dev.team3.wantudy.dto.MemberDTO;
import dev.team3.wantudy.dto.StudyDTO;

public interface EnrollDAO {
	public List<EnrollDTO> selectAllEnrolls(MemberDTO memberDTO) throws SQLException;
	
	public List<EnrollDTO> selectavailableEnrolls(MemberDTO memberDTO) throws SQLException;
	

	public int getMemberCount(int study_no) throws SQLException;

	public EnrollDTO selectMemberStudyEnroll(StudyDTO studyDTO) throws SQLException;


	public void acceptMember(HashMap<String, Object> memberInfo) throws SQLException;

	public void refuseMember(HashMap<String, Object> memberInfo) throws SQLException;

	public void kickMember(HashMap<String, Object> memberInfo) throws SQLException;

	public void insertMemberEnroll(EnrollDTO enrollDTO) throws SQLException;

	public void insertStudyMasterEnroll(EnrollDTO enrollDTO) throws SQLException;

	public int checkAlreadyEnrolled(EnrollDTO enrollDTO) throws SQLException;

	public List<EnrollDTO> memberDetail(int member_no) throws SQLException;

	public List<EnrollDTO> selectStudyingEnrolls(MemberDTO memberDTO) throws SQLException;

}
