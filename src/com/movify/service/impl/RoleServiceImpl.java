package com.movify.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movify.dao.IRoleDao;
import com.movify.entity.Role;
import com.movify.entity.User;
import com.movify.service.IRoleService;

@Service
public class RoleServiceImpl implements IRoleService{

	@Autowired
	private IRoleDao roleDao;
	@Override
	public List<Map<String, Object>> list() {
		// TODO Auto-generated method stub
		return roleDao.findAll();
	}
	@Override
	public int Add(Role role) {
		// TODO Auto-generated method stub
		return roleDao.Add(role);
	}
	@Override
	public int update(Role role) {
		// TODO Auto-generated method stub
		return roleDao.update(role);
	}
	@Override
	public Map<String, Object> find(Integer rid) {
		// TODO Auto-generated method stub
		return roleDao.find(rid);
	}
	@Override
	public int delete(int rid) {
		// TODO Auto-generated method stub
		return roleDao.delete(rid);
	}

	
}
