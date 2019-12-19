package com.movify.service;

import java.util.List;
import java.util.Map;

import com.movify.entity.Role;
import com.movify.entity.User;

public interface IRoleService {
	List<Map<String, Object>> list();
	
	int Add(Role role);
	
	int update(Role role);
	
	Map<String, Object> find(Integer rid);
	
	int delete(int rid);
}
