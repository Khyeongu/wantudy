package dev.team3.wantudy.service;

import java.util.List;

import org.springframework.stereotype.Service;

import dev.team3.wantudy.dto.InterestDTO;


public interface InterestService {
	
	
	void updateInterest(InterestDTO interestDTO) throws Exception;

	List<InterestDTO> getInterest(int member_no) throws Exception;

}
