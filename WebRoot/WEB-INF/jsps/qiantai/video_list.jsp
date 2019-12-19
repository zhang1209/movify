<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
        margin-top:65px;
        ">
            <div class="container">
                <div class="inner">
                    <h2 class="title">视频列表</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">主页</a></li>
                        <li>视频列表</li>
                    </ol>
                </div>
            </div>
        </section>
        <!-- =============== END OF PAGE HEADER =============== -->



        <!-- =============== START OF MAIN =============== -->
        <main class="ptb100">
            <div class="container">

                <!-- Start of Filters -->
                <div class="row mb100">

                    <div class="col-md-6">
                        <!-- Layout Switcher -->
                        <div class="layout-switcher">
                         <a class="list active" id="video_list" style="cursor: pointer;"><i class="fa fa-align-justify"></i></a>
                         <a class="grid" id="video_list_grid" style="cursor: pointer;"><i class="fa fa-th"></i></a>
                        </div>
                    </div>

                    <div class="col-md-6">

                        <!-- Sort by -->
                        <div class="sort-by">
                            <div class="sort-by-select">
                            <form action="${ctx}/video_list" method="post" id="fr">
                                <select class="chosen-select-no-single" id="video_type" name="video_type">
                                   <option value="-1">---请选择---</option>
                                   <option value="0">查看全部</option>
                                   <option value="1" ${typeid==1?"selected='selected'":""}>高清电影</option>
                                   <option value="2" ${typeid==2?"selected='selected'":""}>高清连续剧</option>
                                   <option value="3" ${typeid==3?"selected='selected'":""}>用户原创&vlog</option>
                                </select>
                             </form>
                            </div>
                        </div>
                        <!-- Sort by / End -->

                    </div>

                </div>
                <!-- End of Filters -->

				<c:if test="${empty video_list}">
					<p>并未搜索到与 "${key}" 相关的内容</p>
					<p
						style="font-size:30px;color:#9352B3;font-family:'楷体'"
					>经魏世昌同学提点<img src="upload/滑稽.jpg" style="width:40px;height:40px;border-radius:100px;"/>，如果视频没查到要提醒一下  感谢！<i class=" fa fa-handshake-o"></i>
					</p><br/></br>
				</c:if>
				
                <!-- Start of Movie List -->
                <div class="row" id="row1" style="display:block">
					<c:forEach items="${video_list}" var="vl">
	                    <!-- Movie List Item -->
	                    <div class="col-md-12 col-sm-12">
                        <div class="movie-list-2">
                            <div class="listing-container">

                                <!-- Movie List Image -->
                                <div class="listing-image">

                                    <!-- Image -->
                                    <div class="img-wrapper">

                                        <!-- Play Button -->
                                        <div class="play-btn">
                                            <a href="${ctx}/video_play?vid=${vl.vid}&vtype=${vl.vtype}$uid=${user.uid}" class="play-video">
                                                <i class="fa fa-play"></i>
                                            </a>
                                        </div>

                                        <img src="${vl.vposter}" alt="">
                                    </div>
                                </div>

                                <!-- Movie List Content -->
                                <div class="listing-content">
                                    <div class="inner">
                                        <h2 class="title">${vl.vname}</h2>

                                        <p>${vl.vintroduce}</p>

                                        <a href="${ctx}/video_details?vid=${vl.vid}&vtype=${vl.vtype}" class="btn btn-main btn-effect">视频详情</a>
                                    </div>


                                    <!-- Buttons -->
                                    <div class="buttons">
                                        <a href="#" data-original-title="Share" data-toggle="tooltip" data-placement="bottom">
                                            <i class="icon-share"></i>
                                        </a>
                                    </div>

                                    <!-- Rating -->
                                    <div class="stars">
                                         <div class="rating">
                                
											<c:forEach begin="1" end="${vl.vrating/2}" step="1">
		                                		<i class="fa fa-star"></i>
		                                	</c:forEach>
		                                	
		                                	<c:forEach begin="1" end="${(10-vl.vrating)/2}" step="1">
		                                		<i class="fa fa-star-o"></i>
		                                	</c:forEach>
		                                
		                                </div>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
					</c:forEach>
                </div>
                <!-- End of Movie List -->
				<!-- Start of Movie List -->
                <div class="row" id="row2" style="display:none;overflow:auto">
					<c:forEach items="${video_list}" var="vl2">
	                    <!-- Movie List Item -->
	                    <div class="col-lg-4 col-md-6 col-sm-12" style="float:left">
	                        <div class="movie-box-3 mb30">
	                            <div class="listing-container" style="overflow:auto">
	
	                                <!-- Movie List Image -->
	                                <div class="listing-image" style="height:580px;">
	                                    <!-- Image -->
	                                    <img src="${vl2.vposter}" alt="" style="height:580px;">
	                                </div>
	
	                                <!-- Movie List Content -->
	                                <div class="listing-content" style="height:300px;">
	                                    <div class="inner">
	
	                                        <!-- Play Button -->
	                                        <div class="play-btn">
	                                            <a href="${ctx}/video_play?vid=${vl2.vid}&vtype=${vl2.vtype}$uid=${user.uid}" class="play-video">
	                                                <i class="fa fa-play"></i>
	                                            </a>
	                                        </div>
	
	                                        <h2 class="title">${vl2.vname}</h2>
	
	                                        <!-- Rating -->
	                                        <div class="stars">
	                                            <div class="rating">
                                
													<c:forEach begin="1" end="${vl2.vrating/2}" step="1">
				                                		<i class="fa fa-star"></i>
				                                	</c:forEach>
				                                	
				                                	<c:forEach begin="1" end="${(10-vl2.vrating)/2}" step="1">
				                                		<i class="fa fa-star-o"></i>
				                                	</c:forEach>
		                            
	                                                <span>${vl2.vrating}/10</span>
	                                                <span class="category">${vl2.cname}, ${vl2.lname}</span>
	                                            </div>
	                                        </div>
	
	                                        <p style="height:120px;">
	                                        	${fn:substring(vl2.vintroduce,0,110)}
	                                        		
	                                        </p>
	
	                                        <a href="${ctx}/video_details?vid=${vl2.vid}&vtype=${vl2.vtype}" class="btn btn-main btn-effect">视频详情</a>
	                                    </div>
	                                </div>
	
	                            </div>
	                        </div>
	                    </div>
					</c:forEach>
                </div>
                <!-- End of Movie List -->


                <!-- Start of Pagination -->
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <nav class="pagination">
                            <ul>
                            	<!-- 对于页码的url控制 -->
                            	<c:forEach begin="1"  end="${pageCount}" var="i">
                            	
                            		<!-- 类型不为空时 -->
                            		<c:if test="${ typeid !=null }">
                            			<li>
                            				<a href="${ctx}/video_list?video_type=${typeid}&pageNo=${i}"  ${i == pageNo?"class='current-page'":""} >
                            					${i}
                            				</a>
                            			</li>
                            		</c:if>
                            		
                            		<!-- 类型与搜索关键字为空时 -->
                            		<c:if test="${ typeid ==null && key == null}">
                                		<li>
	                                		<a href="${ctx}/video_list?pageNo=${i}"  ${i == pageNo?"class='current-page'":""} >
	                                			${i}
	                                		</a>
                                		</li>
                                	</c:if>
                                	
                                	<!-- 关键字不为空时 -->
                                	<c:if test="${ key != null }">
                                		<li>
	                                		<a href="${ctx}/video_list?key=${key}&pageNo=${i}"  ${i == pageNo?"class='current-page'":""} >
	                                			${i}
	                                		</a>
                                		</li>
                                	</c:if>
                                	
                                </c:forEach>
                                
                                <!-- 对于下一页按钮url的控制 -->
                                	<!-- 类型不为空时 -->
                                	<c:if test="${ typeid !=null }">
                            			<li>
                            				<a href="${ctx}/video_list?video_type=${typeid}&pageNo=${pageNo+1>=pageCount?pageCount:pageNo+1}">
                            					<i class="ti-angle-right"></i>
                            				</a>
                            			</li>
                            		</c:if>
                            		
                            		<!-- 类型与关键字为空时 -->
                            		<c:if test="${ typeid ==null && key == null}">
                                		<li>
                                			<a href="${ctx}/video_list?pageNo=${pageNo+1>=pageCount?pageCount:pageNo+1}">
                                				<i class="ti-angle-right"></i>
                                			</a>
                                		</li>
                                	</c:if>
                                	
                                	<!-- 关键字不为空时 -->
                                	<c:if test="${ key!=null }">
                                		<li>
                                			<a href="${ctx}/video_list?key=${key}&pageNo=${pageNo+1>=pageCount?pageCount:pageNo+1}">
                                				<i class="ti-angle-right"></i>
                                			</a>
                                		</li>
                                	</c:if>
                                
                            </ul>
                        </nav>
                    </div>
                </div>
                <!-- End of Pagination -->

            </div>
        </main>
        <!-- =============== END OF MAIN =============== -->
        <%@ include file="footer.jsp" %>
        <script type="text/javascript" src="${ctx}"></script>
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
        		
        		$("#video_type").change(function () {
        			$("#fr").submit();
        		})		
        		
        	})
        	
        	
        </script>
</body>

</html>
