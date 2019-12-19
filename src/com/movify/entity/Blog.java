package com.movify.entity;
public class Blog{
	private Integer bid; // 博客id
	private String btitle; // 博客标题
	private String bposter; // 博客插图
	private String bintroduce; // 博客简介
	private String bdetails; // 博客详情
	private java.util.Date bdate; // 博客发布日期
	private Integer buser; // 博客发布用户外键
	private Integer btype; // 博客类型
	private Integer bstate; // 博客状态
	private Integer bcheckstate; // 博客审核状态
	public Integer getBcheckstate() {
		return bcheckstate;
	}
	public void setBcheckstate(Integer bcheckstate) {
		this.bcheckstate = bcheckstate;
	}
	public Blog(){}
	public Blog(Integer bid,String btitle,String bposter,String bintroduce,String bdetails,java.util.Date bdate,Integer buser,Integer btype,Integer bstate,Integer bcheckstate){
		this.bid=bid;
		this.btitle=btitle;
		this.bposter=bposter;
		this.bintroduce=bintroduce;
		this.bdetails=bdetails;
		this.bdate=bdate;
		this.buser=buser;
		this.btype=btype;
		this.bstate=bstate;
		this.bcheckstate=bcheckstate;
	}
	public void setBid(Integer bid){
		this.bid=bid;
	}
	public Integer getBid(){
		return bid;
	}
	public void setBtitle(String btitle){
		this.btitle=btitle;
	}
	public String getBtitle(){
		return btitle;
	}
	public void setBposter(String bposter){
		this.bposter=bposter;
	}
	public String getBposter(){
		return bposter;
	}
	public void setBintroduce(String bintroduce){
		this.bintroduce=bintroduce;
	}
	public String getBintroduce(){
		return bintroduce;
	}
	public void setBdetails(String bdetails){
		this.bdetails=bdetails;
	}
	public String getBdetails(){
		return bdetails;
	}
	public void setBdate(java.util.Date bdate){
		this.bdate=bdate;
	}
	public java.util.Date getBdate(){
		return bdate;
	}
	public void setBuser(Integer buser){
		this.buser=buser;
	}
	public Integer getBuser(){
		return buser;
	}
	public void setBtype(Integer btype){
		this.btype=btype;
	}
	public Integer getBtype(){
		return btype;
	}
	public void setBstate(Integer bstate){
		this.bstate=bstate;
	}
	public Integer getBstate(){
		return bstate;
	}
}