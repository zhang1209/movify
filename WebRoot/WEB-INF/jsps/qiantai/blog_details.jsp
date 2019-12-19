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
                    <h2 class="title">博客详情</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">主页</a></li>
                        <li>博客详情</li>
                    </ol>
                </div>
            </div>
        </section>
        <!-- =============== END OF PAGE HEADER =============== -->



        <!-- =============== START OF MAIN =============== -->
        <main class="blog-detail ptb100">
            <div class="container">

                <!-- Start of Row -->
                <div class="row">

                    <!-- Start of Blog Post Content -->
                    <div class="col-lg-9 col-md-8 col-sm-12">
                        <div class="blog-post-wrapper">
                            <!-- Start of Blog Post -->
                            <article class="blog-post-detail">

                                <!-- Image -->
                                <div class="blog-thumb">
                                    <img src="${blog.bposter}" alt="">
                                </div>

                                <!-- Content -->
                                <div class="post-content">
                                    <h3 class="title">
                                        <a href="#">
                                            ${blog.btitle}
                                        </a>
                                    </h3>

                                    <ul class="post-meta">
                                        <li>${blog.bdate}</li>
                                        <li><a href="#">${blog.uname}</a></li>
                                        <li><a href="#">回复数( ${replayCount.zs} )</a></li>
                                    </ul>

                                    <p>${blog.bdetails}</p>

                                    <!-- Start of Social Buttons -->
                                    <div class="mt30">
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
                                    </div>
                                    <!-- End of Social Buttons -->
                                </div>

                            </article>
                            <!-- End of Blog Post -->

                            <hr class="op-5 mtb50">

                            <!-- Start of Blog Post Comments -->
                            <div class="comments">
                                <h3 class="title">回复数 ( ${replayCount.zs} )</h3>

                                <ul class="list-unstyled mt30" id="hf">
                                
                                	<c:forEach items="${replay}" var="rp">
		                                <li class="media">
			                                <div class="circle-img">
	                                            <img class="d-flex mr-3 img-circle" src="${rp.uphoto}" width="60" alt="">
	                                        </div>
	                                        <div class="media-body">
	                                            <h5 class="mt-0">${rp.uname}</h5>${rp.rpcontent}
	                                            <br/><br/>
	                                            <a class="btn btn-effect lookall" style="background:#edf5f7">查看全部</a>
	                                            <input type="hidden" name="fid" value="${rp.rpid}"/>
												<a class="btn btn-main btn-effect huifu" style="color:white">回复</a>
                                        	</div>
	                                    </li>
                                    </c:forEach>
                                    
                                </ul>

                            </div>
                            <!-- End of Blog Post Comments -->

                            <hr class="op-5 mtb50">


                            <!-- Start of Comment Form -->
                            <div class="comment-form">
                                <h3 class="mt-0 mb-1">给博客留言...</h3>
                                <h6 class="subtitle">请注意你的一言一行，健康网络人人有责</h6>

                                <form class="row mt30" action="${ctx}/replay_add?bid=${blog.bid}&uid=${user.uid}" method="post" id="fr">
                                	<input type="hidden" value="${blog.bid}" id="huifubid"/>
                                	<input type="hidden" value="${user.uid}" id="huifuuid"/>
                                    <div class="form-group col-md-12 m-t-20">
                                        <textarea class="form-control" rows="5" placeholder="你的回复内容" name="content" id="content"></textarea>
                                    </div>
                                    <div class="form-group col-md-12 m-t-20">
                                        <a class="btn btn-main btn-effect" id="huifu" style="color:white">回复</a>
                                    </div>
                                </form>
                                
                            </div>
                            <!-- End of Comment Form -->

                        </div>
                    </div>
                    <!-- End of Blog Post Content -->


                    <!-- Start of Sidebar -->
                    <div class="col-lg-3 col-md-4 col-sm-12">
                        <div class="sidebar">

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

                            </aside>
                            <!-- End of Widget -->

                            <!-- Start of Widget -->
                            <aside class="widget">
                                <h3 class="title">关注我们</h3>

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
                <!-- End of Row -->



            </div>
        </main>
        <!-- =============== END OF MAIN =============== -->



        

    </div>
    <!-- =============== END OF WRAPPER =============== -->

	<%@ include file="footer.jsp" %>
	<div class="modal fade myModal" >
<div class="modal-dialog ">
		<div class="modal-content">
		  	<div class="modal-header">
		  		<h4 class="modal-title">回复</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				
		  	</div>
		  	
		  	<div class="modal-body">
		  			<form>
					  <textarea id="rpcontent" rows="4" cols="3" placeholder="请写入你的回复信息" ></textarea>
					</form>
					<!--<input id="rpcontent" placeholder="请写入你的回复信息"/>-->
		  	</div>
		  	
		  	<div class="modal-footer">
		  		<button type="button" class="btn btn-primary qrhf">确认回复</button>
		  		<button type="button" class="btn btn-default" data-dismiss="modal" id="qxhf">取消回复</button>
			</div>
		</div>
	</div>
</div>
	<script type="text/javascript">
		$(function () {
			$("#huifu").click(function () {
				if (${user == null}) {
					alert("请先登录");
					return;
				} else {
					$.ajax({
						url:"${ctx}/replay_add",
						dataType:"json",
						data:{
							"bid":$("#huifubid").val(),
							"uid":$("#huifuuid").val(),
							"content":$("#content").val()
						},
						success:function(result) {
							$("#hf").after("<li class='media'><div class='circle-img'><img class='d-flex mr-3 img-circle' src='"+result.uphoto+"' width='60'></div>"
							+"<div class='media-body'><h5 class='mt-0'>"+result.uname+"</h5>"+result.content+"<br/><br/>"
							+"<a class='btn btn-effect lookall' style='background:#edf5f7'>查看全部</a>"
							+"<input type='hidden' name='fid' value='${rp.rpid}'/>"
							+"<a class='btn btn-main btn-effect huifu' style='color:white'>回复</a></div></li>");
						}
					})
				}
			})
			
			// 查看子回复的jquery
			var num = 0;
			$(".lookall").click(function () {
				if (${user == null}) {
					alert("还没有登录！！");
				}
				
				var obj = $(this);
				var hm = obj.parent();
				if (num == 1){
					hm.find(".media").remove();
					obj.html("查看全部");
					num = 2;
				} else {
						$.ajax({
						url:"${ctx}/query_sonReplay",
						dataType:"json",
						data:{
							"bid":"${blog.bid}",
							"rpfid":obj.next().val()
						},
						success:function(result) {
							if (result.sonReplay == null || result.sonReplay == ""){
								alert("没有回复哦！！");
							} else {
								var test = result.sonReplay;
								$(test).each(function(){
								hm.append("<div class='media'> <div class='circle-img'>"+
													"<img class='d-flex mr-3' src='"+this.uphoto+"' width='60'></div>"+
													"<div class='media-body'><h5 class='mt-0'>"+this.uname+"</h5>"+this.rpcontent+"<br/><br/></div></div>");
								})
								obj.html("关闭");
								num = 1;
							}
							
						}
					})
				}
			})
			
			var obj = null;
			$(".huifu").click(function() {
				$(".myModal").modal();
				obj = $(this);
			})
			
			// 回复父评论的jquery
			$(".qrhf").click(function() {	
				$.ajax({
					url:"${ctx}/replay_father",
					data:{
						"bid":${blog.bid},
						"uid":${user.uid},
						"rpfid":obj.prev().val(),
						"rpcontent":$("#rpcontent").val()
					},
					success: function () {
						$("#qxhf").trigger("click");
					}
				})
			})
		})
	</script>
</body>

</html>
