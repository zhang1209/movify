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
		<style type="text/css">
					.navbar{
						color:white;
					}
					#wl{
						display:block;
					}
					#logo{
						display:none;
					}
		</style>
		
        <!-- =============== START OF MOVIE DETAIL INTRO =============== -->
        <section class="movie-detail-intro overlay-gradient ptb100" style="background: url(${ctx}/static/assets/images/other/movie-detail-bg.jpg);">
        </section>
        <!-- =============== END OF MOVIE DETAIL INTRO =============== -->



        <!-- =============== START OF MOVIE DETAIL INTRO 2 =============== -->
        <section class="movie-detail-intro2">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">

                        <div class="movie-poster">
                            <img src="${video_details[0].get('vposter')}" alt="" style="width:300px;height:440px;">

                            <a href="${ctx}/video_play?vid=${video_details[0].get('vid')}&vtype=${video_details[0].get('vtype')}&uid=${user.uid}" class="play-video">
                                <i class="fa fa-play"></i>
                            </a>
                        </div>


                        <div class="movie-details">
                            <h3 class="title">${video_details[0].get("vname")}</h3>

                            <ul class="movie-subtext">
                            	
                            	<li><a href="#">${video_details[0].get("vdirector")}</a></li>
                                <li>${video_details[0].get("vtime")}</li>
                                <li>${video_details[0].get("cname")},${video_details[0].get("lname")}</li>
                                <li>${video_details[0].get("vdate")}(${video_details[0].get("vcountry")})</li>
                            </ul>
							<c:if test="${wlinfo == '1'}">
								<a id="watch_later" class="btn btn-main btn-effect" style="cursor: pointer;">取消收藏</a>
							</c:if>
							<c:if test="${wlinfo == '2'}"></c:if>
                        	    <a id="watch_later" class="btn btn-main btn-effect" style="cursor: pointer;">加入收藏</a>
                      		<c:if test="${vlinfo == '2'}">
                            	<a id="like_btn" class="btn btn-effect" style="cursor: pointer;background:#9352b3"><i class="icon-like" style="color:white"></i></a>
							</c:if>
							<c:if test="${vlinfo == '1'}">
								<a id="like_btn" class="btn btn-effect" style="cursor: pointer;background:#ffc741"><i class="icon-like" style="color:white"></i></a>
                            </c:if>
                            <div class="rating mt10">
                                <c:forEach begin="1" end="${video_details[0].get('vrating')/2}" step="1">
		                             <i class="fa fa-star"></i>
		                        </c:forEach>
		                                	
		                        <c:forEach begin="1" end="${(10-video_details[0].get('vrating'))/2}" step="1">
		                             <i class="fa fa-star-o"></i>
		                        </c:forEach>
                                <span><span id="like_count">${video_details[0].get("vlikecount")}</span>赞</span>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </section>
        <!-- =============== End OF MOVIE DETAIL INTRO 2 =============== -->


        <!-- =============== START OF MOVIE DETAIL MAIN SECTION =============== -->
        <section class="movie-detail-main ptb100">
            <div class="container">

                <div class="row">
                    <!-- Start of Movie Main -->
                    <div class="col-lg-8 col-sm-12">
                        <div class="inner pr50">

                            <!-- Storyline -->
                            <div class="storyline">
                                <h3 class="title">剧情概要</h3>

                                <p>${video_details[0].get("vintroduce")}</p>
                            </div>

                            <!-- Media -->
                            <div class="movie-media mt50">
                                <h3 class="title"> 精彩截图</h3>

                                <ul class="image-gallery isotope">
                                	<c:forEach items="${video_photo}" var="vp">
	                                    <li class="element">
	                                        <a href="${vp.vpname}">
	                                            <img src="${vp.vpname}" class="img-responsive" alt="" style="width:218px;height:145px;">
	                                        </a>
	                                    </li>
	                                </c:forEach>
                                </ul>

                            </div>

                        </div>
                    </div>
                    <!-- End of Movie Main -->


                    <!-- Start of Sidebar -->
                    <div class="col-lg-4 col-sm-12">
                        <div class="sidebar">

                            <!-- Start of Details Widget -->
                            <aside class="widget widget-movie-details">
                                <h3 class="title">详情介绍</h3>

                                <ul>
                                    <li><strong>上映日期: </strong>${video_details[0].get("vdate")}</li>
                                    <li><strong>导演: </strong>${video_details[0].get("vdirector")}</li>
                                    <li><strong>耗资: </strong>${video_details[0].get("vcost")} 亿美元</li>
                                    <li><strong>国家: </strong>${video_details[0].get("vcountry")}</li>
                                    <li><strong>语言: </strong>${video_details[0].get("lname")}</li>
                                    <li><strong>制片厂: </strong>${video_details[0].get("vstudio")}</li>
                                </ul>
                            </aside>
                            <!-- End of Details Widget -->

                            <!-- Start of Details Widget -->
                            <aside class="widget widget-movie-cast">
                                <h3 class="title">演员表</h3>

                                <ul class="cast-wrapper">
                                	<c:forEach items="${actor_list}" var="al">
	                                    <li>
	                                        <a href="celebrity-detail.html">
	                                            <span class="circle-img">
	                                                <img src="${al.aphoto}" alt="">
	                                            </span>
	                                            <h6 class="name">${al.aname}</h6>
	                                        </a>
	                                    </li>
	                                 </c:forEach>
                                </ul>

                                <a href="${ctx}/actor_list" class="btn btn-main btn-effect mt20">查看全部</a>

                            </aside>
                            <!-- End of Details Widget -->

                        </div>
                    </div>
                    <!-- End of Sidebar -->
                </div>

            </div>
        </section>
        <!-- =============== END OF MOVIE DETAIL MAIN SECTION =============== -->



        <!-- =============== START OF RECOMMENDED MOVIES SECTION =============== -->
        <section class="recommended-movies bg-light ptb100">
            <div class="container">

                <!-- Start of row -->
                <div class="row">
                    <div class="col-md-8 col-sm-12">
                        <h2 class="title">猜你还喜欢....</h2>
                    </div>
                </div>
                <!-- End of row -->


                <!-- Start of Latest Movies Slider -->
                <div class="owl-carousel recommended-slider mt20">
					<c:forEach items="${other_video}" var="ov">
	                    <!-- === Start of Sliding Item 1 === -->
	                    <div class="item">
	                        <!-- Start of Movie Box -->
	                        <div class="movie-box-1">
	
	                            <!-- Start of Poster -->
	                            <div class="poster">
	                                <img src="${ov.vposter}" alt="" style="height:394px;">
	                            </div>
	                            <!-- End of Poster -->
	
	                            <!-- Start of Buttons -->
	                            <div class="buttons">
	                                <a href="${ctx}/video_play?vid=${ov.vid}&vtype=${ov.vtype}&uid=${user.uid}" class="play-video">
	                                    <i class="fa fa-play"></i>
	                                </a>
	                            </div>
	                            <!-- End of Buttons -->
	
	                            <!-- Start of Movie Details -->
	                            <div class="movie-details">
	                                <h4 class="movie-title">
	                                    <a href="${ctx}/video_details?vid=${ov.vid}&vtype=${ov.vtype}">${ov.vname}</a>
	                                </h4>
	                                <span class="released">${ov.vdate}</span>
	                            </div>
	                            <!-- End of Movie Details -->
	
	                            <!-- Start of Rating -->
	                            <div class="stars">
	                                <div class="rating">
	                                  <c:forEach begin="1" end="${ov.vrating/2}" step="1">
		                                	<i class="fa fa-star"></i>
		                               </c:forEach>
		                                	
		                               <c:forEach begin="1" end="${(10-ov.vrating)/2}" step="1">
		                                	<i class="fa fa-star-o"></i>
		                               </c:forEach>
	                                </div>
	                                <span>${ov.vrating} / 10</span>
	                            </div>
	                            <!-- End of Rating -->
	
	                        </div>
	                        <!-- End of Movie Box -->
	                    </div>
	                    <!-- === End of Sliding Item 1 === -->
					</c:forEach>

                </div>
                <!-- End of Latest Movies Slider -->

            </div>
        </section>
        <!-- =============== END OF RECOMMENDED MOVIES SECTION =============== -->

    </div>
    <!-- =============== END OF WRAPPER =============== -->



