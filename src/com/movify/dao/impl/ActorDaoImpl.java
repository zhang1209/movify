package com.movify.dao.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.movify.dao.BaseDao;
import com.movify.dao.IActorDao;

@Repository
public class ActorDaoImpl extends BaseDao implements IActorDao {

	@Override
	public List<Map<String, Object>> getActor() {
		String sql = "select * from actor";
		return executeQuery(sql,null);
	}

	@Override
	public List<Map<String, Object>> getActorDetails(int aid) {
		String sql = "select a.*,vname,joindate,vid,vtype from "
				+ " actor a left join actor_history ah "
				+ " on a.aid=ah.actor "
				+ " left join video v "
				+ " on v.vid = ah.video "
				+ " where aid = ?";
		Object[] ps = {aid};
		return executeQuery(sql,ps);
	}

	@Override
	public List<Map<String, Object>> getActorByKey(String key, Integer pageNo, int pageSize) {
		String sql = "select ahid,aname,vname,vposter from "
				+ " actor_history ah "
				+ " left join video v "
				+ " on v.vid = ah.video "
				+ " left join actor a "
				+ " on a.aid = ah.actor "
				+ " where concat(aname,vname) like concat('%',?,'%') "
				+ " limit ?,?";
		int pageStart = (pageNo-1)*pageSize;
		Object[] ps = {key,pageStart,pageSize};
		return executeQuery(sql,ps);
	}

	@Override
	public int getVideoActorCount(String key) {
		String sql = "select count(*) from "
				+ " actor_history ah "
				+ " left join video v "
				+ " on v.vid = ah.video "
				+ " left join actor a "
				+ " on a.aid = ah.actor "
				+ " where concat(aname,vname) like concat('%',?,'%') ";
		Object[] ps = {key};
		return jt.queryForInt(sql,ps);
	}

	@Override
	public int delVideoActor(Integer ahid) {
		String sql = "delete from actor_history where ahid = ?";
		Object[] ps = {ahid};
		return executeUpdate(sql,ps);
	}

	@Override
	public int addVideoActor(Integer actor, Integer video) {
		String sql = "insert into actor_history "
				+ " (actor,video,joindate)"
				+ " values"
				+ " (?,?,?)";
		Object[] ps = {actor,video,new Date()};
		return executeUpdate(sql,ps);
	}

}
