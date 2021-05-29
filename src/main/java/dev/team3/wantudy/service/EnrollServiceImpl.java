package dev.team3.wantudy.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.team3.wantudy.dao.EnrollDAO;

@Service
public class EnrollServiceImpl implements EnrollService{

	@Autowired
	@Resource(name="enrollDAO")
	EnrollDAO enrollDAO;
	
	
	@Override
	public int getMemberCount(int study_no) throws Exception {
		// TODO Auto-generated method stub
		return enrollDAO.getMemberCount(study_no);
	}

}
