package com.boot.controller;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.pojo.NavAdmin;
import com.boot.user.service.NavService;

@Controller
@RequestMapping("main")
public class MainController {

	@Autowired
	NavService navService;
	@Value("${NAME}")
	private String NAME;

	// 根据parentid父节点下的获取导航栏菜单
	@RequestMapping("/navs")
	@ResponseBody
	public List<NavAdmin> getAllNva(@RequestParam(value = "id", defaultValue = "0") Long id) {
		// tree，默认会把id传过来首次加载设置默认值为0加载父节点
		// System.out.println(id);
		// System.out.println(NAME);

		List<NavAdmin> navAll = navService.getNavAll(id);
		return navAll;
	}

	/**
	 * 菜单管理显示全部菜单，并且分页，默认easyui会传两个参数
	 * 
	 * @param page
	 *            第几页
	 * @param rows
	 *            每页显示的条数
	 * @return
	 */
	@PostMapping("/getnavsAll.do")
	@ResponseBody
	public Map<String, Object> getAllNvas(Integer page, Integer rows) {
		Map<String, Object> navAll = navService.getNavAlls(page, rows);
		return navAll;
	}

	/**
	 * 添加一个新菜单
	 * 
	 * @param navAdmin
	 * @return
	 */
	@PostMapping("/addSave")
	@ResponseBody
	public boolean addNavAdmin(NavAdmin navAdmin) {
		boolean b = navService.addNav(navAdmin);
		return b;

	}

	/**
	 * 查询一级菜单
	 * 
	 * @return
	 */
	@RequestMapping("/getparent")
	@ResponseBody
	public List<NavAdmin> getParent() {
		List<NavAdmin> list = navService.getParent();
		return list;
	}

	@DeleteMapping("/deleteMaun/{ids}")
	@ResponseBody
	public boolean deleteMaun(@PathVariable("ids") String[] ids) {
		boolean b = navService.deleteMaun(ids);
		return b;

	}
}
