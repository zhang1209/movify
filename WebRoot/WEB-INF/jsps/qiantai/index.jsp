<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>

<html lang="en">
<head>
</head>

<body>
	
    <!-- =============== 包装 开始 =============== -->
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
        
        <!-- =============== 顶部轮播 开始 =============== -->
        <section id="slider" class="full-slider">
            <div class="rev-slider-wrapper fullscreen-container overlay-gradient">
                <div id="fullscreen-slider" class="rev_slider fullscreenbanner" style="display:none" data-version="5.4.1">
                    <ul>

                        <!-- ===== 轮播图1 ===== -->
                        <li data-transition="fade">
                            <!-- 图片 -->
                            <img src="${ctx}/static/assets/images/slider/slider1.jpg"
                                 alt="Image"
                                 title="slider-bg"
                                 data-bgposition="center center"
                                 data-bgfit="cover"
                                 data-bgrepeat="no-repeat"
                                 data-bgparallax="10"
                                 class="rev-slidebg"
                                 data-no-retina="">
                            <!-- 文字 -->
                            <div class="tp-caption tp-resizeme"
                                 data-x="center"
                                 data-hoffset=""
                                 data-y="middle"
                                 data-voffset="['-30','-30','-30','-30']"
                                 data-responsive_offset="on"
                                 data-fontsize="['60','50','40','30']"
                                 data-lineheight="['60','50','40','30']"
                                 data-whitespace="nowrap"
                                 data-frames='[{"delay":1000,"speed":2000,"frame":"0","from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","to":"o:1;","ease":"Power2.easeInOut"},{"delay":"wait","speed":500,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                                 style="z-index: 5; color: #fff; font-weight: 900;">即刻开始观影
                            </div>
                        </li>

                        <!-- ===== 轮播图2 ===== -->
                        <li data-transition="fade"
                            data-slotamount="7"
                            data-easein="default"
                            data-easeout="default"
                            data-masterspeed="2000">
                            <!-- 图片 -->
                            <img src="${ctx}/static/assets/images/slider/slider2.jpg"
                                 alt="Image"
                                 title="slider-bg"
                                 data-bgposition="center top"
                                 data-bgfit="cover"
                                 data-bgrepeat="no-repeat"
                                 data-bgparallax="10"
                                 class="rev-slidebg"
                                 data-no-retina="">
                            <!-- 文字 -->
                            <div class="tp-caption tp-resizeme"
                                 data-x="center"
                                 data-hoffset=""
                                 data-y="middle"
                                 data-voffset="['-30','-30','-30','-30']"
                                 data-responsive_offset="on"
                                 data-fontsize="['60','50','40','30']"
                                 data-lineheight="['60','50','40','30']"
                                 data-whitespace="nowrap"
                                 data-frames='[{"delay":1000,"speed":2000,"frame":"0","from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","to":"o:1;","ease":"Power2.easeInOut"},{"delay":"wait","speed":500,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                                 style="z-index: 5; color: #fff; font-weight: 900;">超越极限的高清体验
                            </div>
                        </li>

                        <!-- ===== 轮播图3 ===== -->
                        <li data-transition="fade"
                            data-slotamount="7"
                            data-easein="default"
                            data-easeout="default"
                            data-masterspeed="2000">
                            <!-- 图片 -->
                            <img src="${ctx}/static/assets/images/slider/slider3.jpg"
                                 alt="Image"
                                 data-bgposition="center top"
                                 data-bgfit="cover"
                                 data-bgrepeat="no-repeat"
                                 data-bgparallax="3"
                                 class="rev-slidebg"
                                 data-no-retina>
                            <!-- 文字 -->
                            <div class="tp-caption tp-resizeme"
                                 data-x="center"
                                 data-hoffset=""
                                 data-y="middle"
                                 data-voffset="['-30','-30','-30','-30']"
                                 data-responsive_offset="on"
                                 data-fontsize="['60','50','40','30']"
                                 data-lineheight="['60','50','40','30']"
                                 data-whitespace="nowrap"
                                 data-frames='[{"delay":1000,"speed":2000,"frame":"0","from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","to":"o:1;","ease":"Power2.easeInOut"},{"delay":"wait","speed":500,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                                 style="z-index: 5; color: #fff; font-weight: 900;">最新的 电影 & 连续剧
                            </div>
                        </li>

                    </ul>
                </div>
            </div>
            <!-- ===== 顶部轮播 结束 ===== -->


            <!-- ===== 搜索模块 开始 ===== -->
            <div class="search-form-wrapper search-form-rev">
                <div class="container">

                    <!-- ===== 搜索表单 开始 ===== -->
                    <form id="search-form-1" action="${ctx}/video_list" method="post">
                        <div class="row justify-content-center">
                            <div class="col-md-8 col-sm-10 col-12">
                                <div class="form-group">
                                    <input name="key" type="text" id="search-keyword" value="" class="form-control" placeholder="请输入电影 & 连续剧的关键字">
                                    <button type="submit" class="btn btn-main btn-effect"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!-- ===== 搜索表单 结束 ===== -->

                </div>
            </div>
            <!-- ===== 搜索模块 结束 ===== -->
        </section>




        <!-- =============== 最新视频板块 开始 =============== -->
        <section class="latest-movies ptb100" id="newvideo">
            <div class="container">

                <!-- 模块顶部 开始-->
                <div class="row">
                    <div class="col-md-8">
                        <h2 class="title">最新影视</h2>
                    </div>


                    <div class="col-md-4 align-self-center text-right">
                        <a href="${ctx}/video_list" class="btn btn-icon btn-main btn-effect">
                          	  查看全部
                            <i class="ti-angle-double-right"></i>
                        </a>
                    </div>
                </div>
                <!-- 模块顶部 结束 -->


                <!-- 影视产品模块 开始 -->
                <div class="owl-carousel latest-movies-slider mt20">
                
				<c:forEach items="${newVideo}" var="nv">
                    <!-- === 影视产品1 开始=== -->
                    <div class="item">
                        <!-- 视频box 开始 -->
                        <div class="movie-box-1">

                            <!-- 海报 开始 -->
                            <div class="poster">
                                <img src="${nv.vposter}" alt="" style="height:394px">
                            </div>
                            <!-- 海报结束 -->

                            <!-- 按钮 开始 -->
                            <div class="buttons">
                                <a href="${ctx}/video_play?vid=${nv.vid}&vtype=${nv.vtype}&uid=${user.uid}" class="play-video" >
                                    <i class="fa fa-play"></i>
                                </a>
                            </div>
                            <!-- 按钮 结束 -->

                            <!-- 视频细节 开始 -->
                            <div class="movie-details">
                                <h4 class="movie-title">
                                    <a href="${ctx}/video_details?vid=${nv.vid}&vtype=${nv.vtype}">${nv.vname}</a>
                                </h4>
                                <span class="released">${nv.vdate}</span>
                            </div>
                            <!-- 视频细节 结束 -->

                            <!-- 视频评分 开始 -->
                            <div class="stars">
                                <div class="rating">
                                
								<c:forEach begin="1" end="${nv.vrating/2}" step="1">
                                	<i class="fa fa-star"></i>
                                </c:forEach>
                                <c:forEach begin="1" end="${(10-nv.vrating)/2}" step="1">
                                	<i class="fa fa-star-o"></i>
                                </c:forEach>
                                
                                </div>
                                <span>${nv.vrating} / 10</span>
                            </div>
                            <!-- 视频评分 结束 -->

                        </div>
                        <!-- 视频盒子 结束 -->
                    </div>
                    <!-- === 影视产品产品1 结束 === -->
				</c:forEach>
                   
			
                </div>
                <!-- 影视产品 结束 -->
            </div>
        </section>
        <!-- =============== 最新视频板块 结束 =============== -->




        <!-- =============== 用户原创 开始 =============== -->
        <section id="vlog" class="upcoming-movies parallax ptb100" data-background="${ctx}/static/assets/images/posters/movie-collection.jpg" data-color="#3e4555" data-color-opacity="0.95" >
            <div class="container">

                <!-- 行1 开始 -->
                <div class="row justify-content-center">
                    <div class="col-md-7 text-center">
                        <h2 class="title text-white">最新用户原创vlog & 短片</h2>
                    </div>
                </div>
                <!-- 行1 结束 -->


                <!-- 行2 开始 -->
                <div class="row mt50">

                    <!-- === 用户原创视频模块 开始 === -->
                    <div class="col-md-8">

                        <!-- 左边 开始 -->
                        <div class="movie-box-1 upcoming-featured-item" style="height:450px;">

                            <!-- 封面 开始 -->
                            <div class="poster">
                                <img src="${newUserVideo[0].get('vposter')}" alt="">
                            </div>
                            <!-- 封面 结束 -->

                            <!-- 按钮开始 -->
                            <div class="buttons">
                                <a href="${ctx}/video_play?vid=${newUserVideo[0].get('vid')}&vtype=${newUserVideo[0].get('vtype')}&uid=${user.uid}" 
                                   class="play-video">
                                    <i class="fa fa-play"></i>
                                </a>
                            </div>
                            <!-- 按钮结束 -->

                            <!-- 视频细节 开始 -->
                            <div class="movie-details">
                                <h4 class="movie-title">
                                    <a href="${ctx}/video_details?vid=${newUserVideo[0].get('vid')}&vtype=${newUserVideo[0].get('vtype')}">${newUserVideo[0].get('vname')}</a>
                                </h4>
                                <span class="released">${newUserVideo[0].get('vdate')}</span>
                            </div>
                            <!-- 视频细节 结束 -->
                        </div>
                        <!-- 左边 结束  -->

                    </div>


                    <!-- === 右边 开始 === -->
                    <div class="col-md-4">

                        <!-- 产品1 开始 -->
                        <div class="movie-box-1 upcoming-item">

                            <!-- 封面 开始-->
                            <div class="poster">
                                <img src="${newUserVideo[1].get('vposter')}" alt="" style="height:215px;">
                            </div>
                            <!-- 封面 结束-->

                            <!-- 按钮开始 -->
                            <div class="buttons">
                                <a href="${ctx}/video_play?vid=${newUserVideo[1].get('vid')}&vtype=${newUserVideo[2].get('vtype')}&uid=${user.uid}" class="play-video">
                                    <i class="fa fa-play"></i>
                                </a>
                            </div>
                            <!-- 按钮结束-->

                            <!-- 细节开始 -->
                            <div class="movie-details">
                                <h4 class="movie-title">
                                    <a href="${ctx}/video_details?vid=${newUserVideo[1].get('vid')}&vtype=${newUserVideo[1].get('vtype')}">${newUserVideo[1].get('vname')}</a>
                                </h4>
                            </div>
                            <!-- 细节结束 -->

                        </div>
                        <!-- 产品1 结束 -->

                        <!-- 产品2 开始 -->
                        <div class="movie-box-1 upcoming-item mt20">

                            <!-- 封面 开始 -->
                            <div class="poster">
                                <img src="${newUserVideo[2].get('vposter')}" alt="" style="height:215px;">
                            </div>
                            <!-- 封面结束 -->

                            <!-- 按钮开始 -->
                            <div class="buttons">
                                <a href="${ctx}/video_play?vid=${newUserVideo[2].get('vid')}&vtype=${newUserVideo[2].get('vtype')}&uid=${user.uid}" class="play-video">
                                    <i class="fa fa-play"></i>
                                </a>
                            </div>
                            <!-- 按钮结束 -->

                            <!-- 视频细节 开始 -->
                            <div class="movie-details">
                                <h4 class="movie-title">
                                    <a href="${ctx}/video_details?vid=${newUserVideo[2].get('vid')}&vtype=${newUserVideo[2].get('vtype')}&uid='${user.uid}'">${newUserVideo[2].get('vname')}</a>
                                </h4>
                            </div>
                            <!-- 视频细节结束 -->

                        </div>
                        <!-- 产品2 结束 -->

                    </div>
                    <!-- === 右边 结束 === -->

                </div>
                <!-- 行2 结束 -->

            </div>
        </section>
        <!-- =============== 用户原创视频 结束 =============== -->




        <!-- =============== 热门影视模块 开始 =============== -->
        <section class="latest-tvshows ptb100" id="hotvideo">
            <div class="container">

                <!-- 一行开始 -->
                <div class="row">
                    <div class="col-md-8 col-sm-12">
                        <h2 class="title">热门影视</h2>
                    </div>


                    <div class="col-md-4 col-sm-12 align-self-center text-right">
                        <a href="${ctx}/video_list" class="btn btn-icon btn-main btn-effect">
                           		查看全部
                            <i class="ti-angle-double-right"></i>
                        </a>
                    </div>
                </div>
                <!-- 一行结束 -->


                <!-- 开始产品模块 -->
                <div class="owl-carousel latest-tvshows-slider mt20">
					<c:forEach items="${hotVideo}" var="hv">
	                    <!-- === 产品开始 === -->
	                    <div class="item">
	                        <!-- 产品盒子开始 -->
	                        <div class="movie-box-1">
	
	                            <!-- 封面 开始 -->
	                            <div class="poster">
	                                <img src="${hv.vposter}" alt="" style="height:394px">
	                            </div>
	                            <!-- 封面结束 -->
	
	                            <!-- 按钮开始  -->
	                            <div class="buttons">
	                                <a href="${ctx}/video_play?vid=${hv.vid}&vtype=${hv.vtype}&uid=${user.uid}" class="play-video">
	                                    <i class="fa fa-play"></i>
	                                </a>
	                            </div>
	                            <!-- 按钮结束 -->
	
	                            <!-- 视频细节开始 -->
	                            <div class="movie-details">
	                                <h4 class="movie-title">
	                                    <a href="${ctx}/video_details?vid=${hv.vid}&vtype=${hv.vtype}">${hv.vname}</a>
	                                </h4>
	                                <span class="released">${hv.vdate}</span>
	                            </div>
	                            <!-- 视频细节结束 -->
	
	                            <!-- 视频星级 开始-->
	                            <div class="stars">
	                                <div class="rating">
	                                    <c:forEach begin="1" end="${hv.vrating/2}" step="1">
                                			<i class="fa fa-star"></i>
                                		</c:forEach>
                                		<c:forEach begin="1" end="${(10-hv.vrating)/2}" step="1">
                                			<i class="fa fa-star-o"></i>
                                		</c:forEach>
	                                </div>
	                                <span>${hv.vrating} / 10</span>
	                            </div>
	                            <!-- 视频星级 结束 -->
	
	                        </div>
	                        <!--视频盒子 结束 -->
	                    </div>
	                    <!-- === 产品结束 === -->
					</c:forEach>
                </div>
                <!-- End of Latest Movies Slider -->

            </div>
        </section>
        <!-- =============== 热们影视模块 结束 =============== -->




        <!-- =============== '它是如何工作的模块 开始' =============== -->
        <section class="how-it-works bg-light ptb100" id="work">
            <div class="container">

                <!-- 一行开始 -->
                <div class="row justify-content-center">
                    <div class="col-md-7 text-center">
                        <h2 class="title">它是如何工作的？</h2>
                        <h6 class="subtitle">我们将一步一步告诉你如何开始看你最喜欢的电影和电视节目，从现在开始!</h6>
                    </div>
                </div>
                <!-- 一行结束 -->


                <!-- 时间轴开始 -->
                <div class="timeline">

                    <span class="main-line"></span>

                    <!-- === 第一步 === -->
                    <div class="timeline-step row">
                        <span class="timeline-step-btn">第一步</span>

                        <!-- 开始时间轴文本 -->
                        <div class="col-md-6 col-sm-12 timeline-text-wrapper">
                            <div class="timeline-text">
                                <h3>创建你的账户</h3>
                                <p>
                                	创建账户创建账户创建账户创建账户创建账户创建账户
                                	创建账户创建账户创建账户创建账户创建账户创建账户
                                	创建账户创建账户创建账户创建账户创建账户创建账户
                                	创建账户创建账户创建账户创建账户创建账户创建账户
                                	创建账户创建账户创建账户创建账户创建账户创建账户
                                </p>
                            </div>
                        </div>
                        <!-- 结束时间轴文本 -->

                        <!-- 开始时间轴图片 -->
                        <div class="col-md-6 col-sm-12 timeline-image-wrapper">
                            <div class="timeline-image">
                                <img src="${ctx}/static/assets/images/other/signup.png" alt="">
                            </div>
                        </div>
                        <!-- 结束时间轴图片 -->

                    </div>
                    <!-- === 第一布结束 === -->


                    <!-- === Start of Timeline Step 2 === -->
                    <div class="timeline-step row">
                        <span class="timeline-step-btn" style="color: #2a7bc2; background: #c1ddf5;">第二步</span>

                        <!-- Start of Timeline Image -->
                        <div class="col-md-6 col-sm-12 timeline-image-wrapper">
                            <div class="timeline-image">
                                <img src="${ctx}/static/assets/images/other/pricing.png" alt="">
                            </div>
                        </div>
                        <!-- End of Timeline Image -->

                        <!-- Start of Timeline Text -->
                        <div class="col-md-6 col-sm-12 timeline-text-wrapper">
                            <div class="timeline-text-right">
                                <h3>选择性的开通会员</h3>
                                <p>
                                	我求求你开通个会员吧我求求你开通个会员吧
                                	我求求你开通个会员吧我求求你开通个会员吧
                                	我求求你开通个会员吧我求求你开通个会员吧
                                	我求求你开通个会员吧我求求你开通个会员吧
                                	我求求你开通个会员吧我求求你开通个会员吧
                                </p>
                            </div>
                        </div>
                        <!-- End of Timeline Text -->

                    </div>
                    <!-- === End of Timeline Step 2 === -->


                    <!-- === Start of Timeline Step 3 === -->
                    <div class="timeline-step row">
                        <span class="timeline-step-btn" style="color: #eb305f; background: #f9c8d4;">第三步</span>

                        <!-- Start of Timeline Text -->
                        <div class="col-md-6 col-sm-12 timeline-text-wrapper">
                            <div class="timeline-text">
                                <h3>享受 movify</h3>
                                <p>
                                	好了，您可以尽情享用movify了好了，您可以尽情享用movify了
                                	好了，您可以尽情享用movify了好了，您可以尽情享用movify了
                                	好了，您可以尽情享用movify了好了，您可以尽情享用movify了
                                	好了，您可以尽情享用movify了好了，您可以尽情享用movify了
                                </p>
                            </div>
                        </div>
                        <!-- End of Timeline Text -->

                        <!-- Start of Timeline Image -->
                        <div class="col-md-6 col-sm-12 timeline-image-wrapper">
                            <div class="timeline-image">
                                <img src="${ctx}/static/assets/images/other/enjoy-movify.png" alt="">
                            </div>
                        </div>
                        <!-- End of Timeline Image -->

                    </div>
                    <!-- === End of Timeline Step 3 === -->

                </div>
                <!-- End of Timeline -->

            </div>
        </section>
        <!-- =============== '他是如何工作的'模块 结束 =============== -->




        <!-- =============== END OF COUNTER SECTION =============== -->
        <section class="counter bg-main-gradient ptb50 text-center">
            <div class="container">
                <div class="row">

                    <!-- 1st Count up item -->
                    <div class="col-md-4 col-sm-12">
                        <span class="counter-item" data-from="0" data-to="${dataCount[0].get('count')}">0</span>
                        <h4>视频</h4>
                    </div>

                    <!-- 2nd Count up item -->
                    <div class="col-md-4 col-sm-12">
                        <span class="counter-item" data-from="0" data-to="${dataCount[1].get('count')}">0</span>
                        <h4>博客</h4>
                    </div>

                    <!-- 3rd Count up item -->
                    <div class="col-md-4 col-sm-12">
                        <span class="counter-item" data-from="0" data-to="${dataCount[2].get('count')}">0</span>
                        <h4>用户</h4>
                    </div>
                </div>
            </div>
        </section>
        <!-- =============== END OF COUNTER SECTION =============== -->




        <!-- =============== END OF BECOME PREMIUM SECTION =============== -->
        <section class="become-premium ptb100" id="vip2">
            <div class="container">
                <div class="row">


                    <div class="col-md-5 col-sm-12 mb50">
                        <h3 class="title">成为高级用户</h3>
                        <h6 class="subtitle">
                        	高级会员好，高级会员秒，高级会员呱呱叫
                        	高级会员好，高级会员秒，高级会员呱呱叫
                        	高级会员好，高级会员秒，高级会员呱呱叫
                        	高级会员好，高级会员秒，高级会员呱呱叫
                        	高级会员好，高级会员秒，高级会员呱呱叫
                        </h6>
                    </div>


                    <div class="col-md-7 col-sm-12">

                        <!-- Start of Pricing Table -->
                        <div class="pricing-table-1">

                            <!-- ===== Start of Featured Holder ===== -->
                            <div class="features-holder">
                                <div class="features-title">
                                    <h5>你享有的</h5>
                                </div>

                                <!-- Start of Features List -->
                                <div class="features-list-wrapper">
                                    <ul class="features-list">

                                        <!-- List Item -->
                                        <li>
                                            <h6>高清电影</h6>
                                        </li>

                                        <!-- List Item -->
                                        <li>
                                            <h6>高清连续剧</h6>
                                        </li>

                                        <!-- List Item -->
                                        <li>
                                            <h6>用户原创</h6>
                                        </li>

                                        <!-- List Item -->
                                        <li>
                                            <h6>发布视频</h6>
                                        </li>

                                        <!-- List Item -->
                                        <li>
                                            <h6>个人主页</h6>
                                        </li>

                                        <!-- List Item -->
                                        <li>
                                            <h6>每日发布视频上限</h6>
                                        </li>

                                    </ul>
                                </div>
                                <!-- Start of Features List -->

                            </div>
                            <!-- ===== End of Featured Holder ===== -->


                            <!-- ===== Start of Price Table Featured ===== -->
                            <div class="price-table price-table-featured">

                                <!-- Start of Table Header -->
                                <div class="table-header">
                                    <h5>高级用户</h5>
                                </div>
                                <!-- End of Table Header -->

                                <!-- Start Table Content -->
                                <div class="table-content">
                                    <ul>
                                        <li><i class="fa fa-check"></i></li>
                                        <li><i class="fa fa-check"></i></li>
                                        <li><i class="fa fa-check"></i></li>
                                        <li><i class="fa fa-check"></i></li>
                                        <li><i class="fa fa-check"></i></li>
                                        <li>∞</li>
                                    </ul>
                                </div>
                                <!-- End Table Content -->

                                <!-- Start Table Footer -->
                                <div class="table-footer">
                                    <div class="price-holder">
                                        <span class="currency">￥</span>
                                        <span class="price">199.99</span>
                                        <span class="time">/ 永久</span>
                                    </div>
                                    <a id="buy" style="cursor:pointer;color:white" target="_self" class="btn btn-main btn-effect"><i class="fa fa-shopping-cart"></i></a>
                                </div>
                                <!-- End Table Footer -->

                            </div>
                            <!-- ===== End of Price Table Featured ===== -->


                            <!-- ===== Start of Price Table ===== -->
                            <div class="price-table">

                                <!-- Start of Table Header -->
                                <div class="table-header">
                                    <h5>普通用户</h5>
                                </div>
                                <!-- End of Table Header -->

                                <!-- Start Table Content -->
                                <div class="table-content">
                                    <ul>
                                        <li><i class="fa fa-times"></i></li>
                                        <li><i class="fa fa-times"></i></li>
                                        <li><i class="fa fa-check"></i></li>
                                        <li><i class="fa fa-check"></i></li>
                                        <li><i class="fa fa-check"></i></li>
                                        <li>1</li>
                                    </ul>
                                </div>
                                <!-- End Table Content -->

                                <!-- Start Table Footer -->
                                <div class="table-footer">
                                    <div class="price-holder">
                                        <span class="currency">免费</span>
                                    </div>
                                </div>
                                <!-- End Table Footer -->
				



								
                            </div>
                            <!-- ===== End of Price Table ===== -->

                        </div>
                        <!-- End of Pricing Table -->

                    </div>

                </div>
            </div>
        </section>
        <!-- =============== END OF BECOME PREMIUM SECTION =============== -->




        <!-- =============== END OF BLOG SECTION =============== -->
        <section class="blog bg-light ptb100" id="newblog">
            <div class="container">

                <!-- Start of row -->
                <div class="row justify-content-center">
                    <div class="col-md-7 text-center">
                        <h2 class="title">最新博客</h2>
                        <h6 class="subtitle">
                        	世界之大无奇不有，最新的人文，最美的风景，最优雅的文字！
                        </h6>
                    </div>
                </div>
                <!-- End of row -->


                <!-- Start of row -->
                <div class="row mt50">

                  <c:forEach items="${newBlog}" var="nb">
                   	<div class="col-md-4">
                        <div class="bloglist-post-holder shadow-hover">

                            <!-- Blog Post Thumbnail -->
                            <a href="${ctx}/blog_details?bid=${nb.bid}" class="bloglist-thumb-link hover-link">
                                <div class="bloglist-post-thumbnail" style="background: url(${nb.bposter})"></div>
                            </a>

                            <!-- Blog Post Text Wrapper -->
                            <div class="bloglist-text-wrapper">
                                <!-- Author Avatar -->
                                <span class="circle-img bloglist-avatar">
                                    <img src="${nb.uphoto}" width="50" height="50" alt="author img">
                                </span>

                                <h4 class="bloglist-title">
                                    <a href="${ctx}/blog_details?bid=${nb.bid}">${nb.btitle}</a>
                                </h4>

                                <div class="bloglist-meta">
                                    <i class="fa fa-calendar"></i> ${nb.bdate}
                                </div>

                                <div class="bloglist-excerpt" style="height:260px;">
                                    <p>${nb.bintroduce}</p> 
                                </div>
                                 <a href="${ctx}/blog_details?bid=${nb.bid}" class="btn btn-main btn-effect">查看更多</a>
                            </div>
                        </div>
                    </div>
                  </c:forEach>
                    

                </div>
                <!-- End of row -->

            </div>
        </section>
        <!-- =============== END OF BLOG SECTION =============== -->
        <!--  -->
		<%@ include file="footer.jsp"%>
				
				
<div class="modal fade" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">
		  	<div class="modal-header">
		  		<h4 class="modal-title">开通会员</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				
		  	</div>
		  	
		  	<div class="modal-body">
				支付199￥
		  	</div>
		  	
		  	<div class="modal-footer">
		  		<button type="button" class="btn btn-primary" id="qrzf">确认支付</button>
		  		<button type="button" class="btn btn-default" data-dismiss="modal" id="qxzf">取消支付</button>
				
			</div>
		</div>
	</div>
</div>		
		
<script type="text/javascript">
 		$(function () {
 			$("#buy").click(function() {
 				if (${user == null}) {
 					alert("请先登录");
 				} else {
 					$("#myModal").modal();
 				}
 			})
 			
 			$("#qxzf").click(function () {
 				$("#myModal").modal("hide");
 			})
 			
 			$("#qrzf").click(function () {

 				$.ajax({
 					url:"${ctx}/queren_zhifu?uid=${user.uid}",
 					success:function(result) {
 						alert("支付成功，恭喜您开通会员");
 						$("#myModal").modal("hide");
 						$("#backtop").trigger("click");
 					}
 				})
 			})
 		})
 			
	</script>
</body>

</html>
