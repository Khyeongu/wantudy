package dev.team3.wantudy.dao;

import java.sql.SQLException;
import java.util.HashMap;

public interface RequirementDAO {
	public void insertRequirement(HashMap<String, Object> map) throws SQLException;
}
