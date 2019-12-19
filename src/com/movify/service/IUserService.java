package com.movify.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.movify.entity.PagerData;
import com.movify.entity.User;
import com.movify.entity.UserQuery;

public interface IUserService {
	/**
	 * 用户登录
	 * @author zhang
	 * @param username
	 * @param password
	 * @param num
	 * @return
	 */
	User isExists (String username, String password, int num);
	
	/**
	 * 用户名存在验证
	 * @author zhang
	 * @param uname
	 * @return
	 */
	boolean isExists(String uname);
	
	/**
	 * 注册
	 * @author zhang
	 * @param uname
	 * @param upw
	 * @param helpcode
	 * @return
	 */
	int register(String uname, String upw, String helpcode);
	
	/**
	 * 挽救码验证
	 * @author zhang
	 * @param username
	 * @param helpcode
	 * @return
	 */
	boolean forgetUpw(String username, String helpcode);
	
	/**
	 * 修改密码
	 * @author zhang
	 * @param username
	 * @param upw
	 * @return
	 */
	int updUpw(String username, String upw);
	
	/**
	 * 开通会员
	 * @author zhang
	 */
	int openVip(Integer uid);
	
	/**
	 * 
	 * @param uid
	 * @return
	 */
	Map<String,Object> getUser(Integer uid);
	
	/**
	 * 修改用户信息
	 * @author zhang
	 */
	int qt_updUser(String uname, String uemail, String uphone, String helpcode, String path,int uid);
	
	List<Map<String, Object>> list();
	Map<String, Object> find(int uid);
	int update(User user);
	//带条件的分页查询
	PagerData findByPage(UserQuery userQuery,int curPage,int pageSize);
	
	/**
	 * 后台用户登录
	 * @author guo
	 * @param username
	 * @param password
	 * @param num
	 * @return
	 */
	Map<String,Object>list(String username,String password);
	
	/**
	 * 更改用户状态
	 * @param uid
	 * @return
	 */
	int updState(Integer uid);
	
	/**
	 * 验证邮箱是否重复
	 * @param uemail
	 * @return
	 */
	boolean uemailIsExists(String uemail);
	
	/**
	 * 验证手机是否重复
	 * @param uphone
	 * @return
	 */
	boolean uphoneIsExists(String uphone);
	
}