<%@ include file="footer.jsp" %>
<script type="text/javascript" src="${ctx}/static/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function () {
		// 稍后观看js
		$("#watch_later").click(function () {
			$.ajax({
				url:"${ctx}/watch_later",
				data:{
					"vid":"${video_details[0].get('vid')}",
					"uid":"${user.uid}"
				},
				success:function(result) {
					if (result=="1") {
						alert("还没有登录哦！！")
					} else if (result=="2") {
							$.ajax({
								url:"${ctx}/watch_later_close",
								data:{
									vid:"${video_details[0].get('vid')}",
									uid:"${user.uid}"
								},
								success:function(result) {
									$("#watch_later").html("加入收藏");
								}
							})	
					} else {
						$("#watch_later").html("取消收藏");
					}
				}
			});
			
		});
		
		
		
	
		// 点赞js控制
		$("#like_btn").click(function () {
			var like_count=0;
			if (${user == null || user == ""}) {
				alert("还没登录哦！！");
			} 
			$.ajax({
				url:"${ctx}/video_like",
				data:{
					"uid":"${user.uid}",
					"vid":"${video_details[0].get('vid')}"
				},
				success:function (result) {
					if (result == "2") {	
							$.ajax({
								url:"${ctx}/close_like",
								data:{
									"uid":"${user.uid}",
									"vid":"${video_details[0].get('vid')}"
								},
								success:function (result) {
									$("#like_btn").css("background","#9352b3");
									like_count = Number($("#like_count").html())-1;
									$("#like_count").html(like_count);
								}
							})	
					} else if (result=="1") {
						$("#like_btn").css("background","#ffc741");
						like_count = Number($("#like_count").html())+1;
						$("#like_count").html(like_count);
					}
					
				}
			})
			
		})
				
	});
		
</script>
</body>

</html>
