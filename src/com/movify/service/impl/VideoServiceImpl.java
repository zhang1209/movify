package com.movify.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movify.dao.IVideoDao;
import com.movify.dao.impl.VideoDaoImpl;
import com.movify.entity.PagerData;
import com.movify.entity.Video;
import com.movify.service.IVideoService;

@Service
public class VideoServiceImpl implements IVideoService {
	
	@Autowired
	IVideoDao ivd = new VideoDaoImpl();
	
	@Override
	public List<Map<String, Object>> videoSearch(String key,int pageNo,int pageSize) {
		// TODO Auto-generated method stub
		return ivd.searchVideo(key,pageNo,pageSize);
	}
	@Override
	public List<Map<String, Object>> newVideo() {
		// TODO Auto-generated method stub
		return ivd.newVideo();
	}
	@Override
	public List<Map<String, Object>> newUserVideo() {
		// TODO Auto-generated method stub
		return ivd.newUserVideo();
	}
	@Override
	public List<Map<String, Object>> hotVideo() {
		// TODO Auto-generated method stub
		return ivd.hotVideo();
	}
	@Override
	public List<Map<String, Object>> getDataCount() {
		// TODO Auto-generated method stub
		return ivd.getDataCount();
	}
	@Override
	public List<Map<String, Object>> getVideoByType(int typeid,Integer pageNo,Integer pageSize) {
		// TODO Auto-generated method stub
		return ivd.getVideoByType(typeid,pageNo,pageSize);
	}
	@Override
	public List<Map<String, Object>> getVideoById(int id) {
		// TODO Auto-generated method stub
		return ivd.getVideoById(id);
	}
	@Override
	public List<Map<String, Object>> getVideoPhoto(int id) {
		// TODO Auto-generated method stub
		return ivd.getVideoPhoto(id);
	}
	@Override
	public List<Map<String, Object>> getActor(int id) {
		// TODO Auto-generated method stub
		return ivd.getActor(id);
	}
	@Override
	public boolean queryWatchLater(int vid, int uid) {
		// TODO Auto-generated method stub
		return ivd.queryWatchLater(vid,uid);
	}
	@Override
	public int addWatchLater(int vid, int uid) {
		// TODO Auto-generated method stub
		return ivd.addWatchLater(vid, uid);
	}
	@Override
	public List<Map<String, Object>> queryWatchLaterByUid(int uid,Integer pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return ivd.queryWatchLaterByUid(uid,pageNo,pageSize);
	}
	@Override
	public int watchLaterDel(int uid, int vid) {
		// TODO Auto-generated method stub
		return ivd.watchLaterDel(uid,vid);
	}
	@Override
	public boolean queryVideo_likeById(int uid, int vid) {
		// TODO Auto-generated method stub
		return ivd.queryVideo_likeById(uid, vid);
	}
	@Override
	public int addLike(int vid) {
		// TODO Auto-generated method stub
		return ivd.addLike(vid);
	}
	@Override
	public int addVideo_Like(int uid, int vid) {
		// TODO Auto-generated method stub
		return ivd.addVideo_Like(uid, vid);
	}
	@Override
	public int delVideo_Like(int uid, int vid) {
		// TODO Auto-generated method stub
		return ivd.delVideo_Like(uid, vid);
	}
	@Override
	public int delLike(int vid) {
		// TODO Auto-generated method stub
		return ivd.delLike(vid);
	}
	@Override
	public List<Map<String, Object>> getCategory() {
		// TODO Auto-generated method stub
		return ivd.getCategory();
	}
	@Override
	public List<Map<String, Object>> getLanguage() {
		// TODO Auto-generated method stub
		return ivd.getLanguage();
	}
	@Override
	public int upVideo(Integer uid, String vname, String vcountry, String vdirector, int vcost, String vstudio,
			Integer cid, Integer lid, String vposter, String vsrc, String vintroduce,int vtype,String vtime) {
		// TODO Auto-generated method stub
		return ivd.upVideo(uid,vname,vcountry,vdirector,vcost,vstudio,cid,lid,vposter,vsrc,vintroduce,vtype,vtime);
	}
	@Override
	public List<Map<String, Object>> getVideoByUserId(Integer uid,Integer pageNo,Integer pageSize) {
		// TODO Auto-generated method stub
		return ivd.getVideoByUserId(uid,pageNo,pageSize);
	}
	@Override
	public int updateVideo(String vname, String vintroduce, Integer vid,Integer cid,Integer lid) {
		// TODO Auto-generated method stub
		return ivd.updateVideo(vname,vintroduce,vid,cid,lid);
	}
	
	@Override
	public List<Map<String, Object>> find(Integer vcheckstate) {
		// TODO Auto-generated method stub
		return ivd.find(vcheckstate);
	}
	@Override
	public int Update(Integer vcheckstate) {
		// TODO Auto-generated method stub
		return ivd.Update(vcheckstate);
	}
	@Override
	public int delete(Integer vid) {
		// TODO Auto-generated method stub
		return ivd.delete(vid);
	}
	
	@Override
	public List<Map<String, Object>> findall() {
		// TODO Auto-generated method stub
		return ivd.findall();
	}
	@Override
	public int deleteVideo(Integer vid) {
		// TODO Auto-generated method stub
		return ivd.deleteVideo(vid);
	}
	@Override
	public Map<String, Object> findVideo(Integer vid) {
		// TODO Auto-generated method stub
		return ivd.findVideo(vid);
	}
	@Override
	public int add(Video video) {
		// TODO Auto-generated method stub
		return ivd.add(video);
	}
	@Override
	public int update(Video video) {
		// TODO Auto-generated method stub
		return ivd.update(video);
	}
	@Override
	public PagerData findByPage(int curPage, int pageSize) {
		// TODO Auto-generated method stub
		return ivd.findByPage(curPage, pageSize);
	}
	@Override
	public int count(String key) {
		// TODO Auto-generated method stub
		return ivd.count(key);
	}
	@Override
	public int getCountByType(Integer vtype) {
		// TODO Auto-generated method stub
		return ivd.getCountByType(vtype);
	}
	@Override
	public int getMyVideoCount(Integer uid) {
		// TODO Auto-generated method stub
		return ivd.getMyVideoCount(uid);
	}
	@Override
	public int getWatchLaterCount(int uid) {
		// TODO Auto-generated method stub
		return ivd.getWatchLaterCount(uid);
	}
	@Override
	public List<Map<String, Object>> getVideoPhotoByKey(String key, Integer pageNo, Integer pageSize) {
		// TODO Auto-generated method stub
		return ivd.getVideoPhotoByKey(key,pageNo,pageSize);
	}
	@Override
	public int getVideoPhotoCount(String key) {
		// TODO Auto-generated method stub
		return ivd.getVideoPhotoCount(key);
	}
	@Override
	public int delVideoPhoto(Integer vpid) {
		// TODO Auto-generated method stub
		return ivd.delVideoPhoto(vpid);
	}
	@Override
	public int addVideoPhoto(Integer video, String path) {
		// TODO Auto-generated method stub
		return ivd.addVideoPhoto(video,path);
	}

}
