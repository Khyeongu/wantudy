package dev.team3.wantudy.dao;

import java.sql.SQLException;
import java.util.List;

public interface AbilityLevelDAO {

	List<String> getAbilityName() throws SQLException;

}
