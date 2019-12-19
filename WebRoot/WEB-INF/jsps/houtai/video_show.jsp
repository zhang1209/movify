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
        	<p style="font-family:'楷体';font-size:30px;">视频管理页面</p>
          <div>
           <table id="datatable" class="table table-striped table-bordered" style="text-align:center;">
                      <thead>
                        <tr>
                         	<th>编号</th>
				  			<th>名称</th>
				  			<th>类型</th>
				  			<th>分类</th>
				  			<th>语种</th>
				  		    <th>用户</th>
				  			<th>入库时间</th>
				  			<th>时长</th>
				  			<th>评分</th>
				  			<th>封面</th>
				  			<th>状态</th>
				  			<th>国籍</th>
				  			<th>导演</th>
				  		    <th>耗资</th>
				  			<th>制片厂</th>
				  			<th>操作</th>
                        </tr>
                      </thead>
                      <tbody>
                      
				       	<c:forEach items="${pd.dataList}" var="v">
				  				<tr>
				  				<td>${v.vid }</td>
				  				<td>${v.vname }</td>
				  				<td>
				  					<c:if test="${v.vtype == 1}">
				  						电影
				  					</c:if>
				  					<c:if test="${v.vtype == 2}">
				  						连续剧
				  					</c:if>
				  					<c:if test="${v.vtype == 3}">
				  						用户原创
				  					</c:if>
				  				</td>
				  				<td>${v.cname }</td>
				  				<td>${v.lname }</td>
				  		        <td>${v.uname}</td> 
				  				<td>${v.vdate }</td>
				  				<td>${v.vtime}</td>
				  				<td>${v.vrating }</td>
				  				<td><img src="${v.vposter}" width="50px" height="50px"/></td>
				  				<td>
				  					<c:if test="${v.vstate == 1}">
				  						启用中
				  					</c:if>
				  					<c:if test="${v.vstate == 2}">
				  						被禁用
				  					</c:if>
				  				</td>
				  				<td>${v.vcountry}</td>
				  				<td>${v.vdirector}</td>
				  			    <td>${v.vcost}亿￥</td>
				  				<td>${v.vstudio}</td>
				  				<td>
				  						<button class="video_edit btn" style="cursor:pointer;background:#2a3f54;color:white">修改</button>
				  						<input type="hidden" name="vid" value="${v.vid}" class="vid"/>
				  						<a href="ht_video_delete?vid=${v.vid }">
				  							<button class="btn" style="background:#ddd988">
				  								<c:if test="${v.vstate == 1}">
				  									禁用
				  								</c:if>
				  								<c:if test="${v.vstate == 2}">
				  									启用
				  								</c:if>
				  							
				  							</button>	
				  						</a>
				  				</td>
				  			</tr>
				  		</c:forEach>
									<tr >
						  		<td colspan="20">
						  			共${pd.totalCount }条数据 ||
						  			第${pd.curPage}页/共${pd.totalPage}页||
						  			
						  			<a href="list1?curPage=1">首页</a>
						  			
						  			<c:if test="${pd.curPage>1}">
						  			<a href="list1?curPage=${pd.curPage-1}">上一页</a>
						  			</c:if>
						  			
						  			<c:if test="${pd.curPage==1 }">
						  			<span>上一页</span>
						  			</c:if>
						  			
						  			<!-- 生成连续页码 -->
						  			<c:forEach begin="1" end="${pd.totalPage }" var="i">
						   			<c:if test="${pd.curPage == i }">
						   				<span>${i }</span>
						   			</c:if>
						   			<c:if test="${pd.curPage!=i}">
						  					<a href="list1?curPage=${i}">${i }</a>
						  				</c:if>
						  			</c:forEach>
						  			
						  			<c:if test="${pd.curPage<pd.totalPage }">
						  			<a href="list1?curPage=${pd.curPage+1}">下一页</a>
						  			</c:if>
						  			
						  			<c:if test="${pd.curPage == pd.totalPage }">
						  			<span>下一页</span>
						  			</c:if>
						  			
						  			
						  			<a href="list1?curPage=${pd.totalPage}">尾页</a>
						  			
						  		</td>
						  		
						  	</tr>
						  		
                      </tbody>
                    </table>
                    <button id="videoGuo" type="button" class="btn" style="background:#2a3f54;color:white">添加视频</button>
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





