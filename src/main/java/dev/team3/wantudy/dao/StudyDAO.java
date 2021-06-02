package dev.team3.wantudy.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import dev.team3.wantudy.dto.EnrollDTO;
import dev.team3.wantudy.dto.StudyDTO;
import dev.team3.wantudy.dto.StudyRnumDTO;

public interface StudyDAO {
	public StudyDTO getStudy(int study_no) throws SQLException;

	public void createStudy(StudyDTO studyDTO) throws SQLException;

	public List<StudyDTO> getMemberStudy(int member_no) throws SQLException;

	public void updateStudyInfo(StudyDTO studyDTO) throws SQLException;

	public int createStudyNo() throws SQLException;

	public List<StudyRnumDTO> getRecentStudy() throws SQLException;;

}
