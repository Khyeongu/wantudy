package dev.team3.wantudy.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.team3.wantudy.dao.AbilityLevelDAO;
import dev.team3.wantudy.dao.MemberAbilityDAO;
import dev.team3.wantudy.dto.AbilityLevelDTO;

@Service
public class AbilitylvlServiceImpl implements AbilitylvlService {

	@Autowired
	@Resource(name = "memberAbilityDAO")
	MemberAbilityDAO memberAbilityDAO;
	
	@Autowired
	@Resource(name = "abilityLevelDAO")
	AbilityLevelDAO abilityLevelDAO;

	@Override
	public void signupAbilitylvl(HashMap<String, Object> map) throws Exception {
		try {
			memberAbilityDAO.signupAbilitylvl(map);
		} catch (Exception e) {
			//log.info(e.getMessage());
			throw e;
		}

	}

	@Override
	public List<String> getAbilityName() throws Exception {
		// TODO Auto-generated method stub
		return abilityLevelDAO.getAbilityName();
	}

	@Override
	public int getAbilityScore(AbilityLevelDTO al) throws Exception {
		// TODO Auto-generated method stub
		return abilityLevelDAO.getAbilityScore(al);
	}

}
