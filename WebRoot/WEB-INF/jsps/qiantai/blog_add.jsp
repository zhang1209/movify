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
                    <h2 class="title">发布博客</h2>
                    <ol class="breadcrumb">
                        <li><a href="${ctx}/indexShow">主页</a></li>
                        <li>发布博客</li>
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
							
							<h3 class="title">最新博客</h3>
                            <ul class="blog-posts-widget">
									<c:forEach items="${ new_blog}" var="nb">
	                                    <!-- Post 1 -->
	                                    <li>
	                                        <div class="blog-content">
	                                            <div class="blog-thumb">
	                                                <a href="${ctx}/blog_details?bid=${nb.bid}">
	                                                    <img src="${nb.bposter}" alt="">
	                                                </a>
	                                            </div>
	
	                                            <div class="blog-text">
	                                                <h5>
	                                                    <a href="${ctx}/blog_details?bid=${nb.bid}">
	                                                        ${nb.btitle}
	                                                    </a>
	                                                </h5>
	                                                <span>${nb.bdate}</span>
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
                        <h3 class="title">编辑你的博客</h3>

                        <!-- Start of Contact Form -->
                        <form id="fr" action="${ctx}/blog_add_save" method="post" enctype="multipart/form-data">
							<input type="hidden" value="${user.uid}" name="uid"/>
                            <!-- contact result -->
                            <div id="contact-result"></div>
                            <!-- end of contact result -->

                            <!-- Form Group -->
                            <div class="form-group">
                                <input class="form-control input-box" type="text" name="btitle" id="title" placeholder="博客标题" autocomplete="off">
                            	<span id="titleErr"></span>
                            </div>

                            <!-- Form Group -->
                            <div class="form-group">
                                <input class="form-control input-box" type="file" name="bposter" id="poster" placeholder="博客封面" autocomplete="off">
                            	<span id="posterErr"></span>
                            </div>


                            <!-- Form Group -->
                            <div class="form-group">
                                <textarea class="form-control textarea-box" rows="1" name="bintroduce" id="introduce" placeholder="博客简介内容"></textarea>	
                           		<span id="introduceErr"></span>
                            </div>
							
                            <!-- Form Group -->
                            <div class="form-group mb20">
                                <textarea class="form-control textarea-box" rows="12" name="bcontent" id="content" placeholder="在这里写入你的博客详细内容"></textarea>
                            	<span id="contentErr"></span>
                            </div>

                            <!-- Form Group -->
                            <div class="form-group text-center">
                                <button type="button" class="btn btn-main btn-effect fbbk">发布博客</button>
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
    
	    $(function () {
	    	$("#title").blur(function () {
	    		if ($("#title").val().trim()=="") {
	    			$("#titleErr").html("标题不能为空");
	    			$("#title").css({"border":"1px solid red"});
	    			return false;
	    		}
	    		$("#titleErr").html("");
	    	})
	    	
	    	$("#poster").blur(function () {
	    		if ($("#poster").val().trim()=="") {
	    			$("#posterErr").html("封面不能为空");
	    			$("#poster").css({"border":"1px solid red"});
	    			return false;
	    		}
	    		$("#posterErr").html("");
	    	})
	    	
	    	$("#introduce").blur(function () {
	    		if ($("#introduce").val().trim()=="") {
	    			$("#introduceErr").html("简介不能为空");
	    			$("#introduce").css({"border":"1px solid red"});
	    			return false;
	    		}
	    		$("#introduceErr").html("");
	    	})
	    	
	    	$("#content").blur(function () {
	    		if ($("#content").val().trim()=="") {
	    			$("#contentErr").html("内容不能为空");
	    			$("#content").css({"border":"1px solid red"});
	    			return false;
	    		}
	    		$("#contentErr").html("");
	    	})
	    
	   		$(".fbbk").click(function() {
	    		if (${user == null}) {
	    			alert("请先登录！！");
	    		}else {
	    			alert("提交成功，请等待管理员审核");
	    			$("#fr").submit();
	    		}
	    	    
	    	})
	    })
    	
    </script>
</body>

</html>
