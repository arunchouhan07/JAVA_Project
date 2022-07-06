package com.pharmacystore.dao;

import com.pharmacystore.model.Admin;

public interface AdminDAO {

	boolean register(Admin admin);
	boolean checkAdmin(Admin admin);
}
