package com.movify.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.movify.dao.BaseDao;
import com.movify.dao.IVideoDao;
import com.movify.entity.PagerData;
import com.movify.entity.Video;

@Repository
public class VideoDaoImpl extends BaseDao implements IVideoDao {

	@Override
	public List<Map<String, Object>> searchVideo(String key,int pageNo, int pageSize) {
		String sql = "select "
				+ " v.vid,v.vposter,v.vrating,v.vname,v.vintroduce,"
				+ " v.vcountry,v.vdirector,v.vstudio,v.vtype,"
				+ " v.vcheckstate,v.vdate,	c.cname,l.lname,u.uname "
				+ " from video v "
				+ " left join user u on v.vuser = u.uid "
				+ " left join category c on c.cid = v.vcategory"
				+ " left join language l on v.vlanguage = l.lid "
				+ " where v.vcheckstate=2 and v.vstate=1 and"
				+ " concat(v.vname,v.vintroduce,v.vcountry,v.vdirector,v.vstudio,"
				+ " v.vcheckstate,v.vdate,c.cname,l.lname,u.uname) like concat('%',?,'%')"
				+ " limit ?,?";
		if (key==null) {
			key="";
		} 
		int pageStart = (pageNo-1)*pageSize;
		Object[] ps = {key,pageStart,pageSize};
		return executeQuery(sql,ps);
	}

	@Override
	public List<Map<String, Object>> newVideo() {
		String sql = "select * from video"
				+ " where vtype!=3 and vcheckstate=2 and vstate=1"
				+ " order by vdate desc"
				+ " limit 0,6 ";		
		return executeQuery(sql,null);
	}

	@Override
	public List<Map<String, Object>> newUserVideo() {
		String sql = "select * from video"
				+ " where vtype=3 and vcheckstate=2 and vstate=1"
				+ " order by vdate desc"
				+ " limit 0,3";
		return executeQuery(sql,null);
	}

	@Override
	public List<Map<String, Object>> hotVideo() {
		String sql = "select * from video"
				+ " where vcheckstate=2 and vstate=1"
				+ " order by vlikecount desc"
				+ " limit 0,5";
		return executeQuery(sql,null);
	}

	@Override
	public List<Map<String, Object>> getDataCount() {
		String sql = "select count(*) as count from video union"
				+ " select count(*) from blog union"
				+ " select count(*) from user";
		return executeQuery(sql,null);
	}

	@Override
	public List<Map<String, Object>> getVideoByType(int typeid,Integer pageNo,Integer pageSize) {
		String sql = "select "
				+ " v.vid,v.vposter,v.vrating,v.vname,v.vintroduce,"
				+ " v.vcountry,v.vdirector,v.vstudio,v.vtype,"
				+ " v.vcheckstate,v.vdate,	c.cname,l.lname,u.uname "
				+ " from video v "
				+ " left join user u on v.vuser = u.uid "
				+ " left join category c on c.cid = v.vcategory"
				+ " left join language l on v.vlanguage = l.lid "
				+ " where v.vcheckstate=2 and v.vstate=1 and"
				+ " vtype=? limit ?,?";
		int pageStart = (pageNo-1)*pageSize;
		Object[] ps = {typeid,pageStart,pageSize};
		return executeQuery(sql,ps);
	}

	@Override
	public List<Map<String, Object>> getVideoById(int id) {
		String sql = "select * from "
				+ " video v left join "
				+ " category c on v.vcategory = c.cid "
				+ " left join language l on l.lid=v.vlanguage "
				+ " where vid = ?";
		Object[] ps = {id};
		return executeQuery(sql,ps);
	}

	@Override
	public List<Map<String,Object>> getVideoPhoto(int id) {
		String sql = "select vpname "
				+ " from videophoto vp "
				+ " left join video v "
				+ " on v.vid=vp.video "
				+ " where vid = ?";
		Object[] ps = {id};
		return executeQuery(sql,ps);
	}

	@Override
	public List<Map<String, Object>> getActor(int id) {
		String sql = "select a.* "
				+ " from actor a "
				+ " left join actor_history ah "
				+ " on a.aid=ah.actor "
				+ " left join video v "
				+ " on ah.video = v.vid "
				+ " where v.vid=?";
		Object[] ps = {id};
		return executeQuery(sql,ps);
	}

