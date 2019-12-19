package com.movify.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.movify.service.IBlogService;
import com.movify.service.IReplayService;
import com.movify.service.IUserService;

@Controller
public class BlogController {
	
	@Autowired
	private IBlogService ibs;
	@Autowired
	private IReplayService irs;
	@Autowired
	private IUserService ius;
	
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	
	/**
	 * 博客列表
	 * @author zhang
	 */
	@RequestMapping("/blog_list")
	public String blog_list(String op) {
		if ("new".equals(op)) {
			request.setAttribute("blog_list",ibs.newBlog(1));
		} else if ("yc".equals(op)) {
			request.setAttribute("blog_list",ibs.ycBlog());
		} else if ("gf".equals(op)) {
			request.setAttribute("blog_list",ibs.gfBlog());
		}
		request.setAttribute("new_blog", ibs.newBlog(2));
		return "qiantai/blog_list";
	}
	
	/**
	 * 博客详情页面
	 * @author zhang
	 */
	@RequestMapping("/blog_details")
	public String blog_details(int bid) {
		request.setAttribute("blog", ibs.getBlogById(bid));
		request.setAttribute("replay",irs.getReplay(bid));
		request.setAttribute("replayCount", irs.getReplayCount(bid));
		request.setAttribute("new_blog", ibs.newBlog(2));
		return "qiantai/blog_details";
	}
	
	/**
	 * 博客回复添加
	 * @author zhang
	 */
	@RequestMapping("/replay_add")
	@ResponseBody
	public Map<String,Object> replay_add(Integer uid,Integer bid,String content) {
		irs.addReplay(uid,bid,content);
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String,Object> umap = ius.getUser(uid);
		String uname = (String)umap.get("uname");
		String uphoto = (String)umap.get("uphoto");
		map.put("uname", uname);
		map.put("uphoto", uphoto);
		map.put("content",content);
		return map;
	}
	
	/**
	 * 显示发布博客页面
	 * @author zhang
	 */
	@RequestMapping("/blog_add")
	public String blog_add() {
		request.setAttribute("new_blog", ibs.newBlog(2));
		return "qiantai/blog_add";
	}
	
	/**
	 * 发布博客
	 * @author zhang
	 */
	@RequestMapping("/blog_add_save")
	public String blog_add_save(String btitle,MultipartFile bposter,String bintroduce,String bcontent,Integer uid) {
		String path = null;
		//通过上传的文件对象,获取上传文件的名称:xxx.jpg
		String oldFileName = bposter.getOriginalFilename();
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
			bposter.transferTo(f);
			path = "upload/"+newFileName;
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ibs.saveBlog(btitle,path,bintroduce,bcontent,uid);
		return "redirect:/indexShow";
	}
	
	/**
	 * 联系我们
	 * @author zhang
	 */
	@RequestMapping("/concat_us")
	public String concat_us() {
		return "qiantai/concat_us";
	}
	
	/**
	 * 我的博客页面显示
	 * @author zhang
	 */
	@RequestMapping("/my_blog")
	public String my_blog(Integer uid,Integer pageNo) {
		if (pageNo == null) {
			pageNo = 1;
		}
		// 查询数据总数
		int count = ibs.getMyBlogCount(uid);
		request.setAttribute("count", count);
		// 计算数据页数
		int pageCount = count/3;
		if (count%3 !=0) {
			pageCount =count/3+1;
		} else if (count/3<1) {
			pageCount = 1;
		}
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("pageCount",pageCount);
		request.setAttribute("my_blog", ibs.getBlogByUserId(uid,pageNo,3));
		return "qiantai/my_blog";
	}
	
	/**
	 * 我的博客信息回填
	 * @author zhang
	 */
	@RequestMapping("/my_blog_update_show")
	@ResponseBody
	public Map<String,Object> myVideoUpdateShow(Integer bid) {
		Map<String,Object> map = ibs.getBlogById(bid);
		return map;
	}
	
	/**
	 * 我的博客修改数据
	 * @author zhang
	 */
	@RequestMapping("/my_blog_update_submit")
	public String myVideoUpdateSubmit(Integer bid,Integer uid,String btitle,String bintroduce,String bdetails){
		ibs.updateBlog(btitle,bintroduce,bid,bdetails);
		return "redirect:/my_blog?uid="+uid;
	}
	
	/**
	 * 根据bid，rpfid查询子回复
	 * @author zhang
	 */
	@RequestMapping("/query_sonReplay")
	@ResponseBody
	public Map<String,Object> querySonReplay(int bid,int rpfid) {
		List<Map<String,Object>> list = irs.getSonReplay(bid,rpfid);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("sonReplay", list);
		return map;
	}
	
	/**
	 * 回复父评论
	 * @author zhang
	 */
	@RequestMapping("/replay_father")
	@ResponseBody
	public String huifuFather(int bid,int rpfid,String rpcontent,int uid) {
		irs.addSonReplay(bid,rpfid,rpcontent,uid);
		return "";
	}
	
	@RequestMapping("/baudit")
	public String list(Model model,Integer bcheckstate){
		List<Map<String, Object>> blogList= ibs.find(1);
		model.addAttribute("blogList", blogList);
	
		return "houtai/blog_audit";		
	}
	//提交修改数据
		@RequestMapping("/update_show")
		public String update_show(Integer bid){
			Integer blogbcheckstate=ibs.Update(bid);
			
			return "redirect:/baudit";
		}
		
	//删除
		@RequestMapping("/delete")
		public String delete(Integer bid){
			ibs.delete(bid);
			return "redirect:/baudit";
		}
		
		/**
		 * 博客模糊分页查询
		 * @author zhang
		 */
		@RequestMapping("/blog_list_page")
		public String blogListPage(String blog_key) {
			request.setAttribute("blog_list", ibs.getBlogByKey(blog_key));
			return "qiantai/blog_list";
		}
	
	
}
