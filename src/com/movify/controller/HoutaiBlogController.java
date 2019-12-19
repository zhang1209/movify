package com.movify.controller;

import java.io.File;
import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.movify.entity.Blog;
import com.movify.entity.PagerData;
import com.movify.entity.Video;
import com.movify.service.IBlogService;
import com.movify.service.IUserService;

@Controller
public class HoutaiBlogController {

	@Autowired
	private IBlogService ib;
	@Autowired
	private IUserService iu;
	
	@RequestMapping("ht_blog_show")
	public String select_blog_show(Model model){
		List<Map<String,Object>> bloglist=ib.newBlog(1);
		model.addAttribute("bloglist", bloglist);
		return "houtai/blog_show";
		
	}
	
	
	@RequestMapping("ht_blog_delete")
	public String ht_delete_blog(Integer bid){
		ib.delete(bid);
		return "redirect:/list2";
	}
	
	
	@RequestMapping("ht_blog_add_submit")
	public String ht_add_submit(Model model,Integer buser,String btitle,String bintroduce,String bdetails,MultipartFile bposter,HttpServletRequest request){
		String path=null ;
		
		
		//获取上传文件的文件名
		String oldFileName = bposter.getOriginalFilename();
		//获取上传文件的扩展名:  jpg
		String ext = FilenameUtils.getExtension(oldFileName);
		
		System.out.println("ext:"+ext);
		//获取服务器的物理路径地址(磁盘上的路径),指定我们的上传目录
		//通过request对象获取应用程序对象,通过应用程序对象的getRealPath方法，获取特定目录的物理路径
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
			bposter.transferTo(f);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Blog blog = new Blog();
		
		blog.setBtitle(btitle);
		blog.setBuser(buser);
		blog.setBdetails(bdetails);
		blog.setBintroduce(bintroduce);
		blog.setBposter("upload/"+newFileName);
		ib.add(blog);
		return "redirect:/list2";
	}
	
	@RequestMapping("ht_blog_update_show")
	@ResponseBody
	public Map<String,Object> ht_update_show(Model model, int bid){
		Map<String,Object> bloglist=ib.findGuo(bid);
		return bloglist;
	}
	
	@RequestMapping("ht_blog_update_submit")
	public String ht_update_submit(Blog blog){
		ib.update(blog);
		return "redirect:/list2";
	}
	
	//不条件的分页列表
	@RequestMapping("list2")
	public String list2(Model model,Integer curPage){
		//如果没有页数，则页数默认为1
		if(curPage==null){
			curPage = 1;
		}
		PagerData pd=ib.findByPage(curPage,5);
		model.addAttribute("pd", pd);
		return "houtai/blog_show";
		
		
				
	}
	
	
	
	
	
	
	
}
