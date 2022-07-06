package com.pharmacystore.model;

import java.io.Serializable;

public class Category implements Serializable{

	private int categoryId;
	private String categoryName;
	
	public Category() {
		super();
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
}
