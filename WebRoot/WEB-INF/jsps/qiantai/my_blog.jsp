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
                    <h2 class="title">我的视频</h2>
                    <ol class="breadcrumb">
                        <li><a href="${ctx}/indexShow">主页</a></li>
                        <li>我的视频</li>
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
					<c:forEach items="${my_blog}" var="mb">
	                    <!-- Watch Later Item -->
	                    <div class="col-md-12 col-sm-12 watch_later">
	                        <div class="watch-later-item">
	                            <div class="listing-container">
									
		                                <!-- Movie List Image -->
		                                <div class="listing-image">
		                                    <img src="${mb.bposter}" class="img-shadow" alt="">
		                                    
		                                </div>
		
		                                <!-- Movie List Content -->
		                                <div class="listing-content">
		                                    <div class="inner">
		                                        <h3 class="title">${mb.btitle}</h3>
				                                    ${mb.bdate}
				                                    <c:if test="${mb.bcheckstate == 1}">
				                                    	未审核
				                                    </c:if>
				                                     <c:if test="${mb.bcheckstate == 2}">
				                                    	审核通过
				                                    </c:if>
				                                    <br/>
		                                        <p>${mb.bintroduce}</p>
		
		                                        <a href="${ctx}/blog_details?bid=${mb.bid}" class="btn btn-main btn-effect">查看详细</a>
		                                         <a style="cursor:pointer;color:white" class="btn btn-main btn-effect edit">编辑</a>
		                                         <input type="hidden" value="${mb.bid}"  name="bid"/>
<div class="modal fade myModal" >
<div class="modal-dialog ">
		<div class="modal-content">
		  	<div class="modal-header">
		  		<h4 class="modal-title">编辑博客信息</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				
		  	</div>
		  	
		  	<div class="modal-body">
				<form action="${ctx}/my_blog_update_submit?bid=${mb.bid}&uid=${user.uid}" method="post">
					博客标题：<input type="text" name="btitle" class="btitle"/>
					博客简介：<input type="text" name="bintroduce" class="bintroduce"/>
					博客详细：<input type="text" name="bdetails" class="bdetails"/>
				</form>
		  	</div>
		  	
		  	<div class="modal-footer">
		  		<button type="button" class="btn btn-primary qrxg">确认修改</button>
		  		<button type="button" class="btn btn-default" data-dismiss="modal" id="qxxg">取消修改</button>
				
			</div>
		</div>
	</div>
</div>
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
                                		<a href="${ctx}/my_blog?uid=${user.uid}&pageNo=${i}" ${i == pageNo?"class='current-page'":""}>
                                			${i}										      
                                		</a>
                                	</li>
                                </c:forEach>
                                <li>
                                	<a href="${ctx}/my_blog?uid=${user.uid}&pageNo=${pageNo+1>=pageCount?pageCount:pageNo+1}">
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

<script type="text/javascript">
	$(function() {
		$(".edit").click(function() {
			$(this).next().next().modal();
			var bid = $(this).next().val();
			$.ajax({
				url:"my_blog_update_show",
				dataType:"json",
				data:{
					"bid":bid
				},
				success:function(result) {
					$(".btitle").val(result.btitle);
					$(".bintroduce").val(result.bintroduce);
					$(".bdetails").val(result.bdetails);
				}
			})
			
		})
		
		$(".qrxg").click(function() {
			$(this).parent().prev().children().submit();
		})
	})	
</script>
</body>

</html>
