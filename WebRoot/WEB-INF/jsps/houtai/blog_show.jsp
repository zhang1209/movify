<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>后台管理 </title>

	
 

   
	<!-- 这里是外联样式表，不用动 但是一定要注意路径，尤其是放到项目中时-->
    <!-- Bootstrap -->
    <link href="/movify/houtaiStatic/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/movify/houtaiStatic/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/movify/houtaiStatic/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="/movify/houtaiStatic/green.css" rel="stylesheet">
    <!-- bootstrap-progressbar -->
    <link href="/movify/houtaiStatic/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="/movify/houtaiStatic/jqvmap.min.css" rel="stylesheet"/>

    <!-- Custom Theme Style -->
    <link href="/movify/houtaiStatic/build/css/custom.min.css" rel="stylesheet">
    
   
    <link href="/movify/houtaiStatic/dataTables.bootstrap.min.css" rel="stylesheet">
  	<link href="/movify/houtaiStatic/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="/movify/houtaiStatic/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="/movify/houtaiStatic/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="/movify/houtaiStatic/scroller.bootstrap.min.css" rel="stylesheet">
  </head>

  <body class="nav-md" style="margin:0px">
    <div class="container body" style="width:100%;height:100%;margin:0px">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>后台管理</span></a>
            </div>
			<style>
            	li{
            		width:230px;
            	}
            </style>
            <%@ include file="menu.jsp" %>

        <!-- 右边的主题内容写在这里面 -->
        <div class="right_col" role="main" style="width:1280px;">
			<p style="font-size:30px;font-family:'楷体'">博客管理页面</p>
		<div>
  
           <table id="datatable" class="table table-striped table-bordered" style="text-align:center">
                     <thead>
                        <tr>
                         	<th>博客编号</th>
                         	<th>博客标题</th>
                         	<th>博客封面</th>
                         	<th>博客简介</th>
                         	<th>发布日期</th>
                         	<th>发布人</th>
                         	<th>类型</th>
                         	<th>审核状态</th>
				  			<th>操作</th>
                        </tr>
                      </thead>

  <tbody>
	<tr>          
       	<c:forEach items="${pd.dataList}" var="b">
  				<tr>
  				<td>${b.bid }</td>
  				<td>${b.btitle }</td>
  				<td><img src="${b.bposter}" width="100px" height="100px"/></td>
  				<td><textarea rows="1" cols="1">${b.bintroduce }</textarea></td>
  				<td>${b.bdate }</td>
  				<td>${b.uname }</td>
  				<td>
  					<c:if test="${b.btype==1}">
  						官方博客
  					</c:if>
  					<c:if test="${b.btype==2}">
  						原创博客
  					</c:if>
  				</td>
				<td>
					<c:if test="${b.bcheckstate == 1}">
						未审核
					</c:if>
					<c:if test="${b.bcheckstate == 2}">
						审核通过
					</c:if>
					
				</td>
  				<td>
  					<input type="hidden" name="bid" id="blog_id" value="${b.bid}"/>
					<a class="blog_guo">
						<button class="btn" style="cursor:pointer;background:#2a3f54;color:white;height:40px;width:65px;font-size:20px;">修改</button>
					</a>
  					<a href="ht_blog_delete?bid=${b.bid }"">
  						<button class="btn" style="background:#ddd988;height:40px;width:65px;font-size:20px;">
  							<c:if test="${b.bstate == 1}">
  								禁用
  							</c:if>
  							<c:if test="${b.bstate == 2}">
  								启用
  							</c:if>
  						</button>
  					</a>
  				</td>
  					
  			</tr>
  			
  		</c:forEach>
  		<tr>
    		<td colspan="10">
    			共${pd.totalCount}条数据 ||
    			第${pd.curPage}页/共${pd.totalPage}页||
    			
    			<a href="list2?curPage=1">首页</a>
    			
    			<c:if test="${pd.curPage>1}">
    			<a href="list2?curPage=${pd.curPage-1}">上一页</a>
    			</c:if>
    			
    			<c:if test="${pd.curPage==1 }">
    			<span>上一页</span>
    			</c:if>
    			
    			<!-- 生成连续页码 -->
    			<c:forEach begin="1" end="${pd.totalPage }" var="i">
	    			<c:if test="${pd.curPage == i }">
	    				<span>${i}</span>
	    			</c:if>
	    			<c:if test="${pd.curPage!=i}">
    					<a href="list2?curPage=${i}">${i }</a>
    				</c:if>
    			</c:forEach>
    			
    			<c:if test="${pd.curPage<pd.totalPage }">
    			<a href="list2?curPage=${pd.curPage+1}">下一页</a>
    			</c:if>
    			
    			<c:if test="${pd.curPage == pd.totalPage }">
    			<span>下一页</span>
    			</c:if>
    			
    			
    			<a href="list2?curPage=${pd.totalPage}">尾页</a>
    			
    		</td>
    	</tr>
    </tbody>
  </table>
  <button id="blog_add" style="background:#2a3f54;color:white;height:40px;width:120px;font-size:20px;" class="btn">
  	添加博客
  </button>
                    
               </div>   
          	<!--写在这 -->
        </div>
        <!-- /top navigation -->
        
        </div>
          </div>
        </div>
        
        
    
		<!--  这是右边的最底部 -->
        <footer>
          <div class="pull-right">
         	  联系我们 第一组<a href="https://colorlib.com">Colorlib</a>
          </div>
          <div class="clearfix"></div>
        </footer>
      </div>
    </div>



