package com.movify.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.movify.dao.BaseDao;
import com.movify.dao.ICategoryDao;

@Repository
public class CategoryDaoImpl extends BaseDao implements ICategoryDao{

	@Override
	public List<Map<String, Object>> findAll() {
		String sql="select cid,cname from category";
		
		return executeQuery(sql, null);
	}

}
