package com.movify.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movify.dao.IActorDao;
import com.movify.service.IActorService;

@Service
public class ActorServiceImpl implements IActorService {
	
	@Autowired
	private IActorDao iad;
	@Override
	public List<Map<String, Object>> getActor() {
		// TODO Auto-generated method stub
		return iad.getActor();
	}
	@Override
	public List<Map<String, Object>> getActorDetails(int aid) {
		// TODO Auto-generated method stub
		return iad.getActorDetails(aid);
	}
	@Override
	public List<Map<String, Object>> getActorByKey(String key, Integer pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return iad.getActorByKey(key,pageNo,pageSize);
	}
	@Override
	public int getVideoActorCount(String key) {
		// TODO Auto-generated method stub
		return iad.getVideoActorCount(key);
	}
	@Override
	public int delVideoActor(Integer ahid) {
		// TODO Auto-generated method stub
		return iad.delVideoActor(ahid);
	}
	@Override
	public int addVideoActor(Integer actor, Integer video) {
		// TODO Auto-generated method stub
		return iad.addVideoActor(actor,video);
	}
}
