package dev.team3.wantudy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import dev.team3.wantudy.dao.EnrollDAO;
import dev.team3.wantudy.dao.StudyDAO;
import dev.team3.wantudy.dto.StudyDTO;

@Service
public class StudyServiceImpl implements StudyService {

	@Autowired
	@Qualifier(value = "studyDAO")
	private StudyDAO studyDAO;

	@Override
	public List<StudyDTO> getMemberStudy(int member_no) throws Exception {
		// TODO Auto-generated method stub
		return studyDAO.getMemberStudy(member_no);
	}

}
