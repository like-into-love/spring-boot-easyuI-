package com.boot.user.service;

import java.util.List;
import java.util.Map;

import com.boot.pojo.NavAdmin;

public interface NavService {

	/**
	 * 根据parentid父节点下的获取导航栏菜单
	 * 
	 * @return
	 */
	List<NavAdmin> getNavAll(Long id);

	/**
	 * 获取全部导航栏菜单
	 * 
	 * @return
	 */
	Map<String, Object> getNavAlls(Integer page, Integer rows);

	/**
	 * 添加一个新菜单
	 * 
	 * @param navAdmin
	 * @return
	 */
	boolean addNav(NavAdmin navAdmin);

	/**
	 * 查询一级菜单
	 * 
	 * @return
	 */
	List<NavAdmin> getParent();

	/**
	 * 根据id批量删除菜单
	 * 
	 * @param id
	 * @return
	 */
	boolean deleteMaun(String[] ids);

}
