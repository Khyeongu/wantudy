package dev.team3.wantudy.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import dev.team3.wantudy.dao.StudyDAO;
import dev.team3.wantudy.dto.StudyDTO;

@Service
public class StudyServiceImpl implements StudyService {

	@Autowired
	@Qualifier(value = "studyDAO")
	private StudyDAO studyDAO;

	@Override
	public void createStudy(StudyDTO studyDTO) {
		try {
			studyDAO.createStudy(studyDTO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
