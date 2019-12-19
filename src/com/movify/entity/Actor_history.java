package com.movify.entity;
public class Actor_history{
	private Integer ahid; // 演员历史记录id
	private Integer actor; // 演员外键
	private Integer video; // 视频外键
	private java.util.Date joindate; // 参演时间
	public Actor_history(){}
	public Actor_history(Integer ahid,Integer actor,Integer video,java.util.Date joindate){
		this.ahid=ahid;
		this.actor=actor;
		this.video=video;
		this.joindate=joindate;
	}
	public void setAhid(Integer ahid){
		this.ahid=ahid;
	}
	public Integer getAhid(){
		return ahid;
	}
	public void setActor(Integer actor){
		this.actor=actor;
	}
	public Integer getActor(){
		return actor;
	}
	public void setVideo(Integer video){
		this.video=video;
	}
	public Integer getVideo(){
		return video;
	}
	public void setJoindate(java.util.Date joindate){
		this.joindate=joindate;
	}
	public java.util.Date getJoindate(){
		return joindate;
	}
}