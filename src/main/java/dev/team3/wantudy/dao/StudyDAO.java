package dev.team3.wantudy.dao;

import java.sql.SQLException;
import java.util.List;

import dev.team3.wantudy.dto.StudyDTO;

public interface StudyDAO {
	public StudyDTO getStudy(int study_no) throws SQLException;


	public void createStudy(StudyDTO studyDTO) throws SQLException;

	public List<StudyDTO> getMemberStudy(int member_no) throws SQLException;

	public void updateStudyInfo(StudyDTO studyDTO) throws SQLException;

}
