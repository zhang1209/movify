package com.movify.entity;
public class Photo{
	private Integer pid; // 图片id
	private String ptitle; // 图片标题
	private String pname; // 图片路径
	private Integer puser; // 图片发布用户外键
	private Integer pstate; // 图片状态
	private Integer pcheckstate; // 图片审核状态
	public Integer getPcheckstate() {
		return pcheckstate;
	}
	public void setPcheckstate(Integer pcheckstate) {
		this.pcheckstate = pcheckstate;
	}
	public Photo(){}
	public Photo(Integer pid,String ptitle,String pname,Integer puser,Integer pstate,Integer pcheckstate){
		this.pid=pid;
		this.ptitle=ptitle;
		this.pname=pname;
		this.puser=puser;
		this.pstate=pstate;
		this.pcheckstate=pcheckstate;
	}
	public void setPid(Integer pid){
		this.pid=pid;
	}
	public Integer getPid(){
		return pid;
	}
	public void setPtitle(String ptitle){
		this.ptitle=ptitle;
	}
	public String getPtitle(){
		return ptitle;
	}
	public void setPname(String pname){
		this.pname=pname;
	}
	public String getPname(){
		return pname;
	}
	public void setPuser(Integer puser){
		this.puser=puser;
	}
	public Integer getPuser(){
		return puser;
	}
	public void setPstate(Integer pstate){
		this.pstate=pstate;
	}
	public Integer getPstate(){
		return pstate;
	}
}