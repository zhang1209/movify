<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    
     <!--1.引入bootstrap外部样式表-->
  <link rel="stylesheet"
       type="text/css"
	   href="/movify/static/assets/css/bootstrap.css"/>
  <!--2.先引入jquery-->
 <script type="text/javascript" src="/movify/static/jquery-3.2.1.js">
 </script>
    <!-- 这是左边的最上面 -->
         <div class="profile">
         
              <div class="profile_pic" style="float:left;">
                <img src="${ht_user.uphoto}" alt="..." class="img-circle profile_img">
              </div>
			 
              <div class="profile_info" style="float:left;">
                <span>Welcome,</span>
                <h2>${ht_user.uname}</h2>
                <div>
                	<a href="/movify/houtai_out_login" style="color:white">退出登录</a>
                </div>
              </div>
              
            </div>

          <div id="sidebar-menu" class="main_menu_side hidden-print main_menu" >
              <div class="menu_section">
                <h3>Movify</h3>
                <ul class="nav side-menu">
				  <c:if test="${ht_user.role == 5 || ht_user.role == 3}">
	                  <li><a><i class="fa fa-home"></i> 视频管理 <span class="fa fa-chevron-down"></span></a>
	                    <ul class="nav child_menu">
	                      <li><a href="/movify/list1" >视频列表</a></li>
	                      <li><a href="/movify/ht_video_photo">视频相关图片</a></li>
	                      <li><a href="/movify/ht_video_actor" >视频相关演员</a></li>
	                    </ul>
	                  </li>
                  </c:if>
                  <c:if test="${ht_user.role == 5 || ht_user.role == 3}">
                  <li><a><i class="fa fa-edit"></i> 博客管理 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a id="/movify/list2">博客列表</a></li>       
                    </ul>
                  </li>
                  </c:if>
                  <c:if test="${ht_user.role == 5 || ht_user.role == 4}">
                  <li><a><i class="fa fa-table"></i>人事管理                  
				  <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/movify/user_list">用户管理</a></li>
                      <li><a href="/movify/role_list">角色管理</a></li>					
                    </ul>
                  </li>
                  </c:if>
                  <c:if test="${ht_user.role == 5 || ht_user.role == 3}">
                  <li><a><i class="fa fa-clone"></i>资源审核<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/movify/vaudit">视频审核</a></li>
                      <li><a href="/movify/baudit">博客审核</a></li>
                    </ul>
                  </li>
                  </c:if>
                </ul>
          	</div> 
      	</div>
      </div>
    </div>
	
<script type="text/javascript" src="movify/static/jquery-3.2.1.js"></script>