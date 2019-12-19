package com.movify.entity;
public class Msg{
	private Integer mid; // 消息id
	private String mcontext; // 消息内容
	private Integer mreceive; // 消息收件人外键
	private Integer msend; // 消息发送人外键
	private java.util.Date mdate; // 消息发送日期
	private Integer mstate; // 消息状态
	public Msg(){}
	public Msg(Integer mid,String mcontext,Integer mreceive,Integer msend,java.util.Date mdate,Integer mstate){
		this.mid=mid;
		this.mcontext=mcontext;
		this.mreceive=mreceive;
		this.msend=msend;
		this.mdate=mdate;
		this.mstate=mstate;
	}
	public void setMid(Integer mid){
		this.mid=mid;
	}
	public Integer getMid(){
		return mid;
	}
	public void setMcontext(String mcontext){
		this.mcontext=mcontext;
	}
	public String getMcontext(){
		return mcontext;
	}
	public void setMreceive(Integer mreceive){
		this.mreceive=mreceive;
	}
	public Integer getMreceive(){
		return mreceive;
	}
	public void setMsend(Integer msend){
		this.msend=msend;
	}
	public Integer getMsend(){
		return msend;
	}
	public void setMdate(java.util.Date mdate){
		this.mdate=mdate;
	}
	public java.util.Date getMdate(){
		return mdate;
	}
	public void setMstate(Integer mstate){
		this.mstate=mstate;
	}
	public Integer getMstate(){
		return mstate;
	}
}