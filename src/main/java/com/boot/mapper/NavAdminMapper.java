package com.boot.mapper;

import com.boot.pojo.NavAdmin;
import com.boot.pojo.NavAdminExample;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface NavAdminMapper {
	long countByExample(NavAdminExample example);

	int deleteByExample(NavAdminExample example);

	int deleteByPrimaryKey(Long id);

	int insert(NavAdmin record);

	int insertSelective(NavAdmin record);

	List<NavAdmin> selectByExample(NavAdminExample example);

	NavAdmin selectByPrimaryKey(Long id);

	int updateByExampleSelective(@Param("record") NavAdmin record, @Param("example") NavAdminExample example);

	int updateByExample(@Param("record") NavAdmin record, @Param("example") NavAdminExample example);

	int updateByPrimaryKeySelective(NavAdmin record);

	int updateByPrimaryKey(NavAdmin record);

	@Select("select count(*) as num from nav_admin")
	int selectNum();

}