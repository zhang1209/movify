package com.movify.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.movify.dao.BaseDao;
import com.movify.dao.IBlogDao;
import com.movify.entity.Blog;
import com.movify.entity.PagerData;

@Repository
public class BlogDaoImpl extends BaseDao implements IBlogDao {

	@Override
	public List<Map<String, Object>> newBlog(int num) {
		String sql = "select u.uid,u.uname,u.uphoto,b.* "
				+ " from blog b left join user u "
				+ " on b.buser = u.uid "
				+ " where b.bcheckstate = 2 and b.bstate = 1"
				+ " order by b.bdate desc ";
		if (num==2) {
			sql = sql+" limit 0,3";
		}
		return executeQuery(sql,null);
	}

	@Override
	public List<Map<String, Object>> ycBolg() {
		String sql = "select b.* ,u.uname,u.uid,u.uphoto "
				+ " from blog b "
				+ " left join user u "
				+ " on b.buser = u.uid "
				+ " where bcheckstate=2 "
				+ " and bstate=1 and btype=2";
		return executeQuery(sql,null);
	}

	@Override
	public List<Map<String, Object>> gfBlog() {
		String sql = "select b.* ,u.uname,u.uid,u.uphoto "
				+ " from blog b "
				+ " left join user u "
				+ " on b.buser = u.uid "
				+ " where bcheckstate=2 "
				+ " and bstate=1 and btype=1";
		return executeQuery(sql,null);
	}

