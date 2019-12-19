package com.movify.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.movify.entity.User;
import com.movify.service.IUserService;
/**
 * 前台登录控制器
 * @author zhang
 *
 */
@Controller
public class LoginController {
	
	@Autowired
	private IUserService ius ;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	
	
	/**
	 * 登录处理
	 * @author zhang
	 * @return
	 */
	@RequestMapping("/login")
	@ResponseBody
	public String loginUser() {
		String uname = request.getParameter("username");
		String upw = request.getParameter("password");
		int num = Integer.valueOf(request.getParameter("num"));
		User u = ius.isExists(uname, upw, num);
		if (u!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", u);
			return "1";
		}
		return "2";
	}
	
	
	/**
	 * 退出登录
	 * @author zhang
	 * @return
	 */
	@RequestMapping("/out_login")
	public String out_login() {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		return "redirect:/indexShow";
	}
	
	
	/**
	 * 验证用户是否存在
	 * @author zhang
	 * @return
	 */
	@RequestMapping("/unameIsExists")
	@ResponseBody
	public String unameIsExists() {
		String uname = request.getParameter("uname");
		if (ius.isExists(uname)) {
			return "2";
		}
		return "1";
	}
	
	
	/**
	 * 注册处理
	 * @author zhang
	 * @return
	 */
	@RequestMapping("/register")
	@ResponseBody
	public String register() {
		String uname = request.getParameter("uname");
		String upw = request.getParameter("upw");
		// 设置一个6位随机数作为挽救码
		String helpcode = Integer.valueOf((int)((Math.random()*9+1)*100000)).toString();
		if (ius.register(uname, upw, helpcode)>0) {
			return helpcode;
		}
		return "";
	}
	
	
	/**
	 * 忘记密码处理
	 * @author zhang
	 * @return
	 */
	@RequestMapping("/forget_upw")
	@ResponseBody
	public String forget_upw() {
		String username = request.getParameter("username");
		String helpcode = request.getParameter("helpcode");
		String upw = request.getParameter("upw");
		
		if (ius.forgetUpw(username, helpcode)) {
			ius.updUpw(username, upw);
			return "1";
		}
		return "";
	}
	
	/**
	 * 开通会员
	 * @author zhang
	 */
	@RequestMapping("/queren_zhifu")
	@ResponseBody
	public void querenZhifu(Integer uid) {
		ius.openVip(uid);
	}
	
	/**
	 * 根据id获取用户信息
	 * @author zhang
	 */
	@RequestMapping("/getUserInfo")
	@ResponseBody
	public Map<String,Object> getUserInfo(Integer uid){
		Map<String,Object> map = ius.getUser(uid);
		return map;
	}
	
	/**
	 * 修改用户信息
	 * @author zhang
	 */
	@RequestMapping("/updUser")
	public String updUser(MultipartFile touxiang,String uname,String uemail,String uphone,String helpcode,Integer uid){
		String path = null;
		//通过上传的文件对象,获取上传文件的名称:xxx.jpg
		String oldFileName = touxiang.getOriginalFilename();
		//获取要存储在服务器上的文件的磁盘目录
		String saveFilePath = request.getServletContext().getRealPath("upload"); 
		//生成新的文件名
		String newFileName = UUID.randomUUID().toString()+"_"+oldFileName;
		//使用要保存到的服务器目录和新的文件名，构建文件对象
		File f = new File(saveFilePath,newFileName);
		//如果文件不存在，则创建文件对应的目录
		if(!f.exists()){
			//创建目录
			f.mkdirs();
		}
		
		try {
			//将上传的文件对象，保存到新的文件对象所在的服务器路径上
			touxiang.transferTo(f);
			path = "upload/"+newFileName;
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ius.qt_updUser(uname,uemail,uphone,helpcode,path,uid);
		HttpSession session = request.getSession();
		Map<String,Object> map = ius.getUser(uid);
		
		User u = new User();
		u.setHelpcode((String)map.get("helpcode"));
		u.setUemail((String)map.get("uemail"));
		u.setUid((int)map.get("uid"));
		u.setUname((String)map.get("uname"));
		u.setUphone((String)map.get("uphone"));
		u.setUphoto((String)map.get("uphoto"));
		session.setAttribute("user", u);
		
		return "redirect:/indexShow";
	}
	
	/**
	 * 对邮箱的存在性校验
	 * @author zhang
	 */
	@RequestMapping("/uemailIsExists")
	@ResponseBody
	public String uemailIsExists(String uemail) {
		if (ius.uemailIsExists(uemail)) {
			return "2";
		} 
		return "1";
	}
	
	/**
	 * 对手机的存在性校验
	 * @author zhang
	 */
	@RequestMapping("/uphonelIsExists")
	@ResponseBody
	public String uphoneIsExists(String uphone) {
		if (ius.uphoneIsExists(uphone)) {
			return "2";
		} 
		return "1";
	}
}