<script type="text/javascript" src="/movify/static/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function () {
		$(".blog_guo").click(function () {
			$.ajax({
				url:"ht_blog_update_show",
				data:{
					"bid":$(this).prev().val()
				},
				dataType:"json",
				success:function(result) {
					$(".updBlog").modal();
					$("#btitle").val(result.btitle);
					$("#bintroduce").val(result.bintroduce);
					$("#bdetails").val(result.bdetails);
					$("#upd_bid").val(result.bid);
				}
			})	
		})
		
		$("#qrxg").click(function () {
			$("#updfr").submit();
		})
		
		$("#blog_add").click(function () {
			$("#add_blog_guo").modal();
		})
		
		$("#qrxz").click(function () {
			$("#addfr").submit();
		})
	})
</script>
<%@ include file="footer.jsp" %>

<div class="modal fade updBlog">											
	<div class="modal-dialog">
						<div class="modal-content">
							  	<div class="modal-header">
							  		<h4 class="modal-title">编辑博客信息</h4>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>	
							  	</div>
							  	
							  	<div class="modal-body">
							  		<form action="ht_blog_update_submit" method="post" id="updfr" class="form-horizontal form-label-left">
							  		   	<input type="hidden" name="bid" id="upd_bid"/>
							  		   	<div class="form-group">
			          						<input type="text" name="btitle" id="btitle" class="form-control"/>
			          					</div>
			          					<div class="form-group">
			          						<input type="text" name="bintroduce" id="bintroduce" class="form-control"/>
			          					</div>
			          					<div class="form-group">
			          						<input type="text" name="bdetails" id="bdetails" class="form-control"/>
			          					</div>
						          	</form>
		  	</div>
		  	
		  	<div class="modal-footer">
		  		<button type="button" class="btn btn-primary qrxg" id="qrxg">确认修改</button>
		  		<button type="button" class="btn btn-default" data-dismiss="modal" id="qxxg">取消修改</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="add_blog_guo">											
	<div class="modal-dialog">
		<div class="modal-content">
	  	<div class="modal-header">
	  		<h4 class="modal-title">新增博客信息</h4>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>	
	  	</div>
	  	
	  	<div class="modal-body">
	  		<form action="ht_blog_add_submit" method="post" enctype="multipart/form-data" id="addfr" class="form">
          					<input type="hidden"  name="buser" value="${ht_user.uid}"/>
          					<div class="form-group">
          						<input type="text" name="btitle" class="form-control" placeholder="请输入博客标题"/>
          					</div>
          					<div class="form-group">
          						<input type="text" name="bintroduce" class="form-control" placeholder="请输入博客简介"/>
          					</div>
          					<div class="form-group">
          						<input type="text" name="bdetails" class="form-control" placeholder="请输入博客详情"/>
          					</div>
          					<div>
          						<input type="file" name="bposter" class="form-control" placeholder="请输入博客封面"/>
          					</div>
	          </form>
     
		  	</div>
		  	
		  	<div class="modal-footer">
		  		<button type="button" class="btn btn-primary qrxg" id="qrxz">确认新增</button>
		  		<button type="button" class="btn btn-default" data-dismiss="modal" id="qxxg">取消新增</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>

