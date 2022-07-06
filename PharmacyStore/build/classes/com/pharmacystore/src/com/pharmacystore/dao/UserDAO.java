package com.pharmacystore.dao;

import com.pharmacystore.model.User;

public interface UserDAO {

	boolean register(User user);
	boolean checkUser(User user);
}
