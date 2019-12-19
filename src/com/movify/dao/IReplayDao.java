package com.movify.dao;

import java.util.List;
import java.util.Map;

public interface IReplayDao {
	/**
	 * 查出所有回复
	 * @author zhang
	 */
	List<Map<String,Object>> getReplay(int bid);
	
	/**
	 * 根据博客id查询总回复数
	 * @author zhang
	 */
	Map<String,Object> getReplayCount(int bid);
	
	/**
	 * 添加回复
	 * @author zhang
	 */
	int addReplay(int uid, int bid, String content);
	
	/**
	 * 查询子回复
	 * @param bid
	 * @param rpfid
	 * @return
	 */
	List<Map<String, Object>> getSonReplay(int bid, int rpfid);
	
	/**
	 * 添加子回复
	 * @param bid
	 * @param rpfid
	 * @param rpcontent
	 * @param uid
	 * @return
	 */
	int addSonReplay(int bid, int rpfid, String rpcontent, int uid);
	
}
