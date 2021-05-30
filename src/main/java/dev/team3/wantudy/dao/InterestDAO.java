package dev.team3.wantudy.dao;

import java.sql.SQLException;
import java.util.List;

import dev.team3.wantudy.dto.InterestDTO;
import dev.team3.wantudy.dto.InterestInfoDTO;

public interface InterestDAO {

	void updateInterest(InterestDTO interestDTO) throws SQLException;

	List<InterestDTO> getInterest(int member_no) throws SQLException;

	void signupInterest(InterestDTO interestDTO) throws SQLException;

}
