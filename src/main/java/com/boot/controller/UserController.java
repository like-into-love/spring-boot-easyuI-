package com.boot.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.pojo.User;
import com.boot.user.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	UserService userService;

	@RequestMapping("/login")
	@ResponseBody
	public Boolean getUserLogin(String username, String password, HttpServletRequest request,
			HttpServletResponse response) {
		if (StringUtils.isBlank(password) || StringUtils.isBlank(username)) {
			return false;
		}
		User user = userService.getUserLogin(username, password);
		Cookie cookie = new Cookie("user", username);
		cookie.setPath("/");
		cookie.setMaxAge(-1);
		cookie.setDomain("localhost");
		response.addCookie(cookie);
		System.out.println(user);

		return true;
	}

}