	@Override
	public Map<String, Object> getBlogById(int bid) {
		String sql = "select b.* ,u.uname,u.uid,u.uphoto "
				+ " from blog b "
				+ " left join user u "
				+ " on b.buser = u.uid "
				+ " where bid = ?";
		Object[] ps = {bid};
		List<Map<String,Object>> list = executeQuery(sql,ps);
		if (list.size()>0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public int saveBlog(String btitle, String path, String bintroduce, String bcontent,int uid) {
		String sql = "insert into blog "
				+ " (btitle,bposter,bintroduce,bdetails,buser,btype,bdate)"
				+ " values"
				+ " (?,?,?,?,?,?,?)";
		Object[] ps = {btitle,path,bintroduce,bcontent,uid,2,new Date()};
		return executeUpdate(sql,ps);
	}

	@Override
	public List<Map<String, Object>> getBlogByUserId(Integer uid,Integer pageNo,Integer pageSize) {
		String sql = "select bid,btitle,bintroduce,bdetails,bdate,bposter,bcheckstate"
				+ " from blog"
				+ " where buser = ? and bstate = 1 limit ?,?";
		int pageStart = (pageNo-1)*pageSize; 
		Object[] ps = {uid,pageStart,pageSize};
		return executeQuery(sql,ps);
	}

	@Override
	public int updateBlog(String btitle, String bintroduce, Integer bid, String bdetails) {
		String sql = "update blog set btitle=?,bintroduce=?,bdetails=? where bid = ?";
		Object[] ps = {btitle,bintroduce,bdetails,bid};
		return executeUpdate(sql,ps);
	}
	
	@Override
	public List<Map<String, Object>> find(Integer bcheckstate) {
		String sql="select bid,btitle,bposter,bdetails,bcheckstate,uname from blog  left join user on buser = uid where bcheckstate = ?";
		Object[] ps = {bcheckstate};
		return executeQuery(sql, ps);
	}

	@Override
	public int Update(Integer bcheckstate) {
		String sql=" update blog set bcheckstate=2 where bid=?";
	
		Object[] ps={bcheckstate};
		return executeUpdate(sql, ps);
	}

	@Override
	public int delete(Integer bid) {
		String sql="update blog set bstate = ? where bid = ?";
		String sql2 = "select * from blog where bid = ?";
		Object[] ps2 = {bid};
		List<Map<String,Object>> list = executeQuery(sql2,ps2);
		int bstate = 2;
		if ((int)list.get(0).get("bstate") == 2) {
			bstate = 1;
		}
		Object[] ps={bstate,bid};
		return executeUpdate(sql, ps);
	}
	
	@Override
	public int delete(int bid) {
		String sql="delete  from blog where bid=?";
		Object[] params={bid};
		return executeUpdate(sql, params);
	}

	@Override
	public Map<String, Object> find(int bid) {
		String sql="select u.uphoto,b.bid,btitle,bposter,bintroduce,bdetails,bdate,buser,btype,bstate,bcheckstate "
				+ " from blog b left join user u "
				+ " on b.buser = u.uid "
				+ " where bid=?";
		System.out.println(sql);
		Object[] params={bid};
		List<Map<String,Object>> list=executeQuery(sql, params);
		if(list.size()>0){
			return list.get(0);
			
		}
		return null;
	}

	@Override
	public int add(Blog blog) {
		String sql="insert into blog"
				+ " (btitle,bposter,bintroduce,bdetails,bdate,btype,buser)"
				+ " values"
				+ " (?,?,?,?,?,?,?)";
		Object[] params={
				blog.getBtitle(),
				blog.getBposter(),
				blog.getBintroduce(),
				blog.getBdetails(),
				new Date(),
				2,
				blog.getBuser()
				
		};
		return executeUpdate(sql, params);
	}

	@Override
	public int update(Blog blog) {
		String sql="update blog"
				+ " set btitle=?,bintroduce=?,bdetails=?"
				+ " where bid=?";
		Object[] params={
				blog.getBtitle(),
				blog.getBintroduce(),
				blog.getBdetails(),
				blog.getBid()
		};
		return executeUpdate(sql, params);
	}

	@Override
	public PagerData findByPage(Blog blog, int curPage, int pageSize) {
		/*//分页查询数据
		//curPage:当前查询第几页数据
		//pageSize:每页要显示几条
		
			
			//总共有几条数据
			String sqlTotal = "select  "
					+ "		count(*) "
					+ "   from blog b "
					+ "   join user u "
					+ "   on b.buser = u.uid ";
			//查询总记录数
			int totalCount = jt.queryForInt(sqlTotal);
			//计算总共有几页
			int totalPage = totalCount%pageSize==0?
						    totalCount/pageSize   :
						    totalCount/pageSize+1 ;
			
			
			String sql = "select  "
					+ "		b.bid,b.btitle,b.bposter,b.bintroduce,b.bdetails,b.bdate,b.btype,b.bstate,b.bcheckstate"
					+ "     u.uid,u.uname"
					+ "   from blog b "
					+ "   join user u "
					+ "   on b.buser = u.uname "
					+ "   order by b.bid "
					+ "   limit ?,? ";
			
			//计算分页查询的开始位置
			int start = (curPage-1)*pageSize;
			
			List<Object> params = new ArrayList<Object>();
			params.add(start);
			params.add(pageSize);
			
			//查询当前页的数据记录
			List<Map<String,Object>> dataList = executeQuery(sql,params.toArray());
			
			//将数据封装到分页数据对象中
			PagerData pd = new PagerData();
			pd.setCurPage(curPage); //当前第几页
			pd.setPageSize(pageSize); //每页几条
			pd.setTotalCount(totalCount);//共几条数据
			pd.setTotalPage(totalPage); //共几页
			pd.setDataList(dataList); //当前页的数据
			*/
			return null;
		}

	@Override
	public PagerData findByPage(int curPage, int pageSize) {
		String sqlTotal = "select  "
				+ "		count(*) "
				+ "   from blog b "
				+ "   join user u "
				+ "   on b.buser = u.uid ";
			
		//查询总记录数
		int totalCount = jt.queryForInt(sqlTotal);
		//计算总共有几页
		int totalPage = totalCount%pageSize==0?
					    totalCount/pageSize   :
					    totalCount/pageSize+1 ;
		

		String sql = 	"select b.bid,b.btitle,b.bposter,b.buser,b.bintroduce,b.bdetails,b.bdate,b.btype,b.bstate,b.bcheckstate"
			+ " ,uname  from blog b left join user u "
			+ "  on b.buser = u.uid"
			+ "   order by b.bid "
			+ "   limit ?,? ";
			
				
				  
				//计算分页查询的开始位置
				int start = (curPage-1)*pageSize;
				
				List<Object> params = new ArrayList<Object>();
				params.add(start);
				params.add(pageSize);
				
				//查询当前页的数据记录
				List<Map<String,Object>> dataList = executeQuery(sql,params.toArray());
				
				//将数据封装到分页数据对象中
				PagerData pd = new PagerData();
				pd.setCurPage(curPage); //当前第几页
				pd.setPageSize(pageSize); //每页几条
				pd.setTotalCount(totalCount);//共几条数据
				pd.setTotalPage(totalPage); //共几页
				pd.setDataList(dataList); //当前页的数据
				
				return pd;
		
	}

	@Override
	public List<Map<String, Object>> getBlogByKey(String blog_key) {
		String sql = "select  * from blog "
				+ " where concat(bintroduce,btitle,bdetails,bdate) "
				+ " like concat('%',?,'%')";
		Object[] ps = {blog_key};
		return executeQuery(sql,ps);
	}

	@Override
	public int getMyBlogCount(Integer uid) {
		String sql = "select count(*) from blog where buser = ?";
		Object[] ps = {uid};
		return jt.queryForInt(sql,ps);
	}

}