	@Override
	public boolean queryWatchLater(int vid, int uid) {
		String sql = "select * from watch_later where wlvideo=? and wluser=?";
		Object[] ps = {vid,uid};
		List<Map<String,Object>> list = executeQuery(sql,ps);
		if (list.size()>0) {
			return true;
		}
		return false;
	}

	@Override
	public int addWatchLater(int vid, int uid) {
		String sql = "insert into watch_later "
				+ " (wlvideo,wluser,wldate)"
				+ " values"
				+ " (?,?,?)";
		Object[] ps = {vid,uid,new Date()};
		return executeUpdate(sql,ps);
	}

	@Override
	public List<Map<String, Object>> queryWatchLaterByUid(int uid,Integer pageNo, int pageSize) {
		String sql = "select vposter,vname,vintroduce,vid,vtype "
				+ " from watch_later wl "
				+ " left join video v "
				+ " on wl.wlvideo = v.vid "
				+ " where wl.wluser=? and v.vstate = 1"
				+ " limit ?,?";
		int pageStart = (pageNo-1)*pageSize;
		Object[] ps = {uid,pageStart,pageSize};
		return executeQuery(sql,ps);
	}

	@Override
	public int watchLaterDel(int uid, int vid) {
		String sql = "delete from watch_later where wluser=? and wlvideo=?";
		Object[] ps = {uid,vid};
		return executeUpdate(sql,ps);
	}

	@Override
	public boolean queryVideo_likeById(int uid, int vid) {
		String sql = "select * from video_like where vluser = ? and vlvideo = ?";
		Object[] ps = {uid,vid};
		List<Map<String,Object>> list = executeQuery(sql,ps);
		if (list.size()>0) {
			return true;
		}
		return false;
	}

	@Override
	public int addLike(int vid) {
		String sql = "update video set vlikecount = vlikecount+1 where vid = ?";
		Object[] ps = {vid};
		return executeUpdate(sql,ps);
	}

	@Override
	public int addVideo_Like(int uid, int vid) {
		String sql = "insert into video_like(vluser,vlvideo)values(?,?)";
		Object[] ps = {uid,vid};
		return executeUpdate(sql,ps);
	}

	@Override
	public int delVideo_Like(int uid, int vid) {
		String sql = "delete from video_like where vluser = ? and vlvideo = ?";
		Object[] ps = {uid,vid};
		return executeUpdate(sql,ps);
	}

	@Override
	public int delLike(int vid) {
		String sql = "update video set vlikecount = vlikecount-1 where vid = ?";
		Object[] ps = {vid};
		return executeUpdate(sql,ps);
	}

	@Override
	public List<Map<String, Object>> getCategory() {
		String sql = "select cid,cname from category ";
		return executeQuery(sql,null);
	}

	@Override
	public List<Map<String, Object>> getLanguage() {
		String sql = "select lid,lname from language";
		return executeQuery(sql,null);
	}

	@Override
	public int upVideo(Integer uid, String vname, String vcountry, String vdirector, int vcost, String vstudio,
			Integer cid, Integer lid, String vposter, String vsrc, String vintroduce,int vtype,String vtime) {
		String sql = "insert into video"
				+ " (vuser,vname,vcountry,vdirector,vcost,vstudio"
				+ " ,vcategory,vlanguage,vposter,vsrc,vintroduce,vtype,vdate,vtime)values"
				+ "(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] ps = {uid,vname,vcountry,vdirector,vcost,vstudio,cid,lid,vposter,vsrc,vintroduce,vtype,new Date(),vtime};
		return executeUpdate(sql,ps);
	}

	@Override
	public List<Map<String, Object>> getVideoByUserId(Integer uid,Integer pageNo,Integer pageSize) {
		String sql = "select vname,vposter,vid,vdate,vintroduce,vtype,vcheckstate "
				+ " from video"
				+ " where vuser = ? and vstate = 1 limit ?,?";
		int pageStart = (pageNo-1)*pageSize;
		Object[] ps = {uid,pageStart,pageSize};
		return executeQuery(sql,ps);
	}

	@Override
	public int updateVideo(String vname, String vintroduce, Integer vid,Integer cid,Integer lid) {
		String sql = "update video set vname = ?,vintroduce=?, vcategory=?, vlanguage=? where vid = ?";
		Object[] ps = {vname,vintroduce,cid,lid,vid};
		return executeUpdate(sql,ps);
	}
	
