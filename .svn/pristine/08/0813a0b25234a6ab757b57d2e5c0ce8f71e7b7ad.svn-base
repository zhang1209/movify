<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>


<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HTML5视频播放器插件|Ckins</title>
    <link rel="stylesheet" href="${ctx}/videoUtil/dist/css/ckin.css">
    <link rel="stylesheet" href="${ctx}/videoUtil/css/demo.css">
    <style>
    	body{
			padding:0px;
			margin:0px;
			background:black;
		}
    </style>
</head>
<body>
	<div style="width:96%;height:100%;margin:5px auto;
			">
		<video
			id="shipin"
			style="width:888px;height:480px;"
			poster="${video_byid[0].get('vposter')}"
			src="${video_byid[0].get('vsrc')}"
			data-ckin="default" 
			data-overlay="1" 
			data-title="${video_byid[0].get('vname')}">
		</video>
	</div>
	<script src="${ctx}/videoUtil/dist/js/ckin.js"></script>
	<script type="text/javascript" src="${ctx}/static/jquery-3.2.1.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".fullscreen").click(function() {
				$("#shipin").css({"width":"100%","height":"100%"});
			})
		})
	</script>
</body>
</html>