package com.movify.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movify.dao.IBlogDao;
import com.movify.entity.Blog;
import com.movify.entity.PagerData;
import com.movify.service.IBlogService;

@Service
public class BlogServiceImpl implements IBlogService {
	
	@Autowired
	private IBlogDao ibd;
	
	@Override
	public List<Map<String, Object>> newBlog(int num) {
		// TODO Auto-generated method stub
		return ibd.newBlog(num);
	}

	@Override
	public List<Map<String, Object>> ycBlog() {
		// TODO Auto-generated method stub
		return ibd.ycBolg();
	}

	@Override
	public List<Map<String, Object>> gfBlog() {
		// TODO Auto-generated method stub
		return ibd.gfBlog();
	}

	@Override
	public Map<String, Object> getBlogById(int bid) {
		// TODO Auto-generated method stub
		return ibd.getBlogById(bid);
	}

	@Override
	public int saveBlog(String btitle, String path, String bintroduce, String bcontent,int uid) {
		// TODO Auto-generated method stub
		return ibd.saveBlog(btitle,path,bintroduce,bcontent,uid);
	}

	@Override
	public List<Map<String, Object>> getBlogByUserId(Integer uid,Integer pageNo,Integer pageSize) {
		// TODO Auto-generated method stub
		return ibd.getBlogByUserId(uid,pageNo,pageSize);
	}

	@Override
	public int updateBlog(String btitle, String bintroduce, Integer bid, String bdetails) {
		// TODO Auto-generated method stub
		return ibd.updateBlog(btitle,bintroduce,bid,bdetails);
	}
	
	@Override
	public List<Map<String, Object>> find(Integer bcheckstate) {
		// TODO Auto-generated method stub
		return ibd.find(bcheckstate);
	}

	@Override
	public int Update(Integer bcheckstate) {
		// TODO Auto-generated method stub
		return ibd.Update(bcheckstate);
	}

	@Override
	public int delete(Integer bid) {
		// TODO Auto-generated method stub
		return ibd.delete(bid);
	}
	

	@Override
	public int delete(int bid) {
		// TODO Auto-generated method stub
		return ibd.delete(bid);
	}

	@Override
	public Map<String, Object> findGuo(int bid) {
		// TODO Auto-generated method stub
		return ibd.find(bid);
	}

	@Override
	public int add(Blog blog) {
		// TODO Auto-generated method stub
		return ibd.add(blog);
	}

	@Override
	public int update(Blog blog) {
		// TODO Auto-generated method stub
		return ibd.update(blog);
	}

	

	@Override
	public PagerData findByPage(Blog blog, int curPage, int pageSize) {
		// TODO Auto-generated method stub
		return ibd.findByPage(blog, curPage, pageSize);
	}

	@Override
	public PagerData findByPage(Integer curPage, Integer pageSize) {
		// TODO Auto-generated method stub
		return ibd.findByPage(curPage, pageSize);
	}

	@Override
	public List<Map<String, Object>> getBlogByKey(String blog_key) {
		// TODO Auto-generated method stub
		return ibd.getBlogByKey(blog_key);
	}

	@Override
	public int getMyBlogCount(Integer uid) {
		// TODO Auto-generated method stub
		return ibd.getMyBlogCount(uid);
	}

}
