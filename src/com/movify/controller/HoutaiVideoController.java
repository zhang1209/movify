package com.movify.controller;

import java.io.File;
import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.movify.entity.Blog;
import com.movify.entity.PagerData;
import com.movify.entity.Video;
import com.movify.service.ICategoryService;
import com.movify.service.ILanguageService;
import com.movify.service.IUserService;
import com.movify.service.IVideoService;

@Controller
public class HoutaiVideoController {
	@Autowired
	private IVideoService iv;
	@Autowired
	private IUserService iu;
	@Autowired
	private ICategoryService ic;
	@Autowired
	private ILanguageService il;
	
	@RequestMapping("houtai_video_show")
	public String  submit_video_show(Model model){
		List<Map<String,Object>> videolist=iv.findall();
		model.addAttribute("videolist", videolist);
		return "houtai/video_show";
	}
	
	@RequestMapping("list1")
	public String list(Model model,Integer curPage){
		//如果没有页数，则页数默认为1
		if(curPage==null){
			curPage = 1;
		}
		PagerData pd=iv.findByPage(curPage, 5);
		model.addAttribute("pd", pd);
		
		// 分类以及语种的数据
		List<Map<String,Object>> categorylist=ic.list();
		model.addAttribute("categorylist", categorylist);
		List<Map<String,Object>> languagelist=il.list();
		model.addAttribute("languagelist", languagelist);
		
		return "houtai/video_show";
	}
	
	@RequestMapping("ht_video_add_submit")
	public String ht_video_add_submit(Video video,Integer vuser,@RequestParam(required=false) MultipartFile[] wj,HttpServletRequest request){
		//获取保存文件的服务器目录
		String saveFilePath = request.getServletContext().getRealPath("upload");
		String tupian=null;
		String shipin=null;
		//遍历每个上传文件进行保存
		for(MultipartFile mf : wj){
			//文件名
			String oldFileName = mf.getOriginalFilename();
			//扩展名
			String ext = FilenameUtils.getExtension(oldFileName);
			System.out.println(oldFileName+" "+ext);
			//新的文件名
			String newFileName = UUID.randomUUID()+"_"+oldFileName;
			//构建要保存的文件对象
			File f=new File(saveFilePath,newFileName);
			
			if(!f.exists()){
				f.mkdirs();
			}
			
			//将上传文件存到指定的文件对象上
			try {
				
				mf.transferTo(f);
				if("jpg".equals(ext)){
					tupian= "upload/"+newFileName;
				}else if("mp4".equals(ext)){
					shipin= "upload/"+newFileName;
				}
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		video.setVposter(tupian);
		video.setVsrc(shipin);
		iv.add(video);
		
		return "redirect:/list1";
	}
	
	@RequestMapping("ht_video_update_show")
	public String ht_video_update_show(Model model,int vid){
		List<Map<String,Object>> categorylist=ic.list();
		model.addAttribute("categorylist", categorylist);
		List<Map<String,Object>> languagelist=il.list();
		model.addAttribute("languagelist", languagelist);
		List<Map<String,Object>>videolist=iv.findall();
		model.addAttribute("videolist", videolist);
		return "houtai/video_update_show";
	}
	@RequestMapping("ht_video_update_submit")
	public String ht_video_update_submit(Video video){
		iv.update(video);
		return "redirect:/list1";
	}
	
	@RequestMapping("ht_video_delete")
	public String ht_video_delete(int vid){
		iv.delete(vid);
		return "redirect:/list1";
	}
	
	
	
	
	@RequestMapping("/video_up")
	public String test1(String name,MultipartFile photo,HttpServletRequest request){
		System.out.println("name:"+name);
		System.out.println("photo:"+photo);
		
		//获取上传文件的文件名
		String oldFileName = photo.getOriginalFilename();
		//获取上传文件的扩展名:  jpg
		String ext = FilenameUtils.getExtension(oldFileName);
		
		System.out.println("ext:"+ext);
		
		String saveFilePath = request.getServletContext().getRealPath("upload");
		System.out.println("saveFilePath:"+saveFilePath);
		
		//创建新的文件名
		//String newFileName = UUID.randomUUID().toString()+"."+ext;
		String newFileName = UUID.randomUUID().toString()+oldFileName;
		
		//使用保存到的服务器目录(saveFilePath)和要保存的新的文件名(newFileName)，构建文件对象
		File f=new File(saveFilePath,newFileName);
		//如果文件目录不存在，则创建文件目录
		if(!f.exists())
		{
			//创建文件目录
			f.mkdirs();
		}
		
		
		try {
			//将上传的文件对象，转存到我们指定的文件位置
			photo.transferTo(f);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		//System.out.println("oldFileNmae:"+oldFileName);
		//size:文件大小
		//System.out.println("size:"+photo.getSize());
		//name:表单中的控件名
		//System.out.println("name:"+photo.getName());
		
		return "houtai/video_show";
	}

}
