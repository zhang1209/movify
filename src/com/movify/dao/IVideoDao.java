package com.movify.dao;

import java.util.List;
import java.util.Map;

import com.movify.entity.PagerData;
import com.movify.entity.Video;

public interface IVideoDao {
	/**
	 * 模糊查询视频表
	 * @author zhang
	 * @param key
	 * @return
	 */
	List<Map<String,Object>> searchVideo(String key,int curPage, int pageSize);
	
	/**
	 * 查询最新的视频
	 * @author zhang
	 * @return
	 */
	List<Map<String,Object>> newVideo();
	
	/**
	 * 查询最新的用户原创视频
	 * @author zhang
	 * @return
	 */
	List<Map<String,Object>> newUserVideo();
	
	/**
	 * 查询最热门的视频
	 * @author zhang
	 * @return
	 */
	List<Map<String,Object>> hotVideo();
	
	/**
	 * 查询视频数量，博客数量，用户数量
	 * @author zhang
	 * @return
	 */
	List<Map<String,Object>> getDataCount();
	
	/**
	 * 根据类型（电影，连续剧，用户原创）查询视频
	 * @author zhang
	 * @param typeid
	 * @return
	 */
	List<Map<String, Object>> getVideoByType(int typeid,Integer pageNo,Integer pageSize);
	
	/**
	 * 获取单条视频记录根据id
	 * @author zhang
	 * @param id
	 * @return
	 */
	List<Map<String, Object>> getVideoById(int id);
	
	/**
	 * 查出视频精彩截图
	 * @author zhang
	 * @param id
	 * @return
	 */
	List<Map<String, Object>> getVideoPhoto(int id);
	
	/**
	 * 根据电影id查询演员
	 * @author zhang
	 * @param id
	 * @return
	 */
	List<Map<String, Object>> getActor(int id);
	
	/**
	 * 查询登录的用户是否已经将此视频放入稍后观看
	 * @author zhang
	 * @param vid
	 * @param uid
	 * @return
	 */
	boolean queryWatchLater(int vid, int uid);
	
	/**
	 * 添加watch_later数据
	 * @author zhang
	 */
	int addWatchLater(int vid,int uid);
	
	/**
	 * 根据用户id查询出来稍后观看
	 * @author zhang
	 * @param uid
	 * @param pageSize 
	 * @param pageNo 
	 * @return
	 */
	List<Map<String, Object>> queryWatchLaterByUid(int uid, Integer pageNo, int pageSize);
	
	/**
	 * 根据用户id，视频id删除稍后观看
	 * @param uid
	 * @param vid
	 * @return
	 */
	int watchLaterDel(int uid, int vid);
	
	/**
	 * 查询用户是否已经对视频点赞
	 * @author zhang
	 */
	boolean queryVideo_likeById(int uid,int vid);
	
	/**
	 * 增加视频点赞数根据视频id
	 * @author zhang
	 */
	int addLike(int vid);
	
	/**
	 * 增加用户视频点赞关联表数据
	 * @author zhang
	 */
	int addVideo_Like(int uid,int vid);
	
	/**
	 * 删除用户点赞关联表数据
	 * @author zhang
	 */
	int delVideo_Like(int uid,int vid);
	
	/**
	 * 对视频点赞数的修改
	 * @author zhang
	 */
	int delLike(int vid);
	
	/**
	 * 查询所有视频分类
	 * @author zhang
	 */
	List<Map<String, Object>> getCategory();

	/**
	 * 查询所有视频语种
	 * @author zhang
	 */
	List<Map<String, Object>> getLanguage();
	
	/**
	 * 视频上传
	 *@author zhang
	 * @param vtype 
	 * @param vtime 
	 */
	int upVideo(Integer uid, String vname, String vcountry, String vdirector, int vcost, String vstudio, Integer cid,
			Integer lid, String vposter, String vsrc, String vintroduce, int vtype, String vtime);
	
	/**
	 * 查出我的视频
	 * @param uid
	 * @return
	 */
	List<Map<String, Object>> getVideoByUserId(Integer uid,Integer pageNo,Integer pageSize);
	
	/**
	 * 修改视频
	 * @param vname
	 * @param vintroduce
	 * @param vid
	 * @param lid 
	 * @param cid 
	 * @return
	 */
	int updateVideo(String vname, String vintroduce, Integer vid, Integer cid, Integer lid);
	
	/**
	 * 获取视频总量跳跳条件查询
	 * @author zhang
	 */
	int count(String key);
	
	int getCountByType(Integer vtype);

	//查看审核视频
	List<Map<String, Object>> find(Integer vcheckstate);
	
	//修改审核状态
	int Update(Integer vcheckstate);
	
	//根据id删除视频
	int delete(Integer vid);
	
	/**
	 * 查询全部视频表
	 * @author guo
	 * @param key
	 * @return
	 */
	List<Map<String,Object>> findall();
	
	
	/**
	 * 根据Id删除视频
	 * @author guo
	 * @param key
	 * @return
	 */
	int deleteVideo(Integer vid);
	
	
	
	/**
	 * 根据Id查询一条视频
	 * @author guo
	 * @param key
	 * @return
	 */
	Map<String,Object> findVideo(Integer vid);
	
	/**
	 * 添加视频
	 * @author guo
	 * @param key
	 * @return
	 */
	
	
	int add(Video video);
	
	
	
	
	/**
	 * 修改视频
	 * @author guo
	 * @param key
	 * @return
	 */
	
	int update(Video video);
	
	//分页查询数据(不带条件)
	PagerData findByPage(int curPage,int pageSize);
	
	/**
	 * 查出我的视频有几条
	 * @return
	 */
	int getMyVideoCount(Integer uid);
	
	/**
	 * 查出收藏几条
	 * @param uid
	 * @return
	 */
	int getWatchLaterCount(int uid);
	
	/**
	 * 条件查询视频图片表（分页）
	 * @param key
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	List<Map<String, Object>> getVideoPhotoByKey(String key, Integer pageNo, Integer pageSize);
	
	/**
	 * 条件查询视频图片数量
	 * @param key
	 * @return
	 */
	int getVideoPhotoCount(String key);
	
	/**
	 * 根据vpid删除视频图片
	 * @param vpid
	 * @return
	 */
	int delVideoPhoto(Integer vpid);
	
	/**
	 * 添加视频图片
	 * @param video
	 * @param path
	 * @return
	 */
	int addVideoPhoto(Integer video, String path);
}
