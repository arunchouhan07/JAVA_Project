package com.pharmacystore.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.pharmacystore.connection.DbConnection;
import com.pharmacystore.dao.AdminDAO;
import com.pharmacystore.model.Admin;

public class AdminDAOImpl implements AdminDAO{

	@Override
	public boolean register(Admin admin) {
		
		boolean status = false;
		
		try(Connection con = DbConnection.getDatabaseConnection()){
			
			PreparedStatement pst = con.prepareStatement(
					"insert into admin values(?,?)");
			
			pst.setString(1, admin.getUserid());
			pst.setString(2, admin.getPassword());
			
			int count = pst.executeUpdate();
			
			if(count > 0) {
				status = true;
			}
		}
		catch(SQLException ex) {
			ex.printStackTrace();
			return false;
		}
		
		return status;
	}

	@Override
	public boolean checkAdmin(Admin admin) {
		boolean status= false;
		
		try(Connection con = DbConnection.getDatabaseConnection()){
			
			PreparedStatement pst = 
con.prepareStatement("select * from admin where "
		+ "userid like ? and password like ?");
		
			
			pst.setString(1,admin.getUserid());
			pst.setString(2,admin.getPassword());
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.isBeforeFirst()) {
				status=true;
			}
		}
		catch(SQLException ex) {
			ex.printStackTrace();
			return false;
		}
		
		return status;
	}
}
