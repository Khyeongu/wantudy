package dev.team3.wantudy.service;

import dev.team3.wantudy.dto.EnrollDTO;
import dev.team3.wantudy.dto.StudyDTO;

public interface EnrollService {

	int getMemberCount(int study_no) throws Exception;

	EnrollDTO selectMemberStudyEnroll(StudyDTO s) throws Exception;

	void insertMemberEnroll(EnrollDTO enrollDTO) throws Exception;

	void insertStudyMasterEnroll(EnrollDTO enrollDTO) throws Exception;

	int checkAlreadyEnrolled(EnrollDTO enrollDTO) throws Exception;

}
