package dev.team3.wantudy.dao;

import java.sql.SQLException;
import java.util.HashMap;

public interface MemberAbilityDAO {
	void signupAbilitylvl(HashMap<String, Object> map) throws SQLException;
}
