package com.movify.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.movify.dao.BaseDao;
import com.movify.dao.ILanguageDao;
@Repository
public class LanguageDaoImpl extends BaseDao implements ILanguageDao{

	@Override
	public List<Map<String, Object>> findAll() {
		String sql="select lid,lname from language";

		return executeQuery(sql, null);
	}

}