<div class="modal fade updVideo">											
	<div class="modal-dialog">
		<div class="modal-content">
			  	<div class="modal-header">
			  		<h4 class="modal-title">编辑视频信息</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>	
			  	</div>
			  	
			  	<div class="modal-body">
			  		<form action="ht_video_update_submit"  method="post" class="form" id="fr">
					   	<input type="hidden" name="vid" value="${v.vid}" class="vid"/>
						视频名称：<input type="text" name="vname" class="vname"/><br/>
						视频评分：<input type="text" name="vrating" class="vrating"/><br/>
						点赞数量：<input type="text" name="vlikecount" class="vlikecount"/><br/>
						视频国籍：<input type="text" name="vcountry" class="vcountry"/><br/>
						视频导演：<input type="text" name="vdirector" class="vdirector"/><br/>
	      			</form>
			  	</div>
			  	
			  	<div class="modal-footer">
			  		<button type="button" class="btn btn-primary qrxg" id="qrxg">确认修改</button>
			  		<button type="button" class="btn btn-default" data-dismiss="modal" id="qxxg">取消修改</button>
				</div>
			</div>
		</div>
	</div>
					
<div class="modal fade" id="add_video">											
	<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
		  		<h4 class="modal-title">编辑视频信息</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>	
		  	</div>
		  	
		  	<div class="modal-body">
		  		<form class="form-horizontal form-label-left" action="/movify/ht_video_add_submit?vuser=${ht_user.uid}"  method="post" enctype="multipart/form-data" id="add_fr">
		         				<div class="form-group">
		         					<input type="text" name="vname" class="form-control" placeholder="请输入视频名称"/>
	         					</div>
	         					<div class="form-group">
		         					<select name="vcategory" class="form-control">
		         						<option value="0">---请选择---</option>
		         						<c:forEach items="${categorylist}" var="cl">
		         							<option value="${cl.cid}">${cl.cname}</option>
		         						</c:forEach>
		         					</select>
		         				</div>
		         				<div class="form-group">
		         					<select name="vlanguage" class="form-control">
		         						<option value="0">---请选择---</option>
		         						<c:forEach items="${languagelist}" var="ll">
		         							<option value="${ll.lid}">${ll.lname}</option>
		         						</c:forEach>
			         				</select>
		         				</div>
		         				<div class="form-group">
		         					<input type="text" name="vtime" class="form-control" placeholder="请输入视频时长"/>
		         				</div>
		         				<div class="form-group">
		         					<input type="text" name="vrating" class="form-control" placeholder="请输入视频评分"/>
		         				</div>
		         				<div class="form-group">
		         					<input type="text" name="vcountry" class="form-control" placeholder="请输入视频国籍"/>
		         				</div>
		         				<div class="form-group">
		         					<input type="text" name="vdirector" class="form-control" placeholder="请输入视频导演"/>
		         				</div>
		         				<div class="form-group">
		         					<input type="text" name="vcost" class="form-control" placeholder="请输入视频耗资"/>
		         				</div>
		         				<div class="form-group">
		         					<input type="text" name="vstudio" class="form-control" placeholder="请输入视频制片厂"/>
		         				</div>
		         				<div class="form-group">
		         					<input type="file" name="wj"  class="form-control"/>	
		         				</div>
		         				<div class="form-group">
		         					<input type="file" name="wj"  class="form-control"/>
		         				</div>
		        </form>
		  	</div>
		  	
		  	<div class="modal-footer">
		  		<button type="button" class="btn btn-primary qrxg" id="qrtj">确认添加</button>
		  		<button type="button" class="btn btn-default" data-dismiss="modal" id="qxtj">取消添加</button>
			</div>
		</div>
	</div>
</div>

<%@ include file="footer.jsp" %>
<script type="text/javascript">

	$(".video_edit").click(function() {
			var obj = $(this);
			var vid = $(this).next().val();
			$.ajax({
				url:"my_video_update_show",
				dataType:"json",
				data:{
					"vid":vid
				},
				success:function(result) {
					$(".updVideo").modal();
					$(".vname").val(result.vname);
					$(".vrating").val(result.vrating);
					$(".vlikecount").val(result.vlikecount);
					$(".vdirector").val(result.vdirector);
					$(".vcountry").val(result.vcountry);
				}
			})
			
			$(".qrxg").click(function () {
				$(".vid").val(vid);
				$("#fr").submit();
			})
		})
		
			$("#videoGuo").click(function () {
				$("#add_video").modal();
			})
			
			$("#qrtj").click(function () {
				$("#add_fr").submit();
			})
</script>

  </body>
</html>