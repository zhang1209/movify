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
                    <h2 class="title">收藏列表</h2>
                    <ol class="breadcrumb">
                        <li><a href="${ctx}/indexShow">主页</a></li>
                        <li>收藏列表</li>
                    </ol>
                </div>
            </div>
        </section>
        <!-- =============== END OF PAGE HEADER =============== -->



        <!-- =============== START OF MAIN =============== -->
        <main class="ptb100">
            <div class="container">


                <!-- Start of Movie List -->
                <div class="row">
					<c:forEach items="${watch_later}" var="wl">
	                    <!-- Watch Later Item -->
	                    <div class="col-md-12 col-sm-12 watch_later">
	                        <div class="watch-later-item">
	                            <div class="listing-container">
									
		                                <!-- Movie List Image -->
		                                <div class="listing-image">
		                                    <img src="${wl.vposter}" class="img-shadow" alt="">
		                                </div>
		
		                                <!-- Movie List Content -->
		                                <div class="listing-content">
		                                    <div class="inner">
		                                        <h3 class="title">${wl.vname}</h3>
		
		                                        <p>${wl.vintroduce}</p>
		
		                                        <a href="${ctx}/video_details?vid=${wl.vid}&vtype=${wl.vtype}" class="btn btn-main btn-effect">现在观看</a>
		                                         <a style="cursor:pointer;color:white" class="btn btn-main btn-effect qx">取消</a>
		                                         <input type="hidden" value="${wl.vid}"/>
		                                         <span style="display:none" id="vid">${wl.vid}</span>
		                                    </div>
		                                </div>
		
		                            </div>
		                        </div>
		                    </div>
                    </c:forEach>
                </div>
                <!-- End of Movie List -->



                <!-- Start of Pagination -->
                <div class="row mt30">
                    <div class="col-md-12 col-sm-12 watch_later">
                        <nav class="pagination">
                            <ul>
                               <c:forEach begin="1" end="${pageCount}" var="i">
                                	<li>
                                		<a href="${ctx}/watch_later_show?uid=${user.uid}&pageNo=${i}" ${i == pageNo?"class='current-page'":""}>
                                			${i}										      
                                		</a>
                                	</li>
                                </c:forEach>
                                <li>
                                	<a href="${ctx}/watch_later_show?uid=${user.uid}&pageNo=${pageNo+1>=pageCount?pageCount:pageNo+1}">
                                		<i class="ti-angle-right"></i>
                                	</a>
                                </li>

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
		$(".qx").click(function () {
			var obj = $(this).closest(".watch-later-item");
			var vid = $(this).next().val();
			if(confirm("确认要删除吗")) {
				$.ajax({
					url:"${ctx}/watch_later_del",
					data:{
						"uid":"${user.uid}",
						"vid":vid
					},
					success:function(result) {
						obj.remove();
					}
				})
				
			}
			
			
		})
	})
</script>
</body>

</html>
