package dev.team3.wantudy.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import dev.team3.wantudy.dao.RequirementDAO;
import dev.team3.wantudy.dto.RequirementDTO;

@Service
public class RequirementServiceImpl implements RequirementService {

	@Autowired
	@Resource(name = "requirementDAO")
	RequirementDAO requirementDAO;

	@Override
	public List<Integer> getStudyRequirementScore(int study_no) throws Exception {
		// TODO Auto-generated method stub
		return requirementDAO.getStudyRequirementScore(study_no);
	}

	@Override
	public void deleteStudyRequirementScore(int study_no) throws Exception {
		// TODO Auto-generated method stub
		requirementDAO.deleteStudyRequirementScore(study_no);

	}

	@Override
	public void insertStudyRequirementScore(RequirementDTO requirementDTO) throws Exception {
		// TODO Auto-generated method stub
		requirementDAO.insertStudyRequirementScore(requirementDTO);
	}

	@Override
	public void insertRequirement(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		try {
			requirementDAO.insertRequirement(map);
		} catch (Exception e) {
			// log.info(e.getMessage());
			throw e;
		}

	}

}
