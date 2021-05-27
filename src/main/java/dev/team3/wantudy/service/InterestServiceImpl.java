package dev.team3.wantudy.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.team3.wantudy.dao.InterestDAO;
import dev.team3.wantudy.dto.InterestDTO;


@Service
public class InterestServiceImpl implements InterestService{

	@Autowired
	@Resource(name="interestDAO")
	InterestDAO interestDAO;
	

	
	@Override
	public void updateInterest(InterestDTO interestDTO) throws Exception {
		interestDAO.updateInterest(interestDTO);
	}



	@Override
	public List<InterestDTO> getInterest(int member_no) throws Exception {
		return interestDAO.getInterest(member_no);
		
	}

}
