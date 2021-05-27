package dev.team3.wantudy.dao;

import java.sql.SQLException;
import java.util.HashMap;

import dev.team3.wantudy.dto.MemberDTO;

public interface MemberDAO {

	void signup(MemberDTO memberDTO) throws SQLException;

	MemberDTO getUser(MemberDTO memberDTO) throws SQLException;

	void signupAbilitylvl(HashMap<String, Object> map) throws SQLException;

}
