package com.movify.dao;

import java.util.List;
import java.util.Map;

import com.movify.entity.PagerData;
import com.movify.entity.User;
import com.movify.entity.UserQuery;

public interface IUserDao {
	/**
	 * 登录验证
	 * @author zhang
	 * @param username
	 * @param password
	 * @param num
	 * @return
	 */
	List<Map<String,Object>> isExists(String username, String password,int num);
	
	/**
	 * 验证用户存在性
	 * @author zhang
	 * @param uname
	 * @return
	 */
	boolean isExists(String uname);
	
	/**
	 * 新增用户
	 * @author zhang
	 * @param uname
	 * @param upw
	 * @param helpcode
	 * @return
	 */
	int add(String uname, String upw, String helpcode);
	
	/**
	 * 验证挽救码的正确性
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
	 * 查询用户
	 * @param uid
	 * @return
	 */
	Map<String, Object> getUser(Integer uid);
	
	/**
	 * 修改用户信息
	 * @author zhang
	 */
	int updUser(String uname, String uemail, String uphone, String helpcode, String path, int uid);
	
	 //查看所有员工	 
	List<Map<String, Object>> findAll();
	//带条件的分页查询
	PagerData findByPage(UserQuery userQuery,int curPage,int pageSize);
	
	Map<String, Object> find(int uid);
	//修改员工
 	int update(User user);
 	
 	/**
	 * 后台登录验证
	 * @author guo
	 * @param username
	 * @param password
	 * @param num
	 * @return
	 */
	Map<String,Object> find(String username, String password);
	
	/**
	 * 修改用户状态
	 * @param uid
	 * @return
	 */
	int updState(Integer uid);
	
	/**
	 * 验证邮箱是否存在
	 * @param uemail
	 * @return
	 */
	boolean uemailIsExists(String uemail);
	
	/**
	 * 验证手机号是否重复
	 * @param uphone
	 * @return
	 */
	boolean uphoneIsExists(String uphone);
 	
}
