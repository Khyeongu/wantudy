package dev.team3.wantudy.service;

import java.util.HashMap;
import java.util.List;

import dev.team3.wantudy.dto.EnrollDTO;
import dev.team3.wantudy.dto.StudyDTO;

public interface RequirementService {

	void insertRequirement(HashMap<String, Object> map) throws Exception;

}
