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
					<c:forEach items="${my_video}" var="mv">
	                    <!-- Watch Later Item -->
	                    <div class="col-md-12 col-sm-12 watch_later">
	                        <div class="watch-later-item">
	                            <div class="listing-container">
									
		                                <!-- Movie List Image -->
		                                <div class="listing-image">
		                                    <img src="${mv.vposter}" class="img-shadow" alt="">
		                                </div>
		
		                                <!-- Movie List Content -->
		                                <div class="listing-content">
		                                    <div class="inner">
		                                        <h3 class="title">${mv.vname}</h3>
												${mv.vdate} 
												<c:if test="${mv.vcheckstate == 1}">
													待审核
												</c:if>
												<c:if test="${mv.vcheckstate == 2}">
													审核通过
												</c:if>
		                                        <p>${mv.vintroduce}</p>
		
		                                        <a href="${ctx}/video_details?vid=${mv.vid}&vtype=${mv.vtype}" class="btn btn-main btn-effect">现在观看</a>
		                                        <a style="cursor:pointer;color:white" class="btn btn-main btn-effect edit">编辑</a>
												<input type="hidden" value="${mv.vid}" name="vid"/>
												
												<div class="modal fade myModal" >
													<div class="modal-dialog">
														<div class="modal-content">
														  	<div class="modal-header">
														  		<h4 class="modal-title">编辑视频信息</h4>
																<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
																
														  	</div>
														  	
														  	<div class="modal-body">
																<form action="${ctx}/my_video_update_submit?vid=${mv.vid}&uid=${user.uid}" method="post">
																	视频标题：<input type="text" name="vname" class="vname"/>
																	视频简介：<input type="text" name="vintroduce" class="vintroduce"/>
																	视频分类：
																	<select class="vcategory" name="cid">
																			<option value="0">---请选择---</option>
																		<c:forEach items="${category}" var="c">
																			<option value="${c.cid}" ${c.cid==mv.cid?"selected='selected'":""}>${c.cname}</option>
																		</c:forEach>
																	</select>
																	视频语种：
																	<select class="vlanguage" name="lid">
																			<option value="0">---请选择---</option>
																		<c:forEach items="${language}" var="l">
																			<option value="${l.lid}" ${l.lid==mv.lid?"selected='selected'":""}>${l.lname}</option>
																		</c:forEach>
																	</select>
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
                                		<a href="${ctx}/my_video?uid=${user.uid}&pageNo=${i}" ${i == pageNo?"class='current-page'":""}>
                                			${i}										      
                                		</a>
                                	</li>
                                </c:forEach>
                                <li>
                                	<a href="${ctx}/my_video?uid=${user.uid}&pageNo=${pageNo+1>=pageCount?pageCount:pageNo+1}">
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
			var vid = $(this).next().val();
			$.ajax({
				url:"my_video_update_show",
				dataType:"json",
				data:{
					"vid":vid
				},
				success:function(result) {
					$(".vname").val(result.vname);
					$(".vintroduce").val(result.vintroduce);
					$(".vcategory").val(result.vcategory);
					$(".vlanguage").val(result.vlanguage);
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
