package com.boot.user.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.mapper.NavAdminMapper;
import com.boot.pojo.NavAdmin;
import com.boot.pojo.NavAdminExample;
import com.boot.user.service.NavService;

@Service
public class NavServiceImpl implements NavService {

	@Autowired
	NavAdminMapper navAdminMapper;

	@Override
	public List<NavAdmin> getNavAll(Long id) {
		NavAdminExample example = new NavAdminExample();
		example.createCriteria().andParentIdEqualTo(id);
		List<NavAdmin> list = navAdminMapper.selectByExample(example);
		return list;
	}

	@Override
	public Map<String, Object> getNavAlls(Integer page, Integer rows) {

		// 算出每页的起始索引
		int startIndex = (page - 1) * rows;
		NavAdminExample example = new NavAdminExample();
		example.setStartRow(startIndex);
		example.setPageSize(rows);
		List<NavAdmin> list = navAdminMapper.selectByExample(example);
		int selectNum = navAdminMapper.selectNum();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", selectNum);
		return map;
	}

	@Override
	public boolean addNav(NavAdmin navAdmin) {
		int i = navAdminMapper.insertSelective(navAdmin);
		// System.out.println("iiiiiiiiiiiiiiii" + i);
		if (i > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<NavAdmin> getParent() {
		NavAdminExample example = new NavAdminExample();
		example.createCriteria().andParentIdEqualTo(Long.valueOf(0));
		List<NavAdmin> list = navAdminMapper.selectByExample(example);
		return list;
	}

	@Override
	public boolean deleteMaun(String[] ids) {
		boolean b = true;
		try {
			for (String id : ids) {
				navAdminMapper.deleteByPrimaryKey(Long.valueOf(id));
			}
		} catch (NumberFormatException e) {
			b = false;
			throw new RuntimeException();
		}
		return b;
	}

}
