package dev.team3.wantudy.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.team3.wantudy.dao.CategoryDAO;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	@Resource(name="categoryDAO")
	CategoryDAO categoryDAO;

	@Override
	public String getCategory(int category_no) throws Exception {
		// TODO Auto-generated method stub
		return categoryDAO.getCategory(category_no);
	}
	
}
