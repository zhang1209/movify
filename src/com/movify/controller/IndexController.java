package com.movify.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.movify.entity.User;
import com.movify.service.IActorService;
import com.movify.service.IBlogService;
import com.movify.service.IUserService;
import com.movify.service.IVideoService;

/**
 * 前台页面控制器（主页，视频）
 * @author zhang
 */
@Controller
public class IndexController{
	
	@Autowired
	private IBlogService ibs;
	@Autowired
	private IVideoService ivs;
	@Autowired
	private IActorService ias;
	@Autowired
	private IUserService ius;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	
	/**
	 * 显示主页，以及数据加载
	 * @author zhang
	 */
	@RequestMapping("/indexShow")
	public ModelAndView indexShow() {
		ModelAndView mad = new ModelAndView();
		mad.addObject("newVideo", ivs.newVideo());
		mad.addObject("newUserVideo", ivs.newUserVideo());
		mad.addObject("hotVideo", ivs.hotVideo());
		mad.addObject("dataCount", ivs.getDataCount());
		mad.addObject("newBlog",ibs.newBlog(2));
		mad.setViewName("qiantai/index");
		
		return mad;	
	}
	
	/**
	 * 根据关键字查出video_list
	 * @author zhang
	 */
	@RequestMapping("/video_list")
	public String video_list_moren(Integer pageNo) {
		String typeid = request.getParameter("video_type");
		if (typeid==null || "0".equals(typeid)) {
			String key  = request.getParameter("key");
			if (pageNo == null) {
				pageNo = 1;
			}
			request.setAttribute("video_list", ivs.videoSearch(key,pageNo,3));
			// 查询数据总数
			int count = ivs.count(key);
			request.setAttribute("count", count);
			// 计算数据页数
			int pageCount = count/3;
			if (count%3 !=0) {
				pageCount =count/3+1;
			} else if (count/3<1) {
				pageCount = 1;
			}
			request.setAttribute("key", key);
			request.setAttribute("pageNo", pageNo);
			request.setAttribute("pageCount",pageCount);
		} else {
			int tid = Integer.valueOf(typeid);
			request.setAttribute("typeid", tid);
			if (pageNo == null) {
				pageNo = 1;
			}
			request.setAttribute("video_list", ivs.getVideoByType(tid, pageNo, 3));
			// 查询数据总数
			int count = ivs.getCountByType(tid);
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
		}
		return "qiantai/video_list";
	}
	
	/**
	 * 视频播放
	 * @author zhang
	 */
	@RequestMapping("/video_play")
	public String video_play(String vid, String vtype, Model m,Integer uid) {
		if ("1".equals(vtype) || "2".equals(vtype)){
			if (uid != null){
				Map<String,Object> map = ius.getUser(uid);
				if ((int)map.get("role")<2){
					return "qiantai/sorry";
				}
			} else {
				return "qiantai/sorry";
			}
		}
		int id = Integer.valueOf(vid);
		List<Map<String,Object>> list = ivs.getVideoById(id);
		m.addAttribute("video_byid",list);
		return "qiantai/videoplay";
		
	}
	
	/**
	 * 视频详情页面
	 * @author zhang
	 */
	@RequestMapping("/video_details")
	public String video_details(String vid, String vtype, Model m){
		int id = Integer.valueOf(vid);
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("user");
		if (u != null) {
			if (ivs.queryVideo_likeById(u.getUid(), id)) {
				request.setAttribute("vlinfo", "1");	
			} else {
				request.setAttribute("vlinfo", "2");
			}
		} else {
			request.setAttribute("vlinfo", "2");
		}
		
		if (ivs.queryWatchLater(Integer.valueOf(vid), u.getUid())) {
			request.setAttribute("wlinfo", "1");
		} else {
			request.setAttribute("wlinfo", "2");
		}
		int typeid = Integer.valueOf(vtype);
		m.addAttribute("video_details",ivs.getVideoById(id));
		m.addAttribute("other_video",ivs.newVideo());
		m.addAttribute("video_photo",ivs.getVideoPhoto(id));
		m.addAttribute("actor_list",ivs.getActor(id));
		return "qiantai/video_details";
	}
	
