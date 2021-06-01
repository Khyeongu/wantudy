package dev.team3.wantudy.dao;

import java.sql.SQLException;
import java.util.List;

import dev.team3.wantudy.dto.AbilityLevelDTO;

public interface AbilityLevelDAO {

	List<String> getAbilityName() throws SQLException;

	int getAbilityScore(AbilityLevelDTO al) throws SQLException;

}
