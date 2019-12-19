package com.movify.entity;
public class Replay{
	private Integer rpid; // 回复id
	private String rpcontent; // 回复内容
	private Integer rpblog; // 回复的博客外键
	private Integer rpuser; // 回复的用户外键
	private Integer rpfid; // 回复的父id
	private java.util.Date rpdate; // 回复的日期
	public Replay(){}
	public Replay(Integer rpid,String rpcontent,Integer rpblog,Integer rpuser,Integer rpfid,java.util.Date rpdate){
		this.rpid=rpid;
		this.rpcontent=rpcontent;
		this.rpblog=rpblog;
		this.rpuser=rpuser;
		this.rpfid=rpfid;
		this.rpdate=rpdate;
	}
	public void setRpid(Integer rpid){
		this.rpid=rpid;
	}
	public Integer getRpid(){
		return rpid;
	}
	public void setRpcontent(String rpcontent){
		this.rpcontent=rpcontent;
	}
	public String getRpcontent(){
		return rpcontent;
	}
	public void setRpblog(Integer rpblog){
		this.rpblog=rpblog;
	}
	public Integer getRpblog(){
		return rpblog;
	}
	public void setRpuser(Integer rpuser){
		this.rpuser=rpuser;
	}
	public Integer getRpuser(){
		return rpuser;
	}
	public void setRpfid(Integer rpfid){
		this.rpfid=rpfid;
	}
	public Integer getRpfid(){
		return rpfid;
	}
	public void setRpdate(java.util.Date rpdate){
		this.rpdate=rpdate;
	}
	public java.util.Date getRpdate(){
		return rpdate;
	}
}