	/**
	 * 稍后观看的处理
	 * @author zhang
	 */
	@RequestMapping("/watch_later")
	@ResponseBody
	public String watchLater(String vid,String uid) {
		if (uid==null || uid=="") {
			// 如果没有登录状态，返回1
			return "1";
		}
		if (ivs.queryWatchLater(Integer.valueOf(vid),Integer.valueOf(uid))) {
			// 如果等于true，说明已经（加入稍后观看），返回2
			return "2";
		} else {
			ivs.addWatchLater(Integer.valueOf(vid),Integer.valueOf(uid));
			return "3";
		}	
	}
	
	/**
	 * 取消收藏的异步请求 
	 * @author zhang
	 */
	@RequestMapping("/watch_later_close")
	@ResponseBody
	public String watchLaterClose(Integer vid,Integer uid) {
		ivs.watchLaterDel(uid, vid);
		return "1";
	}
	
	/**
	 * 稍后观看的页面
	 * @author zhang
	 */
	@RequestMapping("/watch_later_show")
	public String watch_later_show(int uid,Integer pageNo) {
		if (pageNo == null) {
			pageNo = 1;
		}
		// 查询数据总数
		int count = ivs.getWatchLaterCount(uid);
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
		List<Map<String,Object>> list = ivs.queryWatchLaterByUid(uid,pageNo,3);
		request.setAttribute("watch_later",list );
		return "qiantai/watch_later";
	}
	
	/**
	 * 取消稍后观看
	 * @author zhang
	 */
	@RequestMapping("/watch_later_del")
	@ResponseBody
	public String watch_later_del(String uid,String vid) {
		if (ivs.watchLaterDel(Integer.valueOf(uid),Integer.valueOf(vid))>0) {
			return "1";
		}
		return "";
	}
	
	/**
	 * 演员页面显示
	 * @author zhang
	 */
	@RequestMapping("/actor_list")
	public String actor_show() {
		List<Map<String,Object>> list = ias.getActor();
		request.setAttribute("actor_list",list);
		return "qiantai/actor_list";
	}
	
	/**
	 * 演员详细界面
	 * @author zhang
	 */
	@RequestMapping("/actor_details")
	public String actor_details(int aid) {
		List<Map<String,Object>> list = ias.getActorDetails(aid);
		request.setAttribute("actor_details",list);
		return "qiantai/actor_details";
	}
	
	/**
	 * 点赞处理
	 * @author zhang
	 */
	@RequestMapping("/video_like")
	@ResponseBody
	public String video_like(int uid,int vid) {
		if (ivs.queryVideo_likeById(uid, vid)) {
			return "2";
		}
		ivs.addVideo_Like(uid, vid);
		ivs.addLike(vid);
		return "1";
	}
	
	/**
	 * 取消点赞
	 * @author zhang
	 */
	@RequestMapping("/close_like")
	@ResponseBody
	public String close_like(int uid,int vid) {
		ivs.delLike(vid);
		ivs.delVideo_Like(uid, vid);
		return "";
	}
	
	/**
	 * 视频上传页面显示
	 * @author zhang
	 */
	@RequestMapping("video_add")
	public String video_add_show() {
		request.setAttribute("category", ivs.getCategory());
		request.setAttribute("language",ivs.getLanguage());
		request.setAttribute("new_video", ivs.newVideo());
		return "qiantai/video_add";
	}
	
