package com.pharmacystore.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.pharmacystore.connection.*;
import com.pharmacystore.dao.UserDAO;
import com.pharmacystore.model.User;

public class UserDAOImpl implements UserDAO{

	@Override
	public boolean register(User u) {
		boolean status= false;
		
		try(Connection con = DbConnection.getDatabaseConnection()){
			
			PreparedStatement pst = 
con.prepareStatement("insert into user values(?,?,?,?,?,?,?,?)");
			pst.setString(1, u.getUserid());
			pst.setString(2, u.getPassword());
			pst.setString(3, u.getEmailid());
			pst.setInt(4, u.getAge());
			pst.setString(5, u.getContact());
			pst.setString(6, u.getCity());
			pst.setString(7, u.getState());
			pst.setString(8, u.getPincode());
			
			
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
	public boolean checkUser(User user) {
		boolean status= false;
		
		try(Connection con = DbConnection.getDatabaseConnection()){
		
			PreparedStatement pst = con.prepareStatement(
"select * from user where userid like ? and password like ?");
		
			pst.setString(1,user.getUserid() );
			pst.setString(2,user.getPassword() );
			
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
