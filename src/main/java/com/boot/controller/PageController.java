package com.boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

	// 登陆页面
	@RequestMapping("/")
	public String loginPage() {
		return "login";
	}

	// 后台首页
	@RequestMapping("page/main")
	public String mainPage() {
		return "main";
	}

	// 点击菜单显示相应的选项卡
	@RequestMapping("page/goto/{p}")
	public String meunPage(@PathVariable String p) {
		p = p.substring(0, p.indexOf("."));
		return p;
	}
}
