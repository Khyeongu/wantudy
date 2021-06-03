package dev.team3.wantudy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import dev.team3.wantudy.dao.RequirementDAO;
import dev.team3.wantudy.dao.StudyDAO;
import dev.team3.wantudy.dto.SearchDTO;
import dev.team3.wantudy.dto.StudyDTO;
import dev.team3.wantudy.dto.StudyRnumDTO;

@Service
public class StudyServiceImpl implements StudyService {

	@Autowired
	@Qualifier(value = "studyDAO")
	private StudyDAO studyDAO;

	@Autowired
	@Qualifier(value = "requirementDAO")
	private RequirementDAO requirementDAO;

	public void createStudy(StudyDTO studyDTO) throws Exception {
		studyDAO.createStudy(studyDTO);
	}

	public List<StudyDTO> getMemberStudy(int member_no) throws Exception {
		// TODO Auto-generated method stub
		return studyDAO.getMemberStudy(member_no);
	}

	@Override
	public StudyDTO getStudy(int study_no) throws Exception {
		// TODO Auto-generated method stub
		return studyDAO.getStudy(study_no);
	}

	@Override
	public void updateStudyInfo(StudyDTO studyDTO) throws Exception {
		// TODO Auto-generated method stub
		studyDAO.updateStudyInfo(studyDTO);
	}

	@Override
	public int createStudyNo() throws Exception {
		// TODO Auto-generated method stub
		return studyDAO.createStudyNo();
	}

	@Override
	public List<StudyRnumDTO> getRecentStudy() throws Exception {
		// TODO Auto-generated method stub
		return studyDAO.getRecentStudy();
	}

	@Override
	public List<StudyRnumDTO> getStudyListWithSearch(SearchDTO searchDTO) throws Exception {
		// TODO Auto-generated method stub
		return studyDAO.getStudyListWithSearch(searchDTO);
	}
    
	public String getStudyName(int study_no) throws Exception {
		// TODO Auto-generated method stub
		return studyDAO.getStudyName(study_no);
	}

}
