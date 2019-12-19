<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
  <head>
   <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>DataTables | Gentellela</title>

     <script type="text/javascript" src="/movify/static/assets/js/jquery-1.12.4.min.js"></script>
         
     <script type="text/javascript">  
	  
			$(function () {
		  $('[data-toggle="popover"]').popover()
		})
	</script>

     
    <!-- Bootstrap -->
    <link href="/movify/static/assets/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/movify/static/assets/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/movify/static/assets/css/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="/movify/static/assets/css/green.css" rel="stylesheet">
    <!-- Datatables -->
    <link href="/movify/static/assets/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="/movify/static/assets/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="/movify/static/assets/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="/movify/static/assets/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="/movify/static/assets/css/scroller.bootstrap.min.css" rel="stylesheet">
 <!-- Custom Theme Style -->
    <link href="/movify/static/assets/css/custom.min.css" rel="stylesheet">
  </head>

   <body class="nav-md" style="margin:0px">
    <div class="container body" style="width:100%;height:100%;margin:0px">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index.html" class="site_title"><i class="fa fa-paw"></i> 
			  <span>Gentellela Alela!</span></a>
            </div>
            <style>
            	li{
            		width:230px;
            	}
            </style>
			<%@ include file="menu.jsp" %>
            
        <!-- page content -->
		<!-- 右边的主题内容-->
        <div class="right_col" role="main" style="width:1280px;">
          


            <div class="row" >
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>审核页面</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    
                <table id="datatable" class="table table-striped table-bordered">
                    <tr>
					         <th>ID</th>
					         <th>博客标题</th>
					         <th>博客封面图</th>
					         <th>详情</th>         
					         <th>用户</th>					        
					         <th>操作</th>
                   </tr>c
			  
			   <c:forEach items="${blogList}" var="b">
			    <tr>
			   <td>${b.bid }</td>
			   <td>${b.btitle}</td>
			   <td>
			    	        <img alt="" src="${b.bposter}" width="80" height="80">
			   </td>			   
               <td> 	
                        ${b.bdetails}    
			   </td>
			          <td>			          
			           ${b.uname}
			          </td>
 		           <td>
			            <a class="btn btn-info" href="/movify/update_show?bid=${b.bid }" >审核通过</a>
			              <a class="btn btn-info" href="/movify/delete?bid=${b.bid }">审核不通过</a>
			          </td>
			    </tr>     
        </c:forEach>
                 
     </tbody>
  </table>
     
                               
                  </div>
                </div>
              </div>

             </div>
            </div>
          </div>
        </div>
        <!-- /page content -->
			
        <!-- footer content -->
        <footer>
			<div class="pull-right">©movify 张硕、郭笑天、李梦瑶</div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>
<%@ include file="footer.jsp" %>
  </body>
</html>