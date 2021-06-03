package dev.team3.wantudy.service;

import java.util.List;

import dev.team3.wantudy.dto.SearchDTO;
import dev.team3.wantudy.dto.StudyDTO;
import dev.team3.wantudy.dto.StudyRnumDTO;

public interface StudyService {

	void createStudy(StudyDTO studyDTO) throws Exception;

	List<StudyDTO> getMemberStudy(int no) throws Exception;

	StudyDTO getStudy(int study_no) throws Exception;

	void updateStudyInfo(StudyDTO studyDTO) throws Exception;

	int createStudyNo() throws Exception;

	List<StudyRnumDTO> getRecentStudy() throws Exception;

	List<StudyRnumDTO> getStudyListWithSearch(SearchDTO searchDTO) throws Exception;
	String getStudyName(int study_no) throws Exception;

}
