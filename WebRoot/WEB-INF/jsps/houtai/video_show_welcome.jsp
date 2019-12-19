<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>后台管理 </title>
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
            <%@ include file= "menu.jsp"%>

        <!-- 右边的主题内容写在这里面 -->
        <div class="right_col" role="main" style="width:1280px;">
        	<div style="margin-left:300px;;margin-top:200px;font-size:50px;font-family:'楷体'">
        		欢迎使用movify后台管理系统
        	</div>
        <!-- /top navigation -->
        
        </div>
          </div>
        </div>
        
        
    
		<!--  这是右边的最底部 -->
        <footer>
          <div class="pull-right">
         	  联系我们 第一组<a href="https://colorlib.com">Colorlib</a>
          </div>
          <div class="clearfix"></div>
        </footer>
      </div>
    </div>







<%@ include file="footer.jsp" %>

  </body>
</html>
