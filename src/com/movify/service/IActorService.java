package com.movify.service;

import java.util.List;
import java.util.Map;

public interface IActorService{
	/**
	 * 查询所有演员
	 * @author zhang
	 */
	List<Map<String,Object>> getActor();
	
	/**
	 * 根据id查询演员详细
	 * @param aid
	 * @return
	 */
	List<Map<String,Object>> getActorDetails(int aid);
	
	/**
	 * 条件模糊查询分页视频演员
	 * @param key
	 * @param pageNo
	 * @param i
	 * @return
	 */
	List<Map<String,Object>> getActorByKey(String key, Integer pageNo, int pageSize);
	
	/**
	 * 查询演员记录表数据总数
	 * @param key
	 * @return
	 */
	int getVideoActorCount(String key);
	
	/**
	 * 删除演员表演记录
	 * @param ahid
	 * @return
	 */
	int delVideoActor(Integer ahid);
	
	/**
	 * 添加演员表演记录
	 * @param actor
	 * @param video
	 * @return
	 */
	int addVideoActor(Integer actor, Integer video);
}
