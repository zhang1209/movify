package com.movify.entity;

import java.util.List;
import java.util.Map;

//定义分页数据对象,存储分页的相关数据
public class PagerData {
	//每页显示的条数
	private Integer pageSize;
	//当前第几页
	private Integer curPage;
	//当前表总共的记录数
	private Integer totalCount;
	//总页数
	private Integer totalPage;
	//当前页要显示的数据记录
	private List<Map<String,Object>> dataList;
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getCurPage() {
		return curPage;
	}
	public void setCurPage(Integer curPage) {
		this.curPage = curPage;
	}
	public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
	public Integer getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	public List<Map<String, Object>> getDataList() {
		return dataList;
	}
	public void setDataList(List<Map<String, Object>> dataList) {
		this.dataList = dataList;
	}
	@Override
	public String toString() {
		return "PagerData [pageSize=" + pageSize + ", curPage=" + curPage + ", totalCount=" + totalCount
				+ ", totalPage=" + totalPage + ", dataList=" + dataList + "]";
	}
}
