package dev.team3.wantudy.dao;

import java.sql.SQLException;
import java.util.List;

import dev.team3.wantudy.dto.CategoryDTO;

public interface CategoryDAO {

	String getCategory(int category_no) throws SQLException;

	List<CategoryDTO> getCategoryAll() throws SQLException;

}
