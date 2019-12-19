package com.movify.entity;
public class Category{
	private Integer cid; // 分类id
	private String cname; // 分类名称
	public Category(){}
	public Category(Integer cid,String cname){
		this.cid=cid;
		this.cname=cname;
	}
	public void setCid(Integer cid){
		this.cid=cid;
	}
	public Integer getCid(){
		return cid;
	}
	public void setCname(String cname){
		this.cname=cname;
	}
	public String getCname(){
		return cname;
	}
}