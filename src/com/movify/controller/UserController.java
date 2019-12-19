package com.movify.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movify.entity.PagerData;
import com.movify.entity.Role;
import com.movify.entity.User;
import com.movify.entity.UserQuery;
import com.movify.service.IRoleService;
import com.movify.service.IUserService;

/**
 * 后台查看用户
 * @author 
 */
@Controller
public class UserController {

	@Autowired
	private IRoleService roleService;
	@Autowired
	private IUserService userService;
	
	//查看员工
	@RequestMapping("/role_list")
	public String role_list(Model model){
		List<Map<String, Object>> roleList=roleService.list();
		model.addAttribute("roleList", roleList);
	
		return "houtai/role_list";
	}
	
	//添加员工
	@RequestMapping("/role_add_show")
	public String role_add(Model model){
		
		List<Map<String, Object>> roleList=roleService.list();
		model.addAttribute("roleList", roleList);
		
		return "houtai/role_add";
	   	
	}
	
	//提交添加员工数据
		@RequestMapping("/role_add_submit")
		public String add_submit(Role role){
		
			roleService.Add(role);
	     	return "redirect:/role_list";
	 	}
		
	//修改显示员工
	@RequestMapping("/role_update_show")
	@ResponseBody
		public Map<String, Object> update_show(int rid){	
			
		Map<String, Object> role= roleService.find(rid);
			
			return role;
	}
	
	//提交修改员工数据
	@RequestMapping("/role_update_submit")
	public String update_submit(Role role){
		
		int i=roleService.update(role);
		return "redirect:/role_list";
	}
	//删除角色		
	@RequestMapping("/role_delete")
	public String role_delete(int rid){
		
		roleService.delete(rid);				
		return "redirect:/role_list";
	   	
	}
			
		 
	//修改用户
	@RequestMapping("/user_update_show")
	@ResponseBody
	public Map<String, Object> update_show(int uid,Model model){	
		Map<String, Object> user=userService.find(uid);
		
		return user;
	}
	
		//提交修改数据
		@RequestMapping("/user_update_submit")
		public String update_submit(HttpServletRequest request){
			String uid=request.getParameter("uid");
			String rid=request.getParameter("rid");
			User user=new User();
			user.setUid(Integer.parseInt(uid));
			user.setRole(Integer.parseInt(rid));
			userService.update(user);
			return "redirect:/user_list";
		}
	
	   //带条件查询的分页列表
		@RequestMapping("/user_list")
		public String list(Model model,UserQuery userQuery,Integer curPage){
			//如果没有页数，则页数默认为1
			if(curPage==null){
				curPage = 1;
			}			
			//带条件分页查询
			PagerData pd = userService.findByPage(userQuery, curPage, 6);
			model.addAttribute("pd", pd);

			//查询所有员工
			List<Map<String,Object>> roleList =roleService.list();
			model.addAttribute("roleList", roleList);
			
			return "houtai/user_list";
		}
		
	/**
	 * 修改用户状态
	 * @author zhang
	 */
	@RequestMapping("/updState")
	public String updState(Integer uid) {
		userService.updState(uid);
		return "redirect:/user_list";
	}
		
		
}