	/**
	 * 视频上传保存数据
	 * @author zhang
	 */
	@RequestMapping("/video_add_save")
	public String video_add_save(Integer uid,String vname,String vcountry,String vdirector,String vcost,String vstudio,
			String vtime,Integer cid,Integer lid,@RequestParam MultipartFile[] vfile,String vintroduce) {
		//获取保存文件的服务器目录
		String saveFilePath = request.getServletContext().getRealPath("upload");
		// 创建循环外的变量用于service层方法传参
		String vposter = null;
		String vsrc = null;
		int cost = Integer.valueOf(vcost);
		
		//遍历每个上传文件进行保存
		for(MultipartFile mf : vfile){
			//文件名
			String oldFileName = mf.getOriginalFilename();
			//扩展名
			String ext = FilenameUtils.getExtension(oldFileName);
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
				if("jpg".equals(ext) || "png".equals(ext) || "gif".equals(ext)){
					vposter = "upload/"+newFileName;
				}else if("mp4".equals(ext) || "avi".equals(ext)){
					vsrc = "upload/"+newFileName;
				}
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		ivs.upVideo(uid,vname,vcountry,vdirector,cost,vstudio,cid,lid,vposter,vsrc,vintroduce,3,vtime);
		return "redirect:/indexShow";
	}
	
	/**
	 * 我的视频页面显示
	 * @author zhang
	 */
	@RequestMapping("/my_video")
	public String my_video(Integer uid,Integer pageNo,Integer pageSize) {
		if (pageNo == null) {
			pageNo = 1;
		}
		List<Map<String,Object>> list = ivs.getVideoByUserId(uid, pageNo, 3);
		request.setAttribute("my_video", list);
		// 查询数据总数
		int count = ivs.getMyVideoCount(uid);
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
		request.setAttribute("category",ivs.getCategory());
		request.setAttribute("language", ivs.getLanguage());
		return "qiantai/my_video";
	}
	
	/**
	 * 我的视频信息回填
	 * @author zhang
	 */
	@RequestMapping("/my_video_update_show")
	@ResponseBody
	public Map<String,Object> myVideoUpdateShow(Integer vid) {
		List<Map<String,Object>> list = ivs.getVideoById(vid);
		Map<String,Object> map = list.get(0);
		return map;
	}
	
	/**
	 * 我的视频修改数据
	 * @author zhang
	 */
	@RequestMapping("/my_video_update_submit")
	public String myVideoUpdateSubmit(Integer vid,Integer uid,String vname,String vintroduce,Integer cid,Integer lid){
		ivs.updateVideo(vname,vintroduce,vid,cid,lid);
		return "redirect:/my_video?uid="+uid;
	}
	
	/**
	 * 后台视频相关图片的管理
	 * @author zhang
	 */
	@RequestMapping("ht_video_photo")
	public String htVideoPhoto(String key,Integer pageNo) {
		if (key == null) {
			key = "";
		}
		if (pageNo == null) {
			pageNo = 1;
		}
		
		request.setAttribute("ht_video_photo_list", ivs.getVideoPhotoByKey(key,pageNo,4));
		int count = ivs.getVideoPhotoCount(key);
		int pageCount = count/4;
		if (count%4 !=0) {
			pageCount = count/4+1;
		} 
		if (count/4<1) {
			pageCount = 1;
		}
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("count", count);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("key", key);
		request.setAttribute("video_list", ivs.findall());
		return "houtai/video_photo";
	}
	
	/**
	 * 后台视频图片删除
	 * @author zhang
	 */
	@RequestMapping("/ht_video_photo_del")
	public String htVideoPhotoDel(Integer vpid) {
		ivs.delVideoPhoto(vpid);
		return "redirect:/ht_video_photo";
	}
	
	/**
	 * 后台视频图片添加
	 * @author zhang
	 */
	@RequestMapping("/ht_video_photo_add")
	public String htVideoPhotoAdd(Integer video,MultipartFile photo_add) {
		String path = null;
		//通过上传的文件对象,获取上传文件的名称:xxx.jpg
		String oldFileName = photo_add.getOriginalFilename();
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
			photo_add.transferTo(f);
			path = "upload/"+newFileName;
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ivs.addVideoPhoto(video,path);
		return "redirect:/ht_video_photo";
	}
	
	/**
	 * 后台视频演员相关管理
	 * @author zhang
	 */
	@RequestMapping("/ht_video_actor")
	public String htVideoActor(String key ,Integer pageNo) {
		if (key == null) {
			key = "";
		}
		if (pageNo == null) {
			pageNo = 1;
		}
		
		request.setAttribute("ht_video_actor_list", ias.getActorByKey(key,pageNo,4));
		int count = ias.getVideoActorCount(key);
		int pageCount = count/4;
		if (count%4 !=0) {
			pageCount = count/4+1;
		} 
		if (count/4<1) {
			pageCount = 1;
		}
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("count", count);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("key", key);
		request.setAttribute("video_list", ivs.findall());
		request.setAttribute("actor_list", ias.getActor());
		return "houtai/video_actor";
	}
	
	/**
	 * 视频演员删除
	 * @author zhang
	 */
	@RequestMapping("/ht_video_actor_del")
	public String htVideoActorDel(Integer ahid) {
		ias.delVideoActor(ahid);
		return "redirect:/ht_video_actor";
	}
	
	/**
	 * 演员表演记录添加
	 * @author zhang
	 */
	@RequestMapping("/ht_video_actor_add")
	public String htVideoActorAdd(Integer actor,Integer video) {
		ias.addVideoActor(actor,video);
		return "redirect:/ht_video_actor";
	}
}
