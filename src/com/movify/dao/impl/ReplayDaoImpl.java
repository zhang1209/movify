package com.movify.dao.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.movify.dao.BaseDao;
import com.movify.dao.IReplayDao;

@Repository
public class ReplayDaoImpl extends BaseDao implements IReplayDao {

	@Override
	public List<Map<String, Object>> getReplay(int bid) {
		String sql = "select * from replay r ,user u "
				+ " where rpblog = ? and r.rpuser = u.uid and rpfid is null"; 
		Object[] ps = {bid};
		return executeQuery(sql,ps);
	}

	@Override
	public Map<String,Object> getReplayCount(int bid) {
		String sql = "select count(*) as zs from replay where rpblog = ?";
		Object[] ps = {bid};
		List<Map<String,Object>> list = executeQuery(sql,ps);
		return list.get(0);
	}

	@Override
	public int addReplay(int uid, int bid, String content) {
		String sql = "insert into replay "
				+ " (rpuser,rpblog,rpcontent,rpdate)"
				+ " values"
				+ " (?,?,?,?)";
		Object[] ps = {uid,bid,content,new Date()};
		return executeUpdate(sql,ps);
	}

	@Override
	public List<Map<String, Object>> getSonReplay(int bid, int rpfid) {
		String sql = "select * from replay r ,user u "
				+ " where rpblog = ? and r.rpuser = u.uid and rpfid = ?"; 
		Object[] ps = {bid,rpfid};
		return executeQuery(sql,ps);
	}

	@Override
	public int addSonReplay(int bid, int rpfid, String rpcontent, int uid) {
		String sql = "insert into replay (rpblog,rpfid,rpcontent,rpuser,rpdate)"
				+ " values"
				+ " (?,?,?,?,?)";
		Object[] ps = {bid,rpfid,rpcontent,uid,new Date()};
		return executeUpdate(sql,ps);
	}


}