	@Override
	public List<Map<String, Object>> find(Integer vcheckstate) {
		String sql=" select vid,vname,vsrc,vcheckstate,uname "
				+ " from video v,user u where vcheckstate =? and u.uid = v.vuser";
		Object[] ps = {vcheckstate};	
		return executeQuery(sql, ps);
	}

	@Override
	public int Update(Integer vcheckstate) {
		String sql=" update video set vcheckstate=2 where vid=?";
		Object[] ps={vcheckstate};
		return executeUpdate(sql, ps);
	}

	@Override
	public int delete(Integer vid) {
		String sql="update video set vstate = ? where vid = ?";
		String sql2 = "select * from video where vid = ?";
		Object[] ps2 ={vid};
		int vstate = 2;
		List<Map<String,Object>> list = executeQuery(sql2,ps2);
		if ((int)list.get(0).get("vstate") == 2) {
			vstate = 1;
		}
		Object[] ps={vstate,vid};
		return executeUpdate(sql, ps);
	}
	
	/*
	 * 查询所有*/
	@Override
	public List<Map<String, Object>> findall() {
		String sql = "select "
				+ " v.vid,v.vposter,v.vrating,v.vname,v.vintroduce,"
				+ " v.vcountry,v.vdirector,v.vstudio,v.vtype,"
				+ " v.vtime,v.vrating, v.vlikecount,v.vsrc,v.vstate,"
				+ " v.vcheckstate,v.vdate,c.cname,l.lname,u.uname "
				+ " from video v "
				+ " left join user u on v.vuser = u.uid "
				+ " left join category c on c.cid = v.vcategory"
				+ " left join language l on v.vlanguage = l.lid ";
		
		return executeQuery(sql, null);
	}

	@Override
	/*
	 * 删除*/
	public int deleteVideo(Integer vid) {
		String sql="delete from video where vid=?";
		Object[] params={vid};
		return executeUpdate(sql, params);
	}

