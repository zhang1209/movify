package com.movify.dao;

import java.util.List;
import java.util.Map;

import com.movify.entity.Role;

public interface IRoleDao {

	//查看员工
	List<Map<String, Object>> findAll();
	
	Map<String, Object> find(Integer rid);
	
	int Add(Role role);
	
	int update(Role role);
	
	int delete(int rid);
}
