package dev.team3.wantudy.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dev.team3.wantudy.dto.ApplyMemberDTO;
import dev.team3.wantudy.dto.CategoryDTO;
import dev.team3.wantudy.dto.ChattinglogDTO;
import dev.team3.wantudy.dto.EnrollDTO;
import dev.team3.wantudy.dto.MemberDTO;
import dev.team3.wantudy.dto.StudyDTO;

public interface MemberStudyService {

	public List<EnrollDTO> selectAllEnrolls(MemberDTO memberDTO);
	public List<EnrollDTO> selectavailableEnrolls(MemberDTO memberDTO);
	public StudyDTO getStudy(int study_no);
	public List<ChattinglogDTO> getChattinglogscroll (int study_no,int endNo);
	public void insertchattinglog(ChattinglogDTO chattinglogDTO);
	public int applyMemberListCount(int study_no);
	public List<ApplyMemberDTO> getApplyMemberList(HashMap<String, Object> pagingInfo) throws Exception;
	public int studyMemberListCount(int study_no) throws Exception;
	public List<ApplyMemberDTO> getStudyMemberList(HashMap<String, Object> pagingInfo) throws Exception;
	public ChattinglogDTO getlastlog(int study_no) throws Exception;
	public String getmembername(int member_no) throws Exception;
	public String getCategoryImgpath(int category_no) throws Exception;
	public List<EnrollDTO> selectStudyingEnrolls(MemberDTO memberDTO) throws Exception;
	public List<EnrollDTO> selectApplyEnrolls(MemberDTO memberDTO) throws Exception;
}