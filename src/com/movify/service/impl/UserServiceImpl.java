package com.movify.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movify.dao.IUserDao;
import com.movify.entity.PagerData;
import com.movify.entity.User;
import com.movify.entity.UserQuery;
import com.movify.service.IUserService;

@Service
public class UserServiceImpl implements IUserService{
	@Autowired
	private IUserDao iud;
	@Override
	public User isExists(String username, String password, int num) {
		List<Map<String,Object>> list = iud.isExists(username, password,num);
		if (list.size()>0) {
			User u = new User();
			for (Map<String,Object> map : list) {
				u.setUid((Integer)map.get("uid"));
				u.setUname((String)map.get("uname"));
				u.setUphone((String)map.get("uphone"));
				u.setUemail((String)map.get("uemail"));
				u.setUpw((String)map.get("upw"));
				u.setUphoto((String)map.get("uphoto"));
				u.setHelpcode((String) map.get("helpcode"));
				u.setRole((Integer) map.get("role"));
				u.setState((Integer) map.get("state"));
			}
			return u;
		}
		return null;
	}
	@Override
	public boolean isExists(String uname) {
		return iud.isExists(uname);
	}
	@Override
	public int register(String uname, String upw, String helpcode) {
		// TODO Auto-generated method stub
		return iud.add(uname,upw,helpcode);
	}
	@Override
	public boolean forgetUpw(String username, String helpcode) {
		// TODO Auto-generated method stub
		return iud.forgetUpw(username,helpcode);
	}
	@Override
	public int updUpw(String username, String upw) {
		// TODO Auto-generated method stub
		return iud.updUpw(username,upw);
	}
	@Override
	public int openVip(Integer uid) {
		// TODO Auto-generated method stub
		return iud.openVip(uid);
	}
	@Override
	public Map<String, Object> getUser(Integer uid) {
		// TODO Auto-generated method stub
		return iud.getUser(uid);
	}
	@Override
	public int qt_updUser(String uname, String uemail, String uphone, String helpcode, String path, int uid) {
		// TODO Auto-generated method stub
		return iud.updUser(uname,uemail,uphone,helpcode,path,uid);
	}
	
	@Override
	public List<Map<String, Object>> list() {
		// TODO Auto-generated method stub
		return iud.findAll();
	}
	@Override
	public Map<String, Object> find(int uid) {
		// TODO Auto-generated method stub
		return iud.find(uid);
	}
	@Override
	public int update(User user) {
		// TODO Auto-generated method stub
		return iud.update(user);
	}
	@Override
	public PagerData findByPage(UserQuery userQuery, int curPage, int pageSize) {
		// TODO Auto-generated method stub
		return iud.findByPage(userQuery, curPage, pageSize);
	}
	
	@Override
	public Map<String, Object> list(String username, String password) {
		// TODO Auto-generated method stub
		return iud.find(username, password);
	}
	@Override
	public int updState(Integer uid) {
		return iud.updState(uid);
	}
	@Override
	public boolean uemailIsExists(String uemail) {
		// TODO Auto-generated method stub
		return iud.uemailIsExists(uemail);
	}
	@Override
	public boolean uphoneIsExists(String uphone) {
		// TODO Auto-generated method stub
		return iud.uphoneIsExists(uphone);
	}

}
