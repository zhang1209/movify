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
                    <h2 class="title">博客列表</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">主页</a></li>
                        <li>博客列表</li>
                    </ol>
                </div>
            </div>
        </section>
        <!-- =============== END OF PAGE HEADER =============== -->



        <!-- =============== START OF MAIN =============== -->
        <main class="blog-page ptb100">
            <div class="container">
	
                <div class="row">
                    <!-- Start of Blog Posts -->
                    <div class="col-lg-9 col-md-8 col-sm-12">
						<c:forEach items="${blog_list}" var="bl">
	                        <!-- Start of Blog Post 1 -->
	                        <article class="blog-post">
	
	                            <!-- Image -->
	                            <div class="blog-thumb">
	                                <a href="${ctx}/blog_details?bid=${bl.bid}" class="post-img hover-link">
	                                    <img src="${bl.bposter}" alt="">
	                                </a>
	                            </div>
	
	                            <!-- Content -->
	                            <div class="post-content">
	                                <h3 class="title">
	                                    <a href="${ctx}/blog_details?bid=${bl.bid}">
	                                        ${bl.btitle}
	                                    </a>
	                                </h3>
	
	                                <ul class="post-meta">
	                                    <li>${bl.bdate}</li>
	                                    <li><a href="#">${bl.uname}</a></li>
	                                    <li><a href="#">
	                                    	<c:choose>
	                                    		<c:when test="${bl.btype == 1}">
	                                    			官方
	                                    		</c:when>
	                                    		<c:when test="${bl.btype == 2}">
	                                    			原创
	                                    		</c:when>
	                                    	</c:choose>
	                                    </a></li>
	                                </ul>
	
	                                <p>${bl.bintroduce}</p>
	
	                                <a href="blog-post-detail.html" class="read-more">
	                                    	查看详情 <i class="fa fa-angle-right"></i>
	                                </a>
	                            </div>
	
	                        </article>
	                        <!-- End of Blog Post 1 -->
						</c:forEach>
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
                    <!-- End of Blog Posts -->



                    <!-- Start of Sidebar -->
                    <div class="col-lg-3 col-md-4 col-sm-12">
                        <div class="sidebar">

                            <!-- Start of Widget -->
                            <aside class="widget">
                                <h3 class="title">搜索</h3>
                                <form action="${ctx}/blog_list_page">
                                	<input type="text" placeholder="输入博客关键字" name="blog_key">
                                	<button class="btn btn-effect"><i class="fa fa-search"></i></button>
                           		</form>
                            </aside>
                            <!-- End of Widget -->

                            <!-- Start of Widget -->
                            <aside class="widget widget-blog">
                                <h3 class="title">最新博客</h3>

                                <ul class="blog-posts-widget">
									<c:forEach items="${ new_blog}" var="nb">
	                                    <!-- Post 1 -->
	                                    <li>
	                                        <div class="blog-content">
	                                            <div class="blog-thumb">
	                                                <a href="blog-post-detail.html">
	                                                    <img src="${nb.bposter}" alt="">
	                                                </a>
	                                            </div>
	
	                                            <div class="blog-text">
	                                                <h5>
	                                                    <a href="blog-post-detail.html">
	                                                        ${nb.btitle}
	                                                    </a>
	                                                </h5>
	                                                <span>${nb.bdate}</span>
	                                            </div>
	                                        </div>
	                                    </li>
								</c:forEach>

                                </ul>

                            </aside>
                            <!-- End of Widget -->

                            <!-- Start of Widget -->
                            <aside class="widget">
                                <h3 class="title">Follow Us</h3>

                                <!-- Start of Social Buttons -->
                                <ul class="social-btns">
                                    <!-- Social Media -->
                                    <li>
                                        <a href="#" class="social-btn-roll facebook">
                                            <div class="social-btn-roll-icons">
                                                <i class="social-btn-roll-icon fa fa-facebook"></i>
                                                <i class="social-btn-roll-icon fa fa-facebook"></i>
                                            </div>
                                        </a>
                                    </li>

                                    <!-- Social Media -->
                                    <li>
                                        <a href="#" class="social-btn-roll twitter">
                                            <div class="social-btn-roll-icons">
                                                <i class="social-btn-roll-icon fa fa-twitter"></i>
                                                <i class="social-btn-roll-icon fa fa-twitter"></i>
                                            </div>
                                        </a>
                                    </li>

                                    <!-- Social Media -->
                                    <li>
                                        <a href="#" class="social-btn-roll google-plus">
                                            <div class="social-btn-roll-icons">
                                                <i class="social-btn-roll-icon fa fa-google-plus"></i>
                                                <i class="social-btn-roll-icon fa fa-google-plus"></i>
                                            </div>
                                        </a>
                                    </li>

                                    <!-- Social Media -->
                                    <li>
                                        <a href="#" class="social-btn-roll instagram">
                                            <div class="social-btn-roll-icons">
                                                <i class="social-btn-roll-icon fa fa-instagram"></i>
                                                <i class="social-btn-roll-icon fa fa-instagram"></i>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                                <!-- End of Social Buttons -->

                            </aside>
                            <!-- End of Widget -->

                        </div>
                    </div>
                    <!-- End of Sidebar -->
                </div>

            </div>
        </main>
        <!-- =============== END OF MAIN =============== -->


<%@ include file="footer.jsp" %>
</body>

</html>
