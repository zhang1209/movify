<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
  <head>
   <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>DataTables | Gentellela</title>

     <script type="text/javascript" src="/movify/static/assets/js/jquery-1.12.4.min.js"></script>
         
     <script type="text/javascript">
	  
	   function update_show(uid){
	      $.ajax({
				url:"user_update_show",
				type:"post",
				data:{uid:uid},
				success:function(data){				
					for(var p in data)
					{							
						$("input[name='"+p+"']").val(data[p]);					
					}
					$("#mt").modal();
				},
				error:function(xhr,msg){
				
				},
				dataType:"json"
			});   
	   
	   }
	
	</script>

     
    <!-- Bootstrap -->
    <link href="/movify/static/assets/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/movify/static/assets/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/movify/static/assets/css/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="/movify/static/assets/css/green.css" rel="stylesheet">
    <!-- Datatables -->
    <link href="/movify/static/assets/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="/movify/static/assets/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="/movify/static/assets/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="/movify/static/assets/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="/movify/static/assets/css/scroller.bootstrap.min.css" rel="stylesheet">
 <!-- Custom Theme Style -->
    <link href="/movify/static/assets/css/custom.min.css" rel="stylesheet">
    <script type="text/javascript" src="/movify/static/jquery-3.2.1.js"></script>
    <script type="text/javascript">
   	$(function () {
		$("#xgtj").click(function () {
			$("#user_xg_fr").submit();
		})
   	})
   </script>
  </head>

  <body class="nav-md" style="margin:0px">
    <div class="container body" style="width:100%;height:100%;margin:0px">
      <div class="main_container" >
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index.html" class="site_title"><i class="fa fa-paw"></i> 
			  <span>Gentellela Alela!</span></a>
            </div>
			<style>
            	li{
            		width:230px;
            	}
            </style>
 		<%@ include file="menu.jsp" %>
        <div class="right_col" role="main" style="width:1280px;">

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12" >
                <div class="x_panel">
                  <div class="x_title">
                    <h2>用户管理页面</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    
                <table id="datatable" class="table table-striped table-bordered">
                
                    <form action="user_list" method="post" id="frm">
					姓名:
					<!-- ${param.name}:保存了提交的参数数据 -->
					<input type="text" name="uname" value="${ps.uname}"/>
							
					状态:
					<select name="state">					
						<option value="1" >启用</option>
						<option value="2" >禁用</option>
					</select>																		
					角色:
					<select name="rid">
						<option value="">全部</option>
						<c:forEach items="${roleList}" var="r">
						<option value="${r.rid}" ${r.rid eq ps.role?"selected='selected'":"" }>
  
							${r.rname}
						</option>
						</c:forEach>
					</select>
   
   
   <!-- 分页隐藏域 -->
					<input type="hidden" name="curPage" id="curPage"/>
					
					<input type="submit" value="查询"/>				
				 
                  </form>
                      <thead>
                    <tr>
					         <th>ID</th>
					         <th>照片</th>
					         <th>名字</th>
					         <th>密码</th>         
					         <th>手机号</th>
					         <th>邮箱</th>
					         <th>挽救码</th>
					         <th>状态</th>
					         <th>角色</th>
					         <th>操作</th>
                   </tr>
			  
			   <c:forEach items="${pd.dataList }" var="u">
			    <tr>
			   <td>${u.uid }</td>
			   <td>
			    	          <img src="${u.uphoto}" width="80" height="80">
			    	     </td>
			    <td>${u.uname }</td>
			     <td>${u.upw }</td>    
			       <td>${u.uphone }</td>
			        <td>${u.uemail }</td>
			         <td>${u.helpcode }</td>
			          <td>
			          
			            <c:if test="${u.state eq 1}">
								启用
							</c:if>
							<c:if test="${u.state eq 2}">
								禁用
							</c:if>
			          </td>
			        
			           <td>${u.rname }</td>          
			            <td>
			            <a id="userupdate" href="javascript:update_show(uid=${u.uid })" >
			            	<button class="video_edit btn" style="cursor:pointer;background:#2a3f54;color:white">修改</button>
			            </a>
			            <a id="userupdate" href="/movify/updState?uid=${u.uid }" >
			            	<button class="btn" style="background:#c52203;color:white">
				            	<c:if test="${u.state == 1}">
				            		禁用
				            	</c:if>
				            	<c:if test="${u.state == 2}">
				            		启用
				            	</c:if>
			            	</button>
			            </a>
			            </td>
			      </tr>     
        </c:forEach>
        
                    <tr>
    		<td colspan="7">
    			共${pd.totalCount }条记录||
    			第${pd.curPage }页/共${pd.totalPage }页||
    			<a href="user_list?curPage=1">首页</a>
    			<c:if test="${pd.curPage>1}">
    				<a href="user_list?curPage=${pd.curPage-1}">上一页</a>
				</c:if>
				<c:if test="${pd.curPage ==1 }">
					<span>上一页</span>
				</c:if>
				
				<!-- 序列页码 -->
				<c:forEach begin="1" end="${pd.totalPage }" var="i">
					<c:if test="${pd.curPage==i}">
						<span>${i}</span>
					</c:if>
					<c:if test="${pd.curPage!=i }">
						<a href="user_list?curPage=${i}">${i }</a>
					</c:if>
				</c:forEach>
				
				<c:if test="${pd.curPage<pd.totalPage }">
    				<a href="user_list?curPage=${pd.curPage+1}">下一页</a>
    			</c:if>
    			<c:if test="${pd.curPage==pd.totalPage }">
    				<span>下一页</span>
    			</c:if>
    			
    			<a href="user_list?curPage=${pd.totalPage}">尾页</a>
    		</td>
    	</tr>
     </tbody>
  </table>
     
                               
                  </div>
                </div>
              </div>

             </div>
            </div>
          </div>
        </div>
        <!-- /page content -->
    
      <!-- 修改  模态框-->
			  <div class="modal fade" id="mt">
			  <div class="modal-dialog">
				<div class="modal-content">
				  <div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">修改用户</h4>
				  </div>
				  <div class="modal-body">
				  	<!-- 表单提交 -->
					<form action="user_update_submit" method="post" id="user_xg_fr">
					  <div class="form-group">
					  
					  
					  <input type="hidden" name="uid"/>
						<select name="rid">
							<option value="">选择要修改的角色</option>
						<c:forEach items="${roleList}" var="r">
						<option value="${r.rid}" ${r.rid eq ps.role?"selected='selected'":"" }>
							${r.rname}
						</option>
						</c:forEach>
					</select>
					</form>
				  </div>
				  <div class="modal-footer">	
				  	<button type="button" class="btn" data-dismiss="modal" id="xgtj" style="background:#2a3f54;color:white">提交</button>						 
					<button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
				  </div>
				</div><!-- /.modal-content -->
			  </div><!-- /.modal-dialog -->
			</div><!-- /.modal -->
			<!-- 模态框end -->
			
   <%@ include file="footer.jsp" %>
   
  </body>
</html>