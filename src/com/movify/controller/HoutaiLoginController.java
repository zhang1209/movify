package com.movify.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movify.entity.User;
import com.movify.service.IUserService;

@Controller
public class HoutaiLoginController {
	@Autowired
	private IUserService iu;
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping("/houtai_login_show")
	public String loginshow() {
		return "houtai/login";
	}
	
	@RequestMapping("/houtai_login_submit")
	@ResponseBody
	public String houtailogin(String username,String password){
		Map<String,Object> map=iu.list(username, password);
		if (map == null) {
			return "1";
		} else if ((int)map.get("role")<3) {
			return "2";
		}
		HttpSession se= request.getSession();
		User u = new User();
		u.setUid((int)map.get("uid"));
		u.setUname((String)map.get("uname"));
		u.setUphoto((String)map.get("uphoto"));
		u.setState((int)map.get("state"));
		u.setRole((int)map.get("role"));
		se.setAttribute("ht_user", u);
		return "ok";
	}

	@RequestMapping("/houtai_out_login")	
	public String outLogin() {
		HttpSession session = request.getSession();
		session.removeAttribute("ht_user");
		return "redirect:/houtai_login_show";
	}
	
	@RequestMapping("/welcome")
	public String welcome() {
		return "houtai/video_show_welcome";
		
	}
}
