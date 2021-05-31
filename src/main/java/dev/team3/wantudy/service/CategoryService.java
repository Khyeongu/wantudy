package dev.team3.wantudy.service;

import java.util.List;

import dev.team3.wantudy.dto.CategoryDTO;

public interface CategoryService {

	String getCategory(int category_no) throws Exception;

	List<CategoryDTO> getCategoryAll() throws Exception;

}
