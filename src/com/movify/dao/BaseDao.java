package com.movify.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BaseDao {
	@Autowired
	protected JdbcTemplate jt;
	
	public List<Map<String,Object>> executeQuery(String sql,Object[] ps) {
		return jt.queryForList(sql,ps);
	}
	
	public int executeUpdate(String sql, Object[] ps) {
		return jt.update(sql,ps);
	}
	
	//查询单条
	public Map<String, Object> executeQueryForMap(String sql,Object[] ps){
		return jt.queryForMap(sql, ps);
	}
}
