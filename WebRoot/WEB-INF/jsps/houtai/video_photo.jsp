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
            <%@ include file= "menu.jsp"%>

        <!-- 右边的主题内容写在这里面 -->
        <div class="right_col" role="main" style="width:1280px;">
        	<p style="font-family:'楷体';font-size:30px;">视频图片关联页面</p>
          <div>
          <form action="/movify/ht_video_photo" method="post">
          	<input type="text" name="key" placeholder="请输入视频名称" value="${key}"
          		style="width:300px;height:35px;border:0px solid red;"/>
          	<button class="btn btn-effect" type="submit">搜索</button>
          	<button id="add_photo" class="btn btn-effect" id="add_video_photo" style="background:#2a3f54;color:white" type="button" >添加</button>
          </form>
          
	           <table id="datatable" class="table table-striped table-bordered" style="text-align:center;font-size:23px;">
	                      <thead>
	                        <tr>
	                         	<th>编号</th>
					  			<th>图片</th>
					  			<th>视频名称</th>
					  			<th>操作</th>
	                        </tr>
	                      </thead>
	                      <tbody>
	                     		<c:forEach items="${ht_video_photo_list}" var="list">
	                     			<tr>
	                     				<td>${list.vpid}</td>
	                     				<td>
	                     					<img src="${list.vpname}" style="width:160px;height:90px;"/>
	                     				</td>
	                     				<td>${list.vname}</td>
	                     				<td>
	                     					<a href="ht_video_photo_del?vpid=${list.vpid}" class="del_photo"><button class="btn" style="background:#2a3f54;color:white">删除</button></a>
	                     				</td>
	                     				
	                     			</tr>
	                     		</c:forEach>
	                     			<tr>
	                      				<td style="height:35px;" colspan="4">
	                      					总页数：${pageCount} | 总数据数：${count}|页码：
	                      					<c:forEach begin="1" end="${pageCount}" var="i">
	                      						<a href="/movify/ht_video_photo?key=${key}&pageNo=${i}" ${i == pageNo?"style='background:#2a3f54;color:white'":""}>${i}</a>	
	                      					</c:forEach>
	                      					<a href="/movify/ht_video_photo?key=${key}&pageNo=${pageNo == pageCount?pageCount:pageNo+1}">下一页</a>
	                      				</td>
	                      			</tr>
	                      </tbody>  
	                      		
	                    </table>
                   </div>   
        </div>
        
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



<div class="modal fade " id="add_photoModal">											
	<div class="modal-dialog">
		<div class="modal-content">
			  	<div class="modal-header">
			  		<h4 class="modal-title">编辑视频图片</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>	
			  	</div>
			  	
			  	<div class="modal-body">
			  		<form action="ht_video_photo_add"  method="post" enctype="multipart/form-data" id="fr">
						上传图片
						<input type="file" name="photo_add"/>
						选择视频
						<select name="video">
							<option value="0">---请选择---</option>
							<c:forEach items="${video_list}" var="v">
								<option value="${v.vid}">${v.vname}</option>
							</c:forEach>
						</select>
	      			</form>
			  	</div>
			  	
			  	<div class="modal-footer">
			  		<button type="button" class="btn btn-primary qrxg" id="qrtj">确认添加</button>
			  		<button type="button" class="btn btn-default" data-dismiss="modal" id="qxxg">取消修改</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="/movify/static/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function () {
		$("#add_photo").click(function () {
			$("#add_photoModal").modal();
		})
		
		$("#qrtj").click(function () {
			$("#fr").submit();
		})
	})
</script>
<%@ include file="footer.jsp" %>



 </body>
</html>