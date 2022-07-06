package com.pharmacystore.dao;

import java.util.List;

import com.pharmacystore.model.Category;

public interface CategoryDAO {

	boolean addCategory(Category category);
	boolean deleteCategory(String categoryName);
	String getCategoryNameById(int categoryId);
	List<Category> getAllCategories();
	boolean deleteCategory(int catid);
}
