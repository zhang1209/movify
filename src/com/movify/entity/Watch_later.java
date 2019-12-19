package com.movify.entity;
public class Watch_later{
	private Integer wlid; // 稍后观看id
	private Integer wluser; // 稍后观看用户外键
	private Integer wlvideo; // 稍后观看视频外键
	private java.util.Date wldate; // 加入日期
	public Watch_later(){}
	public Watch_later(Integer wlid,Integer wluser,Integer wlvideo,java.util.Date wldate){
		this.wlid=wlid;
		this.wluser=wluser;
		this.wlvideo=wlvideo;
		this.wldate=wldate;
	}
	public void setWlid(Integer wlid){
		this.wlid=wlid;
	}
	public Integer getWlid(){
		return wlid;
	}
	public void setWluser(Integer wluser){
		this.wluser=wluser;
	}
	public Integer getWluser(){
		return wluser;
	}
	public void setWlvideo(Integer wlvideo){
		this.wlvideo=wlvideo;
	}
	public Integer getWlvideo(){
		return wlvideo;
	}
	public void setWldate(java.util.Date wldate){
		this.wldate=wldate;
	}
	public java.util.Date getWldate(){
		return wldate;
	}
}