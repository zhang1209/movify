package com.movify.dao;

import java.util.List;
import java.util.Map;

public interface IActorDao {
	/**
	 * 查询所有演员
	 * @author zhang
	 */
	List<Map<String,Object>> getActor();
	
	/**
	 * 根据id查询演员明细
	 * @param aid
	 * @return
	 */
	List<Map<String,Object>>getActorDetails(int aid);
	
	/**
	 * 查询视频演员
	 * @param key
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	List<Map<String, Object>> getActorByKey(String key, Integer pageNo, int pageSize);
	
	/**
	 * 查询演员记录表数量
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
