package com.movify.entity;
public class Language{
	private Integer lid; // 语种id
	private String lname; // 语种姓名
	public Language(){}
	public Language(Integer lid,String lname){
		this.lid=lid;
		this.lname=lname;
	}
	public void setLid(Integer lid){
		this.lid=lid;
	}
	public Integer getLid(){
		return lid;
	}
	public void setLname(String lname){
		this.lname=lname;
	}
	public String getLname(){
		return lname;
	}
}