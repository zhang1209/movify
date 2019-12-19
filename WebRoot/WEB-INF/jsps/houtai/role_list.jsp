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

    <title>后台管理 </title>

 <!--1.引入bootstrap外部样式表-->
  <link rel="stylesheet"
       type="text/css"
	   href="/movify/static/assets/css/bootstrap.css"/>
  <!--2.先引入jquery-->
 <script type="text/javascript" src="/movify/static/jquery-3.2.1.js">
 </script>
 
 <script type="text/javascript">
 $(function() {
		//点击添加按钮，显示模态框
		$("#btnadd").click(function() {
			//让模态框显示
			$("#mtadd").modal();
			
		})	
		//点击模态框保存按钮
		$("#addmodel").click(function() {
			$("#mtadd").modal("hide");

		})							
				  	    							
	})
	   function update_show(rid){
	      $.ajax({
				url:"role_update_show",
				type:"post",
				data:{rid:rid},
				success:function(data){				
					for(var p in data)
					{							
						$("input[name='"+p+"']").val(data[p]);						
					}
					$("#mtupdate").modal();
				},
				error:function(xhr,msg){
				
				},
				dataType:"json"
			});   
	   
	   }
	
	
 </script>
 <script>
		$(function () {
			$(".updtj").click(function () {
				$("#role_upd").submit();
			}) 
			
			$("#addtj").click(function () {
				$("#role_add").submit();
			})
		})
</script>

	<!-- 这里是外联样式表，不用动 但是一定要注意路径，尤其是放到项目中时-->
    <!-- Bootstrap -->
    <link href="/movify/static/assets/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/movify/static/assets/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/movify/static/assets/css/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="/movify/static/assets/css/green.css" rel="stylesheet">
    <!-- bootstrap-progressbar -->
    <link href="/movify/static/assets/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="/movify/static/assets/css/jqvmap.min.css" rel="stylesheet"/>

    <!-- Custom Theme Style -->
    <link href="/movify/static/assets/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="nav-md" style="margin:0px">
    <div class="container body" style="width:100%;height:100%;margin:0px">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>后台管理</span></a>
            </div>
			<style>
            	li{
            		width:230px;
            	}
            </style>
   		<%@ include file="menu.jsp" %>

        <!-- 右边的主题内容写在这里面 -->
        <div class="right_col" role="main" style="width:1280px;">

             

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>角色管理页面</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    
                    <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                    <tr>
					         <th>员工ID</th>
					         <th>员工角色</th>
					         <th>操作</th>
					         
                   </tr>
			  
			   <c:forEach items="${roleList }" var="r">
			    <tr>
			     <td>${r.rid }</td>
			     <td>${r.rname }</td>
			       
			            <td>
			            <a class="btn btn-info" href="javascript:update_show(${r.rid})">修改</a>
			             <a  class="btn btn-info" href="role_delete?rid=${r.rid}">删除</a>
			            </td>
			      </tr>     
        </c:forEach>
        <tr>
                 <td colspan="3">			          
			         <button type="button" class="btn btn-warning" id="btnadd">添加</button>
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
        	
        	<div>
          </div>
          <div>
        </div>
    
		 <!-- footer content -->
        <footer>
          <div class="pull-right">
            <a href="https://colorlib.com">movify</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
        <div>
      </div>
      <div>
    </div>


<!-- 修改  模态框-->
			  <div class="modal fade" id="mtupdate">
			  <div class="modal-dialog">
				<div class="modal-content">
				  <div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">修改角色</h4>
				  </div>
				  <div class="modal-body">
				  	<!-- 表单提交 -->
					<form action="role_update_submit" method="post" id="role_upd">
					
					<input type="hidden" name="rid"/>
					  <div class="form-group">
						<input type="text" class="form-control" name="rname" placeholder="请输入修改角色">
					  </div>
					</form>
				  </div>
				  <div class="modal-footer">
				  	<button type="button" class="btn btn-info updtj" data-dismiss="modal" >提交</button>
					<button type="button" class="btn btn-info" data-dismiss="modal">关闭</button>
				  </div>
				</div><!-- /.modal-content -->
			  </div><!-- /.modal-dialog -->
			</div><!-- /.modal -->
			<!-- 模态框end -->
			
			<!-- 添加  模态框-->
			  <div class="modal fade" id="mtadd">
			  <div class="modal-dialog">
				<div class="modal-content">
				  <div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">添加角色</h4>
				  </div>
				  <div class="modal-body">
				  	<!-- 表单提交 -->
					<form action="role_add_submit" method="post" id="role_add">
					  <div class="form-group">
						<input type="text" class="form-control" name="rname" placeholder="请输入要添加的角色">
					</form>
				  </div>
				  <div class="modal-footer">
				  	<button type="button" class="btn btn-info" data-dismiss="modal" id="addtj">添加</button>
					<button type="button" class="btn btn-info" data-dismiss="modal">关闭</button>
				  </div>
				</div><!-- /.modal-content -->
			  </div><!-- /.modal-dialog -->
			</div><!-- /.modal -->
			<!-- 模态框end -->
			
		<%@ include file="footer.jsp" %>
		
  </body>
</html>
