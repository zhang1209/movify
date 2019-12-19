<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>

<html lang="en">

<head>
    
</head>

<body>

    <!-- =============== START OF WRAPPER =============== -->
    <div class="wrapper">
	<%@ include file="header.jsp" %>
	


        <!-- =============== START OF PAGE HEADER =============== -->
        <section class="page-header overlay-gradient" style="background: url(${ctx}/static/assets/images/posters/movie-collection.jpg);
        margin-top:65px;">
            <div class="container">
                <div class="inner">
                    <h2 class="title">演员列表</h2>
                    <ol class="breadcrumb">
                        <li><a href="${ctx}/indexShow">Home</a></li>
                        <li>Celebrities List</li>
                    </ol>
                </div>
            </div>
        </section>
        <!-- =============== END OF PAGE HEADER =============== -->



        <!-- =============== START OF MAIN =============== -->
        <main class="ptb100">
            <div class="container">

                <!-- Start of Filters -->
                <div class="row mb50">

                    <div class="col-md-6">
                        <!-- Layout Switcher -->
                        <div class="layout-switcher">
                            <a class="list active" id="video_list" style="cursor: pointer;"><i class="fa fa-align-justify"></i></a>
                         	<a class="grid" id="video_list_grid" style="cursor: pointer;"><i class="fa fa-th"></i></a>
                        </div>
                    </div>
                </div>
                <!-- End of Filters -->



                <!-- Start of Celebrities List -->
                <div class="row" id="row1" style="display:black">
					<c:forEach items="${actor_list}" var="al">
	                    <!-- Celebrity List Item -->
	                    <div class="col-md-12 col-sm-12">
	                        <div class="celebrity-list-1">
	                            <div class="celeb-container">
	
	                                <!-- Celebrity Image -->
	                                <div class="celebrity-image">
	                                    <a href="${ctx}/actor_details?aid=${al.aid}">
	                                        <img src="${al.aphoto}" alt="">
	                                    </a>
	                                </div>
	
	                                <!-- Celebrity Content -->
	                                <div class="celebrity-content">
	                                    <div class="inner">
	                                        <h3 class="title"><a href="${ctx}/actor_details?aid=${al.aid}">${al.aname}</a></h3>
	                                        <p>${al.aintroduce}</p>
	                                    </div>
	                                </div>
	
	                            </div>
	                        </div>
	                    </div>
					</c:forEach>
                </div>
                
				<div class="row" id="row2" style="display:none;overflow:auto;">
					<c:forEach items="${actor_list}" var="al2">
	                    <!-- Celebrity Grid Item -->
	                    <div class="col-lg-4 col-md-6 col-sm-12" style="float:left">
	                        <div class="celebrity-grid-1">
	                            <div class="celeb-container">
	
	                                <!-- Celebrity Image -->
	                                <div class="celebrity-image">
	                                    <a href="${ctx}/actor_details?aid=${al2.aid}">
	                                        <img src="${al2.aphoto}" alt="">
	                                    </a>
	                                </div>
	
	                                <!-- Celebrity Content -->
	                                <div class="celebrity-content">
	                                    <div class="inner">
	                                        <h3 class="title"><a href="${ctx}/actor_details?aid=${al2.aid}">${al2.aname}</a></h3>
	
	                                        <p style="height:360px;">${al2.aintroduce}</p>
	                                    </div>
	                                </div>
	
	                            </div>
	                        </div>
	                    </div>
	                </c:forEach>
				</div>

                <!-- Start of Pagination -->
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <nav class="pagination">
                            <ul>
                                <li><a href="#" class="current-page">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#"><i class="ti-angle-right"></i></a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <!-- End of Pagination -->

            </div>
        </main>
        <!-- =============== END OF MAIN =============== -->



    </div>
    <!-- =============== END OF WRAPPER =============== -->
<%@ include file="footer.jsp" %>
<script type="text/javascript" src="${ctx}/static/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function () {
		$("#video_list").click(function () {
        			$("#row1").css("display","block");
        			$("#row2").css("display","none");
        			$("#video_list").css({"color":"white","background":"#9352b3"});
        			$("#video_list_grid").css({"color":"black","background":"#edf5f7"});
        		})
        		
        		$("#video_list_grid").click(function () {
        			$("#row1").css("display","none");
        			$("#row2").css("display","block");
        			$("#video_list_grid").css({"color":"white","background":"#9352b3"});
        			$("#video_list").css({"color":"black","background":"#edf5f7"});
        		})
        		
        		$("#tijiao").click(function () {
        			$("#fr").submit();
        		})
	})
</script>
</body>

</html>
