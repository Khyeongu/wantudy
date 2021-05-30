package dev.team3.wantudy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import dev.team3.wantudy.dao.EnrollDAO;
import dev.team3.wantudy.dao.StudyDAO;
import dev.team3.wantudy.dto.StudyDTO;

public class StudyServiceImpl implements StudyService {

	@Autowired
	@Qualifier(value = "studyDAO")
	private StudyDAO studyDAO;

}
