package dev.team3.wantudy.service;

import java.util.List;

import dev.team3.wantudy.dto.StudyDTO;

public interface StudyService {

	List<StudyDTO> getMemberStudy(int no) throws Exception;

	StudyDTO getStudy(int study_no) throws Exception;

	void updateStudyInfo(StudyDTO studyDTO) throws Exception;
}
