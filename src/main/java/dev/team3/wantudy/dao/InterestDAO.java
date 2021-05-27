package dev.team3.wantudy.dao;

import java.sql.SQLException;
import java.util.List;

import dev.team3.wantudy.dto.InterestDTO;

public interface InterestDAO {

	void updateInterest(InterestDTO interestDTO) throws SQLException;

	List<InterestDTO> getInterest(int member_no) throws SQLException;

}
