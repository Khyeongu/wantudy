package dev.team3.wantudy.service;

import java.util.List;

import dev.team3.wantudy.dto.RequirementDTO;

public interface RequirementService {

	List<Integer> getStudyRequirementScore(int study_no) throws Exception;

	void deleteStudyRequirementScore(int study_no) throws Exception;

	void insertStudyRequirementScore(RequirementDTO requirementDTO) throws Exception;

}
