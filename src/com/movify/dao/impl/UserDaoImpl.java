package com.movify.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import org.springframework.stereotype.Repository;

import com.movify.dao.BaseDao;
import com.movify.dao.IUserDao;
import com.movify.entity.PagerData;
import com.movify.entity.User;
import com.movify.entity.UserQuery;
import com.movify.util.MyUtil;

import jdk.nashorn.internal.runtime.regexp.RegExp;
@Repository
public class UserDaoImpl extends BaseDao implements IUserDao{

	@Override
	public List<Map<String,Object>> isExists(String username, String password, int num) {
		String sql = null;
		if (num==1) {
			sql = "select * from user where uemail = ? and upw = ?";
		} else if (num==2) {
			sql = "select * from user where uphone = ? and upw = ?";
		}else if (num==3) {
			sql = "select * from user where uname = ? and upw = ?";
		}
		Object[] ps = {username,password};
		return executeQuery(sql,ps);
	}

	@Override
	public boolean isExists(String uname) {
		String sql = "select uname "
				+ " from user"
				+ " where uname = ?";
		Object[] ps = {uname};
		List<Map<String,Object>> list = executeQuery(sql,ps);
		if (list.size()>0) {
			return true;
		}
		return false;
	}

	@Override
	public int add(String uname, String upw, String helpcode) {
		String sql = "insert into user"
				+ " (uname,upw,helpcode)"
				+ " values"
				+ " (?,?,?)";
		Object[] ps = {uname,upw,helpcode};
		return executeUpdate(sql,ps);
	}

	@Override
	public boolean forgetUpw(String username, String helpcode) {
		String sql = "select uname,helpcode from user"
				+ " where uname = ? and helpcode = ?";
		Object[] ps = {username,helpcode};
		List<Map<String,Object>> list = executeQuery(sql,ps);
		if (list.size()>0) {
			return true;
		}
		return false;
	}

	@Override
	public int updUpw(String username, String upw) {
		String sql = "update user set upw = ? where uname = ?";
		Object[] ps = {upw,username};
		return executeUpdate(sql,ps);
	}

	@Override
	public int openVip(Integer uid) {
		String sql = "update user set role = 2 where uid = ?";
		Object[] ps = {uid};
		return executeUpdate(sql,ps);
	}

	@Override
	public Map<String, Object> getUser(Integer uid) {
		String sql = "select * from user u "
				+ " left join role r"
				+ " on u.role = r.rid "
				+ " where uid = ?";
		Object[] ps = {uid};
		List<Map<String,Object>> list = executeQuery(sql,ps);
		return list.get(0);
	}

	@Override
	public int updUser(String uname, String uemail, String uphone, String helpcode, String path, int uid) {
		String sql = "update user set uname=?,uemail=?,uphone=?,helpcode=?,uphoto=? where uid = ?";
		Object[] ps = {uname,uemail,uphone,helpcode,path,uid};
		return executeUpdate(sql,ps);
	}

	@Override
	public Map<String, Object> find(int uid) {
		String sql="select *"
				+ " from user u"
				+ " join role r"
				+ " on u.role=r.rid"
				+ " where uid=?";
		Object[] ps={uid};
		
		return executeQueryForMap(sql, ps);
	}

	@Override
	public int update(User user) {
		String sql="update user set role=?"				
				+ "  where uid=?";
		Object[] ps={
             user.getRole(),
             user.getUid()
		};
		return executeUpdate(sql, ps);
	}

	@Override
	public List<Map<String, Object>> findAll() {
		String sql="select *"
				+ " from user u"
				+ " join role r"
				+ " on u.role=r.rid";
		return executeQuery(sql, null);
	}

	//curPage:当前查询第几页数据
    //pageSize:每页要显示几条
	@Override
	public PagerData findByPage(UserQuery userQuery, int curPage, int pageSize) {
		//根据条件拼接where语句
		String sqlWhere = "";
		List<Object> ps= new ArrayList<Object>();
		
		//名字条件不为空
				if(!MyUtil.isNull(userQuery.getUname())){
					sqlWhere +=" and u.uname like ? ";
					ps.add("%"+userQuery.getUname()+"%");
				}
		//手机号
				if(!MyUtil.isNull(userQuery.getUphone())){
					sqlWhere +=" and u.uphone =?";
					ps.add("%"+userQuery.getUphone()+"%");
				}
		//角色
				if(userQuery.getRid()!=null){
					sqlWhere += " and r.rid = ? ";
					ps.add(userQuery.getRid());
				    }
		//状态				
				if(userQuery.getState()!=null){
					sqlWhere += " and u.state = ? ";
					ps.add(userQuery.getState());
				  }
		//获取带条件查询的总记录数
			String sqlTotal="select "
				+ " count(*)"
				+ " from user u"
				+ " join role r"
				+ " on u.role=r.rid"
				+ " where 1=1 "+sqlWhere;
			int totalCount = jt.queryForInt(sqlTotal,ps.toArray());
			//根据总记录数获取总页数
			int totalPage = totalCount%pageSize==0 ?
					        totalCount/pageSize    :
					        totalCount/pageSize+1;
			//查询当前页的数据记录
			String sql="select *"
					+ " from user u"
					+ " join role r"
					+ " on u.role=r.rid"
					+ " where 1=1 "+sqlWhere
					+ " order by u.uid "
					+ " limit ?,?";
			//计算分页查询的开始位置
			int start = (curPage-1)*pageSize;
			
			ps.add(start);
			ps.add(pageSize);
			
			List<Map<String,Object>> dataList = executeQuery(sql,ps.toArray());
			//封装分页数据对象
			PagerData pd = new PagerData();
			//当前第几页
			pd.setCurPage(curPage);
			//每页几条
			pd.setPageSize(pageSize);
			//总记录数
			pd.setTotalCount(totalCount);
			//总页数
			pd.setTotalPage(totalPage);
			//当前页数据记录
			pd.setDataList(dataList);
		return pd;
	}

	@Override
	public Map<String, Object> find(String username, String password) {
		String sql="select * from user where uname=? and upw=?";
		Object[] params={username,password};
		 List<Map<String,Object>> list=executeQuery(sql, params);
		 if(list.size()>0){
			 return list.get(0);
		 }
		 return null;
	}

	@Override
	public int updState(Integer uid) {
		String sql = "select * from user where uid = ?";
		Object[] ps = {uid};
		List<Map<String,Object>> list = executeQuery(sql,ps);
		int state = 2;
		if ((int) list.get(0).get("state") == 2) {
			state = 1;
		}
		String sql2 = "update user set state = ? where uid = ?";
		Object [] ps2 = {state,uid};
		
		return executeUpdate(sql2,ps2);
	}

	@Override
	public boolean uemailIsExists(String uemail) {
		String sql = "select * from user where uemail = ?";
		Object [] ps = {uemail};
		List<Map<String,Object>> list = executeQuery(sql,ps);
		if (list.size()>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean uphoneIsExists(String uphone) {
		String sql = "select * from user where uphone = ?";
		Object [] ps = {uphone};
		List<Map<String,Object>> list = executeQuery(sql,ps);
		if (list.size()>0) {
			return true;
		}
		return false;
	}

	
}
