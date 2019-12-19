package com.movify.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.movify.service.ICategoryService;
import com.movify.service.ILanguageService;
import com.movify.service.IVideoService;

@Controller
public class VideoController {

	@Autowired
	private ICategoryService categoryService;
	@Autowired
    private ILanguageService languageService;
	@Autowired
	private IVideoService videoService;
	
	@RequestMapping("/vaudit")
	public String list(Model model){
		List<Map<String, Object>> videoList=videoService.find(1);
		model.addAttribute("videoList", videoList);
	
		return "houtai/video_audit";		
	}
	
	//提交修改数据
		@RequestMapping("/vupdate_show")
		public String update_show(Integer vid){
			Integer videostate=videoService.Update(vid);
			
			return "redirect:/vaudit";
		}					
		
	//删除
		@RequestMapping("/vdelete")
		public String delete(int vid){
			videoService.delete(vid);
			return "redirect:/vaudit";
		}
	
	
	/*
	@RequestMapping("/test")
	public String catgory_list(Model model){
		List<Map<String, Object>> categoryList=categoryService.list();
		model.addAttribute("categoryList",categoryList);
		return "houtai/test";
	}
	
	@RequestMapping("/language_list")
	public String language_list(Model model){
		List<Map<String, Object>> languageList=languageService.list();
		model.addAttribute("languageList",languageList);
		return "test";
	}*/
	
}
