package com.movify.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.movify.dao.BaseDao;
import com.movify.dao.IRoleDao;
import com.movify.entity.Role;

@Repository
public class RoleDaoImpl extends BaseDao implements IRoleDao{

	@Override
	public List<Map<String, Object>> findAll() {
		String sql="select "
				+ " rid,rname"			
				+ " from role";
			
		
		return executeQuery(sql, null);
	}

	@Override
	public int Add(Role role) {
		String sql="insert into role"
				+ " (rname)"
				+ " values"
				+ " (?)";
		Object[] ps={role.getRname()};
		return executeUpdate(sql, ps);
	}

	@Override
	public int update(Role role) {
		String sql="update role set rname=?"				
				+ "  where rid=?";
		Object[] ps={
             role.getRname(),
             role.getRid()
            
		};
		return executeUpdate(sql, ps);
	}

	@Override
	public Map<String, Object> find(Integer rid) {
		String sql="select "
				+ " rid,rname"			
				+ " from role"
				+ " where rid =?";
		Object[] ps={rid};
		return executeQueryForMap(sql, ps);
	}

	@Override
	public int delete(int rid) {
		String sql="delete from role where rid=?";
				Object[] ps={rid};
		return executeUpdate(sql, ps);
	}

	

}
