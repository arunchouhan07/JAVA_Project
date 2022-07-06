package com.pharmacystore.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pharmacystore.connection.DbConnection;
import com.pharmacystore.dao.CategoryDAO;
import com.pharmacystore.model.Category;

public class CategoryDAOImpl implements CategoryDAO{

	@Override
	public boolean addCategory(Category category) {
		boolean status = false;
		
		try (Connection con = DbConnection.getDatabaseConnection()){
			
			PreparedStatement pst = 
					con.prepareStatement(
		"insert into category(categoryName) values(?)");
			
			pst.setString(1, category.getCategoryName());
			
			int count = pst.executeUpdate();
			
			if(count > 0)
				status = true;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
		return status;
	}

	@Override
	public boolean deleteCategory(String categoryName) {
		boolean status = false;
		
		try (Connection con = DbConnection.getDatabaseConnection()){
			
			PreparedStatement pst = 
					con.prepareStatement(
		"delete from category where categoryName = ?");
			
			pst.setString(1, categoryName);
			
			int count = pst.executeUpdate();
			
			if(count > 0)
				status = true;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
		return status;
	}

	
	@Override
	public boolean deleteCategory(int catid) {
		boolean status = false;
		
		try (Connection con = DbConnection.getDatabaseConnection()){
			
			PreparedStatement pst = 
					con.prepareStatement(
		"delete from category where categoryId = ?");
			
			pst.setInt(1, catid);
			
			int count = pst.executeUpdate();
			
			if(count > 0)
				status = true;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
		return status;
	}
	
	
	@Override
	public String getCategoryNameById(int categoryId) {
		
		try (Connection con = DbConnection.getDatabaseConnection()){
			
			PreparedStatement pst = 
					con.prepareStatement(
		"select * from category where categoryId = ?");
			
			pst.setInt(1, categoryId);
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.isBeforeFirst())
			{
				rs.next();
				String categoryName = 
						rs.getString("categoryName");
				return categoryName;
			}
			else
				return "";
			
		} catch (SQLException e) {
			e.printStackTrace();
			return "";
		}
	}
	
	public List<Category> getAllCategories()
	{
		List<Category> lstCategory = new ArrayList<>();
		
try (Connection con = DbConnection.getDatabaseConnection()){
			
			PreparedStatement pst = 
				con.prepareStatement("select * from category");
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.isBeforeFirst())
			{
				while(rs.next()) {
					
				Category category = new Category(); 
				category.setCategoryName(
						rs.getString("categoryName"));
				category.setCategoryId(
						rs.getInt("categoryId"));
				lstCategory.add(category);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			lstCategory.clear();
			return lstCategory;
		}

		return lstCategory; 
	}
}




