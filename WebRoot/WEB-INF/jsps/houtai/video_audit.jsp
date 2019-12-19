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
                    <h2>审核页面</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
           <table class="table table-bordered">
		   <tr>
		        <th>ID</th>
		        <th>视频名称</th>
		        <th>视频</th>
		        <th>用户</th>
		        <th>操作</th>
		   </tr>  
		      
		   <c:forEach items="${videoList }" var="v">
		   <tr>
		     <td>${v.vid }</td>
		     <td>${v.vname }</td>
		    <td>
		      <video src="${v.vsrc}" width="100" height="100">     
		      </video>
		     </td>
		            <td>      
					       ${v.uname}
				    </td>
		     
		    <td>	
     <a class="btn btn-info" href="vupdate_show?vid=${v.vid }">审核通过</a>  
    <a class="btn btn-info" href="vdelete?vid=${v.vid }">审核不通过</a>
     
    </td>
    </tr>
   </c:forEach>
          
  </table>
  

        </div>


          </div>
        </div>
    
		<!--  这是右边的最底部 -->
        <footer>
          <div class="pull-right">
            ©movify 张硕、郭笑天
          </div>
          <div class="clearfix"></div>
        </footer>
      </div>
    </div>




<%@ include file="footer.jsp" %>
  </body>
</html>
