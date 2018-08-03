package com.boot.user.service;

import com.boot.pojo.User;

public interface UserService {

	User getUserLogin(String username, String password);

	void insertUser(User user);

}