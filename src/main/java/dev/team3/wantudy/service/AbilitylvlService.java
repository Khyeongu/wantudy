package dev.team3.wantudy.service;

import java.util.HashMap;
import java.util.List;

import dev.team3.wantudy.dto.AbilityLevelDTO;

public interface AbilitylvlService {

	void signupAbilitylvl(HashMap<String, Object> map) throws Exception;

	List<String> getAbilityName() throws Exception;

	int getAbilityScore(AbilityLevelDTO al) throws Exception;

}
