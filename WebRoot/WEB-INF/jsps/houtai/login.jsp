<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>HouTaiDengLu </title>

    <!-- Bootstrap -->
    <style type="text/css">
    	#denglu{
    		
    		width:300px;
    		height:60px;
    	}
    	#denglu input{
    	margin-left:150px;
    	}
    </style>
    <link href="/movify/houtaiStatic/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/movify/houtaiStatic/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/movify/houtaiStatic/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="https://colorlib.com/polygon/gentelella/css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="/movify/houtaiStatic/build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="login">
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <form action="/movify/houtai_login_submit">
              <h1>后台登录</h1>
              <div>
              
                <input type="text" name="username" id="uname" class="form-control" placeholder="用户名" required="true"/>
              	<span></span>
              </div>
              <div>
                <input type="password" name="password" id="pwd" class="form-control" placeholder="密码" required="true"/>
              </div>
              <div id="denglu">
                <button  class="btn btn-default submit" type="button" id="login">登录</button>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
              <p class="change_link"> 联系我们 021348-10156!
                </p>
	
                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-paw"></i>视频</h1>
                  <p>©2016 222有限公司出品,本公司具有法律解释权</p>
                </div>
              </div>
            </form>
          </section>
        </div>

       </div>
       
       <script type="text/javascript" src="/movify/static/jquery-3.2.1.js"></script>
       <script type="text/javascript">
       		$(function () {
       			$("#login").click(function () {
       				$.ajax({
       					url:"/movify/houtai_login_submit",
       					data:{
       						"username":$("#uname").val(),
       						"password":$("#pwd").val()
       					},
       					success:function(result) {
       						if (result == "ok") {
       							location.href="/movify/welcome";
       						} else if (result == "1") {
       							alert("用户名或密码错误");
       						} else {
       							alert("对不起，您没有权限进入后台");
       						}
       					}
       				})
       			})
       		})
       </script>
  </body>
</html>