	/*
	 * 添加*/
	@Override
	public int add(Video video) {
		String sql="insert into video"
				+ " (vname,vtype,vcategory,vlanguage,vuser,vdate,vtime,"
				+ " vrating,vposter,vintroduce,"
				+ " vlikecount,vsrc,vstate,vcountry,vdirector,vcost,"
				+ " vstudio,vcheckstate)"
				+ " values"
				+ " (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params={
				video.getVname(),
				1,
				video.getVcategory(),
				video.getVlanguage(),
				video.getVuser(),
				new Date(),
				video.getVtime(),
				video.getVrating(),
				video.getVposter(),
				"真好看",
				0,
				video.getVsrc(),
				1,
				video.getVcountry(),
				video.getVdirector(),
				video.getVcost(),
				video.getVstudio(),
				2
		};
		return executeUpdate(sql, params);
	}

	@Override
	/*
	 * 修改*/
	public int update(Video video) {
	
	String sql="update video set "
			+ " vname=?,"
			+ " vrating=?,"
			+ " vlikecount=?,"
			+ " vcountry=?,"
			+ " vdirector=?"
			+ " where vid=?";
	Object[] params={
			video.getVname(),
			video.getVrating(),
			video.getVlikecount(),
			video.getVcountry(),
			video.getVdirector(),
			video.getVid()
			
	};
		return executeUpdate(sql, params);
	}

	@Override
	public Map<String, Object> findVideo(Integer vid) {
		String sql = "select "
				+ " v.vid,v.vposter,v.vrating,v.vname,v.vintroduce,"
				+ " v.vcountry,v.vdirector,v.vstudio,v.vtype,"
				+ " v.vtime,v.vrating, v.vlikecount,v.vsrc,v.vstate,"
				+ " v.vcheckstate,v.vdate,	c.cname,l.lname,u.uname "
				+ " from video v "
				+ " left join user u on v.vuser = u.uid "
				+ " left join category c on c.cid = v.vcategory"
				+ " left join language l on v.vlanguage = l.lid "
				+ " where vid=?";
		Object[] params={vid};
		List<Map<String,Object>> list=executeQuery(sql, params);
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}

	

	@Override
	public PagerData findByPage(int curPage, int pageSize) {
		
		String sqlTotal = "select"
				+ " count(*) "
				+ " from video v "
				+ " left join user u on v.vuser = u.uid "
				+ " left join category c on c.cid = v.vcategory"
				+ " left join language l on v.vlanguage = l.lid ";
				
				
		//查询总记录数
		int totalCount = jt.queryForInt(sqlTotal);
		//计算总共有几页
		int totalPage = totalCount%pageSize==0?
					    totalCount/pageSize   :
					    totalCount/pageSize+1 ;
		

		String sql = "select "
				+ " v.vid,v.vposter,v.vrating,v.vname,v.vintroduce,"
				+ " v.vcountry,v.vdirector,v.vstudio,v.vtype,v.vcost,"
				+ " v.vtime,v.vrating, v.vlikecount,v.vsrc,v.vstate,"
				+ " v.vcheckstate,v.vdate,c.cname,l.lname,u.uname "
				+ " from video v "
				+ " left join user u on v.vuser = u.uid "
				+ " left join category c on c.cid = v.vcategory"
				+ " left join language l on v.vlanguage = l.lid "
				+ " order by v.vid"
				+ " limit ?,?";
		
		
		//计算分页查询的开始位置
		int start = (curPage-1)*pageSize;
		
		List<Object> params = new ArrayList<Object>();
		params.add(start);
		params.add(pageSize);
		
		//查询当前页的数据记录
		List<Map<String,Object>> dataList = executeQuery(sql,params.toArray());
		
		//将数据封装到分页数据对象中
		PagerData pd = new PagerData();
		pd.setCurPage(curPage); //当前第几页
		pd.setPageSize(pageSize); //每页几条
		pd.setTotalCount(totalCount);//共几条数据
		pd.setTotalPage(totalPage); //共几页
		pd.setDataList(dataList); //当前页的数据
		
		return pd;
	}

	@Override
	public int count(String key) {
		String sql = "select count(*)"
				+ " from video v "
				+ " left join user u on v.vuser = u.uid "
				+ " left join category c on c.cid = v.vcategory"
				+ " left join language l on v.vlanguage = l.lid "
				+ " where v.vcheckstate=2 and v.vstate=1 and"
				+ " concat(v.vname,v.vintroduce,v.vcountry,v.vdirector,v.vstudio,"
				+ " v.vcheckstate,v.vdate,c.cname,l.lname,u.uname) like concat('%',?,'%')";
		if (key == null) {
			key = "";
		}
		Object[] ps = {key};
		int count = jt.queryForInt(sql, ps);
		return count;
	}

	@Override
	public int getCountByType(Integer vtype) {
		String sql = "select count(*)"
				+ " from video v "
				+ " left join user u on v.vuser = u.uid "
				+ " left join category c on c.cid = v.vcategory"
				+ " left join language l on v.vlanguage = l.lid "
				+ " where v.vcheckstate=2 and v.vstate=1 and"
				+ " vtype=?";
		Object[] ps = {vtype};
		return jt.queryForInt(sql, ps);
	}

	@Override
	public int getMyVideoCount(Integer uid) {
		String sql = "select count(*) from video where vuser = ? and vstate = 1";
		Object[] ps = {uid};
		return jt.queryForInt(sql,ps);
	}

	@Override
	public int getWatchLaterCount(int uid) {
		String sql = "select count(*) from watch_later , video v where wluser = ? and wlvideo = v.vid "
				+ " and v.vstate = 1";
		Object[] ps = {uid};
		return jt.queryForInt(sql,ps);
	}

	@Override
	public List<Map<String, Object>> getVideoPhotoByKey(String key, Integer pageNo, Integer pageSize) {
		String sql = "select vp.vpid,vname,vp.vpname,v.vposter "
				+ " from videophoto vp  "
				+ " left join video v "
				+ " on vp.video = v.vid "
				+ "	where vname like concat('%',?,'%')"
				+ " limit ?,?";
		int pageStart = (pageNo-1)*pageSize;
		Object[] ps = {key,pageStart,pageSize};
		return executeQuery(sql,ps);
	}

	@Override
	public int getVideoPhotoCount(String key) {
		String sql = "select count(*) "
				+ " from videophoto vp  "
				+ " left join video v "
				+ " on vp.video = v.vid "
				+ "	where vname like concat('%',?,'%')";
		Object[] ps = {key};
		return jt.queryForInt(sql,ps);
	}

	@Override
	public int delVideoPhoto(Integer vpid) {
		String sql = "delete from videophoto where vpid = ?";
		Object[] ps = {vpid};
		return executeUpdate(sql,ps);
	}

	@Override
	public int addVideoPhoto(Integer video, String path) {
		String sql = "insert into videophoto"
				+ " (video,vpname)"
				+ " values"
				+ " (?,?)";
		Object[] ps = {video,path};
		return executeUpdate(sql,ps);
	}


}
