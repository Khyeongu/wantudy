package dev.team3.wantudy.service;

import java.util.List;

import dev.team3.wantudy.dto.InterestDTO;

public interface InterestService {

	void updateInterest(InterestDTO interestDTO) throws Exception;

	List<InterestDTO> getInterest(int member_no) throws Exception;

	void signupInterest(InterestDTO interestDTO) throws Exception;

}
