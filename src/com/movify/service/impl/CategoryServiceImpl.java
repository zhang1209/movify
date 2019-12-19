package com.movify.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movify.dao.ICategoryDao;
import com.movify.service.ICategoryService;
@Service
public class CategoryServiceImpl implements ICategoryService{

	@Autowired
	private ICategoryDao categoryDao;
	@Override
	public List<Map<String, Object>> list() {
		// TODO Auto-generated method stub
		return categoryDao.findAll();
	}

}
