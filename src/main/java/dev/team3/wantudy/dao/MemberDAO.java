package dev.team3.wantudy.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dev.team3.wantudy.dto.ApplyMemberDTO;
import dev.team3.wantudy.dto.MemberDTO;

public interface MemberDAO {

	void signup(MemberDTO memberDTO) throws SQLException;

	MemberDTO getUser(MemberDTO memberDTO) throws SQLException;

	void modifyMemberInfo(MemberDTO memberDTO) throws SQLException;
	
	public Map selectApplyMemberList(Map param) throws SQLException;

	int applyMemberListCount(int study_no) throws SQLException;

	List<ApplyMemberDTO> getApplyMemberList(Map<String, Object> pagingInfo) throws SQLException;

	int studyMemberListCount(int study_no) throws SQLException;

	List<ApplyMemberDTO> getStudyMemberList(HashMap<String, Object> pagingInfo) throws SQLException;

}
