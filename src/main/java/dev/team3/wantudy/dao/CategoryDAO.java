package dev.team3.wantudy.dao;

import java.sql.SQLException;

public interface CategoryDAO {

	String getCategory(int category_no) throws SQLException;

}
