package com.boot.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.mapper.UserMapper;
import com.boot.pojo.User;
import com.boot.pojo.UserExample;
import com.boot.user.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserMapper userMapper;

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.boot.service.impl.UserService#getUserLogin(java.lang.String,
	 * java.lang.String)
	 */
	@Override
	public User getUserLogin(String username, String password) {

		UserExample example = new UserExample();
		example.createCriteria().andPassWordEqualTo(password).andUserNameEqualTo(username);
		List<User> selectByExample = userMapper.selectByExample(example);

		return selectByExample.get(0);

	}

	@Override
	public void insertUser(User user) {

	}

}
