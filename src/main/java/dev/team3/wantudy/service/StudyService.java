package dev.team3.wantudy.service;

import java.util.HashMap;
import java.util.List;

import dev.team3.wantudy.dto.EnrollDTO;
import dev.team3.wantudy.dto.StudyDTO;

public interface StudyService {

	public void createStudy(StudyDTO studyDTO) throws Exception;

	List<StudyDTO> getMemberStudy(int no) throws Exception;

	StudyDTO getStudy(int study_no) throws Exception;

	void updateStudyInfo(StudyDTO studyDTO) throws Exception;

	int createStudyNo() throws Exception;

}
