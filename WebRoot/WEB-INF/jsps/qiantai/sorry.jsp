<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'sorry.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  		<div id="login"
    		style="font-size:25px;color:white;
    		margin-left:250px;margin-top:200px;
    		display:none;"
    	>对不起观看此视频请<span id="nowlogin" style="color:#9352b3;cursor:pointer">现在登录！！！</span></div>
  		
    	<div id="vip"
    		style="font-size:25px;color:white;
    		margin-left:250px;margin-top:200px;
    		display:block;"
    	>对不起观看此视频请<a id="openvip" style="color:#9352b3;text-decoration:none;cursor:pointer">开通会员</a>！！！</div>
	
	
		<script type="text/javascript" src="/movify/static/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			$(function () {
				if (${user == null} || ${user == ""}) {
					$("#login").css("display","block");
					$("#vip").css("display","none");
				}
				
				$("#nowlogin").click(function () {
					$('.mfp-close',window.parent.document).click();
				})
				
				$("#openvip").click(function () {
					$('.mfp-close',window.parent.document).click();
				})
				
			})
		</script>
  </body>
 
</html>