package dev.team3.wantudy.service;

import java.util.HashMap;
import java.util.List;

import dev.team3.wantudy.dto.EnrollDTO;
import dev.team3.wantudy.dto.StudyDTO;

public interface EnrollService {

	int getMemberCount(int study_no) throws Exception;

	EnrollDTO selectMemberStudyEnroll(StudyDTO s) throws Exception;

	void acceptMember(HashMap<String, Object> memberInfo) throws Exception;

	void refuseMember(HashMap<String, Object> memberInfo) throws Exception;

	void kickMember(HashMap<String, Object> memberInfo) throws Exception;

	void insertMemberEnroll(EnrollDTO enrollDTO) throws Exception;

	void insertStudyMasterEnroll(EnrollDTO enrollDTO) throws Exception;

	int checkAlreadyEnrolled(EnrollDTO enrollDTO) throws Exception;

	List<EnrollDTO> memberDetail(int member_no) throws Exception;



}
