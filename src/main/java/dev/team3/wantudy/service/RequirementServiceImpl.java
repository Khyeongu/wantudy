package dev.team3.wantudy.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import dev.team3.wantudy.dao.RequirementDAO;

@Service
public class RequirementServiceImpl implements RequirementService {

	@Autowired
	@Qualifier(value = "requirementDAO")
	private RequirementDAO requirementDAO;

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
