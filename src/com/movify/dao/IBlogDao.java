package com.movify.dao;

import java.util.List;
import java.util.Map;

import com.movify.entity.Blog;
import com.movify.entity.PagerData;

public interface IBlogDao {
	/**
	 * 最新博客
	 * @author zhang
	 * @return
	 */
	List<Map<String,Object>> newBlog(int num);
	
	/**
	 * 原创博客
	 * @return
	 */
	List<Map<String, Object>> ycBolg();
	
	/**
	 * 官方博客
	 * @author zhang
	 * @return
	 */
	List<Map<String, Object>> gfBlog();
	
	/**
	 * 根据id查询博客
	 * @author zhang
	 */
	Map<String, Object> getBlogById(int bid);
	
	/**
	 * 添加博客
	 *@author zhang
	 */
	int saveBlog(String btitle, String path, String bintroduce, String bcontent,int uid);
	
	/**
	 * 根据用户Id查询博客
	 * @author zhang
	 */
	List<Map<String, Object>> getBlogByUserId(Integer uid,Integer pageNo,Integer pageSize);
	
	/**
	 * 更新博客
	 * @author zhang
	 */
	int updateBlog(String btitle, String bintroduce, Integer bid, String bdetails);
	
	//查看审核博客状态
	List<Map<String, Object>> find(Integer bcheckstate);
	
	//修改审核状态
	int Update(Integer bcheckstate);
	
	//根据id删除博客
	int delete(Integer bid);
	
	/**
	 * 删除博客
	 * @author guo
	 * @return
	 */
	int delete(int bid);
	
	/**
	 * 根据Id删除博客
	 * @author guo
	 * @return
	 */
	Map<String,Object>find(int bid);
	
	/**
	 * 添加博客
	 * @author guo
	 * @return
	 */
	int add(Blog blog);
	
	/**
	 * 修改博客
	 * @author guo
	 * @return
	 */
	int update(Blog blog); 

	/**
	 * 带条件的分页查询博客
	 * @author guo
	 * @return
	 */
	
	//分页查询数据(不带条件)
	PagerData findByPage(int curPage,int pageSize);
	//待条件的分页查询
	PagerData findByPage(Blog blog,int curPage,int pageSize);
	
	/**
	 * 多字段模糊查询
	 * @author zhang
	 * @param blog_key
	 * @return
	 */
	List<Map<String, Object>> getBlogByKey(String blog_key);
	
	/**
	 * 查出我的博客有几条
	 * @param uid
	 * @return
	 */
	int getMyBlogCount(Integer uid);

	
}
