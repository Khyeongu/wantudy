package dev.team3.wantudy.service;

import java.util.HashMap;
import java.util.List;

import dev.team3.wantudy.dto.EnrollDTO;
import dev.team3.wantudy.dto.StudyDTO;

import dev.team3.wantudy.dto.RequirementDTO;

public interface RequirementService {

	List<Integer> getStudyRequirementScore(int study_no) throws Exception;

	void deleteStudyRequirementScore(int study_no) throws Exception;

	void insertStudyRequirementScore(RequirementDTO requirementDTO) throws Exception;

	void insertRequirement(HashMap<String, Object> map) throws Exception;

}
