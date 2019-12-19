package com.movify.dao;

import java.util.List;
import java.util.Map;

public interface ILanguageDao {
	//查看所有语种分类
List<Map<String, Object>> findAll();
}
