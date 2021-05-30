package dev.team3.wantudy.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.team3.wantudy.dao.MemberAbilityDAO;

@Service
public class AbilitylvlServiceImpl implements AbilitylvlService {

	@Autowired
	@Resource(name = "memberAbilityDAO")
	MemberAbilityDAO memberAbilityDAO;

	@Override
	public void signupAbilitylvl(HashMap<String, Object> map) throws Exception {
		try {
			memberAbilityDAO.signupAbilitylvl(map);
		} catch (Exception e) {
			//log.info(e.getMessage());
			throw e;
		}

	}

}
