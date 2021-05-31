package dev.team3.wantudy.service;

import java.util.HashMap;
import java.util.List;

public interface AbilitylvlService {

	void signupAbilitylvl(HashMap<String, Object> map) throws Exception;

	List<String> getAbilityName() throws Exception;

}
