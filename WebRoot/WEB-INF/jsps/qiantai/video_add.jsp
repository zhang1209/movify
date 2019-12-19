<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>

<html lang="en">

<head>
    <style type="text/css">
    	span{
    		color:red;
    		font-size:15px;
    	}
    	.unImportance{
    		float:left;
    	}
    </style>
</head>

<body>




    <!-- =============== START OF WRAPPER =============== -->
    <div class="wrapper">

	<%@ include file="header.jsp" %>
       


        <!-- =============== START OF PAGE HEADER =============== -->
        <section class="page-header overlay-gradient" style="background: url(/movify/static/assets/images/posters/movie-collection.jpg); 
          margin-top:65px;">
            <div class="container">
                <div class="inner">
                    <h2 class="title">发布视频</h2>
                    <ol class="breadcrumb">
                        <li><a href="${ctx}/indexShow">主页</a></li>
                        <li>发布视频</li>
                    </ol>
                </div>
            </div>
        </section>
        <!-- =============== END OF PAGE HEADER =============== -->



        <!-- =============== START OF MAIN =============== -->
        <main class="contact-page ptb100">
            <div class="container">
                <div class="row">


                    <!-- Start of Contact Details -->
                    <div class="col-md-4 col-sm-12">
                        <h3 class="title">名言警句</h3>

                        <div class="details-wrapper">
                            <p>
                            	&nbsp;&nbsp;&nbsp;&nbsp;
                            	&nbsp;&nbsp;&nbsp;&nbsp;
                            	文字，似静幽的莲花，清丽而芬芳，若轻轻碰触，暗香便由指间漾溢上心头。静静徜徉于文字天地，可以领略到远离尘嚣、远离名利纷争的世外桃源的极美风光，可以聆听到来自云水深处的曼妙梵音，聆听到来自旷远、来自尘世外的袅袅天籁。
                            </p>
							
							<h3 class="title">最新视频</h3>
                            <ul class="blog-posts-widget">
									<c:forEach items="${new_video}" var="nv">
	                                    <!-- Post 1 -->
	                                    <li>
	                                        <div class="blog-content">
	                                            <div class="blog-thumb">
	                                                <a href="${ctx}/video_details?vid=${nv.vid}">
	                                                    <img src="${nv.vposter}" alt="" style="width:150px;height:200px;">
	                                                </a>
	                                            </div>
	
	                                            <div class="blog-text">
	                                                <h5>
	                                                    <a href="${ctx}/video_details?vid=${nv.vid}">
	                                                        ${nv.vname}
	                                                    </a>
	                                                </h5>
	                                                <span>${nv.vdate}</span>
	                                            </div>
	                                        </div>
	                                    </li>
								</c:forEach>
                           </ul>
                        </div>
                    </div>
                    <!-- Start of Contact Details -->


                    <!-- Start of Contact Form -->
                    <div class="col-md-8 col-sm-12">
                        <h3 class="title">编辑你的视频信息</h3>

                        <!-- Start of Contact Form -->
                        <form id="fr" action="${ctx}/video_add_save" method="post" enctype="multipart/form-data">
							<input type="hidden" value="${user.uid}" name="uid"/>

                            <!-- Form Group -->
                            <div class="form-group">
                                <input type="text" name="vname" id="name" placeholder="视频标题（必选）" class="form-control">
                            	<span id="nameErr"></span>
                            </div>
                            
                            <!-- Form Group -->
                            <div class="form-group">
                               <input type="text" name="vcountry" placeholder="国家"/>
                            </div>
                            
                            <!-- Form Group -->
                            <div class="form-group">
                               <input type="text" name="vdirector" placeholder="导演"/>
                            </div>
                            
                            <!-- Form Group -->
                            <div class="form-group">
                               <input type="text" name="vcost" placeholder="耗资(必填)" id="cost"/>
                            	<span id="costErr"></span>
                            </div>
                            
                            <!-- Form Group -->
                            <div class="form-group">
                               <input type="text" name="vstudio" placeholder="制片厂"/>
                            </div>
                            
                            <!-- Form Group -->
                            <div class="form-group">
                               <input type="text" name="vtime" placeholder="时长"/>
                            </div>
                            
                            <!-- Form Group -->
                            <div class="form-group">
                               <select name="cid" class="form-control" id="cid">
                               		<option value="0">---请选择视频分类（必选）---</option>
                               		<c:forEach items="${category}" var="c">
                               			<option value="${c.cid}">${c.cname}</option>
                               		</c:forEach>
                               </select>
                               <span id="cidErr"></span>
                            </div>
                            
                            <!-- Form Group -->
                            <div class="form-group">
                               <select name="lid" class="form-control" id="lid">
                               		<option value="0">---请选择视频语种（必选）---</option>
                               		<c:forEach items="${language}" var="l">
                               			<option value="${l.lid}">${l.lname}</option>
                               		</c:forEach>
                               </select>
                               <span id="lidErr"></span>
                            </div>

                            <!-- Form Group -->
                            <div class="form-group">
                                <input class="form-control input-box" type="file" name="vfile" id="poster"/>
                                <span id="posterErr"></span>
                                <input class="form-control input-box" type="file" name="vfile" id="src"/>
                            	<span id="srcErr"></span>
                            </div>


                            <!-- Form Group -->
                            <div class="form-group">
                                <textarea class="form-control textarea-box" rows="1" id="introduce" name="vintroduce" placeholder="视频简介内容"></textarea>	
                           		<span id="introduceErr"></span>
                            </div>

                            <!-- Form Group -->
                            <div class="form-group text-center">
                                <button type="button" class="btn btn-main btn-effect fbsp">发布视频</button>
                            </div>
                        </form>
                        <!-- End of Contact Form -->
                    </div>
                    <!-- Start of Contact Form -->

                </div>
            </div>
        </main>
        <!-- =============== END OF MAIN =============== -->
     
    </div>
    <!-- =============== END OF WRAPPER =============== -->
    <%@ include file="footer.jsp" %>
    <script type="text/javascript" src="/movify/static/jquery-3.2.1.js"></script>
    <script type="text/javascript">
    	$(function() {
    		$("#name").blur(function () {
    			if ($("#name").val().trim() == "") {
    				$("#nameErr").html("不能为空哦！！");
    				$("#name").css("border","1px solid red");
    				return false;
    			} 
    			$("#nameErr").html("");
    		})
    		
    		$("#cost").blur(function () {
    			if ($("#cost").val().trim() == "") {
    				$("#costErr").html("不能为空哦！！");
    				$("#cost").css("border","1px solid red");
    				return false;
    			} 
    			
    			reg = /^\d+$/;
    			if (!reg.test($("#cost").val())) {
    				$("#costErr").html("必须是数字");
    				$("#cost").css("border","1px solid red");
    				return false;
    			}
    			
    			$("#costErr").html("");
    		})
    		
    		$("#cid").blur(function () {
    			if ($("#cid").val() == "0") {
    				$("#cidErr").html("不能为空哦！！");
    				$("#cid").css("border","1px solid red");
    				return false;
    			} 
    			$("#cid").css("border","1px solid #e3e3e3");
    			$("#cidErr").html("");
    		})
    		
    		$("#lid").blur(function () {
    			if ($("#lid").val() == "0") {
    				$("#lidErr").html("不能为空哦！！");
    				$("#lid").css("border","1px solid red");
    				return false;
    			} 
    			$("#lid").css("border","1px solid #e3e3e3");
    			$("#lidErr").html("");
    		})
    		
    		$("#poster").blur(function () {
    			if ($("#poster").val().trim() == "") {
    				$("#posterErr").html("不能为空哦！！");
    				$("#poster").css("border","1px solid red");
    				return false;
    			} 
    			$("#posterErr").html("");
    		})
    		
    		$("#src").blur(function () {
    			if ($("#src").val().trim() == "") {
    				$("#srcErr").html("不能为空哦！！");
    				$("#src").css("border","1px solid red");
    				return false;
    			} 
    			$("#srcErr").html("");
    		})
    		
    		$("#introduce").blur(function () {
    			if ($("#introduce").val().trim() == "") {
    				$("#introduceErr").html("不能为空哦！！");
    				$("#introduce").css("border","1px solid red");
    				return false;
    			} 
    			$("#introduceErr").html("");
    		})
    		
    		
    		$(".fbsp").click(function() {
	    		if (${user == null}) {
	    			alert("请先登录");
	    		} else {
	 				$("#name").blur();
	 				$("#cost").blur();
	 				$("#cid").blur();
	 				$("#lid").blur();
	 				$("#poster").blur();
	 				$("#src").blur();
	 				$("#introduce").blur();
	 				
	 				if (
	 					$("#nameErr").html() =="" &&
		 				$("#costErr").html() =="" &&
		 				$("#cidErr").html() =="" &&
		 				$("#lidErr").html() =="" &&
		 				$("#posterErr").html() =="" &&
		 				$("#srcErr").html() =="" &&
		 				$("#introduceErr").html() =="" 					
	 				) {
	 					alert("视频已提交，请等待管理员审核");
		  				$("#fr").submit();
	 				} else {
						alert("请填写表单（必填项、文件必须填写）");
	 				}	
	 			}
    	})
	 	
	  })  	
    	
    </script>
</body>

</html>
