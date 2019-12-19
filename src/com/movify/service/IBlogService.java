package com.movify.service;

import java.util.List;
import java.util.Map;

import com.movify.entity.Blog;
import com.movify.entity.PagerData;

public interface IBlogService {
	/**
	 * 最新博客
	 * @author zhang
	 * @return
	 */
	List<Map<String,Object>> newBlog(int num);
	
	/**
	 * 原创博客
	 * @author zhang
	 * @return
	 */
	List<Map<String,Object>> ycBlog();
	
	/**
	 * 官方博客
	 * @return
	 */
	List<Map<String,Object>> gfBlog();
	
	/**
	 * 根据id获取博客
	 * @author zhang
	 */
	Map<String,Object> getBlogById(int bid);
	
	/**
	 * 添加博客
	 * @author zhang
	 */
	int saveBlog(String btitle, String path, String bintroduce, String bcontent,int uid);
	
	/**
	 * 根据用户id查询博客
	 * @author zhang
	 */
	List<Map<String,Object>> getBlogByUserId(Integer uid,Integer pageNo,Integer pageSize);
	
	/**
	 * 修改博客
	 * @param bname
	 * @param bintroduce
	 * @param bid
	 * @param bdetails
	 * @return
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
	Map<String,Object>findGuo(int bid);
	
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
	 * 分页查询
	 * @author guo
	 * @return
	 */
		
		PagerData findByPage(Integer curPage,Integer pageSize);
		
		/**
		 * 带条件的分页查询
		 * @author guo
		 * @return
		 */
		
		PagerData findByPage(Blog blog,int curPage,int pageSize);
		
		/**
		 * 多字段模糊查询
		 * @param blog_key
		 * @return
		 */
		List<Map<String,Object>> getBlogByKey(String blog_key);
		
		/**
		 * 查询我的博客有几条
		 * @param uid
		 * @return
		 */
		int getMyBlogCount(Integer uid);
		
	
}
