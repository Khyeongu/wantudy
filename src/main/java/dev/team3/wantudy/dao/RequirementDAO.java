package dev.team3.wantudy.dao;

import java.sql.SQLException;
import java.util.HashMap;

import java.util.List;

import dev.team3.wantudy.dto.RequirementDTO;

public interface RequirementDAO {

	public List<Integer> getStudyRequirementScore(int study_no) throws SQLException;

	public void deleteStudyRequirementScore(int study_no) throws SQLException;

	public void insertStudyRequirementScore(RequirementDTO requirementDTO) throws SQLException;

	public void insertRequirement(HashMap<String, Object> map) throws SQLException;

}
