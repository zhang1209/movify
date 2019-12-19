package com.movify.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movify.dao.ILanguageDao;
import com.movify.service.ILanguageService;
@Service
public class LanguageServiceImpl implements ILanguageService{

	@Autowired
	private ILanguageDao languageDao;
	@Override
	public List<Map<String, Object>> list() {
		// TODO Auto-generated method stub
		return languageDao.findAll();
	}

}
