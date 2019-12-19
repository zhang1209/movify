<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<style type="text/css">
	.login_ok{
		display:none;
	}
</style>

<meta charset="UTF-8">

    <!-- ===== 优化了移动视口 ===== -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no">

    <!-- ===== 源标签 - 用于搜索引擎的说明 ===== -->
    <meta name="description" content="Movify - Movies, Series & Cinema HTML Template">
    <meta name="keywords" content="movies, series, online streaming, html template, cinema html template">
    <meta name="author" content="GnoDesign">

    <!-- ===== 网站标题 ===== -->
    <title>主页</title>

    <!-- ===== 网站图标 & 不同大小的图标 ===== -->
    <link rel="shortcut icon" href="${ctx}/static/assets/images/favicon.png" type="image/x-icon">
    <link rel="apple-touch-icon" sizes="57x57" href="${ctx}/static/assets/images/apple-touch-icon-iphone.png">
    <link rel="apple-touch-icon" sizes="76x76" href="${ctx}/static/assets/images/apple-touch-icon-ipad.png">
    <link rel="apple-touch-icon" sizes="120x120" href="${ctx}/static/assets/images/apple-touch-icon-iphone-retina.png">
    <link rel="apple-touch-icon" sizes="152x152" href="${ctx}/static/assets/images/apple-touch-icon-ipad-retina.png">
    <link rel="apple-touch-icon" sizes="167x167" href="${ctx}/static/assets/images/apple-touch-icon-ipad-pro.png">
    <link rel="apple-touch-icon" sizes="180x180" href="${ctx}/static/assets/images/apple-touch-icon-iphone-6-plus.png">
    <link rel="icon" sizes="192x192" href="${ctx}/static/assets/images/icon-hd.png">
    <link rel="icon" sizes="128x128" href="${ctx}/static/assets/images/icon.png">

    <!-- ===== 谷歌字体 ===== -->
    <link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    
    <!-- ===== 外联样式表 ===== -->
    <link rel="stylesheet" type="text/css" href="${ctx}/static/assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/assets/revolution/css/settings.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/assets/revolution/css/layers.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/assets/revolution/css/navigation.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/assets/css/magnific-popup.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/assets/css/jquery.mmenu.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/assets/css/owl.carousel.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/assets/css/font-awesome.min.css">
	
    <link rel="stylesheet" type="text/css" href="${ctx}/static/assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/assets/css/responsive.css">


<!-- =============== 预加载 开始 =============== -->
    <div class="loading">
        <div class="loading-inner">
            <div class="loading-effect">
                <div class="object"></div> 
            </div>
        </div>
    </div>
    <!-- =============== 预加载 结束 =============== -->



    <!-- =============== 响应主要 NAV 开始 =============== -->
    <nav id="main-mobile-nav"></nav>
    <!-- =============== 响应主要 NAV 结束 =============== -->


<!-- =============== 头部导航栏 开始 =============== -->
        <!-- 如果你想要一个有粘性的标题，在标题中插入“sticky” class -->
        <header class="header header-fixed header-transparent text-white">
            <div class="container-fluid">
				
                <!-- ====== 导航条开始 ====== -->
                <nav class="navbar navbar-expand-lg">
				<style type="text/css">
					.navbar{
						color:black;
					}
					#wl{
						display:none;
					}
					#logo{
						display:block;
					}
				</style>
                    <a class="navbar-brand" href="${ctx}/indexShow">
                        <!-- 插入 LOGO --> 
                        <img src="${ctx}/static/assets/images/logo.svg" alt="logo" width="150" class="logo" id="logo">
                        <img src="${ctx}/static/assets/images/logo-white.svg" alt="white logo" width="150" class="logo-white" id="wl">

                    </a>

                    <button id="mobile-nav-toggler" class="hamburger hamburger--collapse" type="button">
                       <span class="hamburger-box">
                          <span class="hamburger-inner"></span>
                       </span>
                    </button>

                    <!-- ====== 主要导航 开始====== -->
                    <div class="navbar-collapse" id="main-nav">

                        <!-- ====== 菜单 开始 ====== -->
                        <ul class="navbar-nav mx-auto" id="main-menu">
                            <!-- 上菜单 -->
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="${ctx}/indexShow">主页</a>

                                <!-- 下拉菜单 -->
                                <ul class="dropdown-menu">
                                    <!-- 下菜单 -->
                                   
                                    <li>
                                        <a id="nv" class="dropdown-item" href="#newvideo"><i class="fa fa-paper-plane" style="color:green"></i>&nbsp;最新影视</a>
                                    </li>
                                    <li>
                                        <a id="vlog2" class="dropdown-item" href="#hotvideo"><i class="fa fa-fire" style="color:red"></i>&nbsp;&nbsp;最热影视</a>
                                    </li>
                                    <li>
                                        <a id="hv" class="dropdown-item" href="#vlog"><i class="fa fa-bookmark-o" style="color:blue"></i>&nbsp;&nbsp;用户原创</a>
                                    </li>
                                    <li>
                                        <a id="nb" class="dropdown-item" href="#newblog"><i class="fa fa-file-text-o" style="color:#ffd200"></i>&nbsp;&nbsp;最新博客</a>
                                    </li>    
                                  
                                    <!-- 分割线 -->
                                    <li class="divider" role="separator"></li> 
                                    <li>
                                        <a id="vip" class="dropdown-item" href="#vip2"><i class="fa fa-info"></i>&nbsp;&nbsp;开通会员</a>
                                    </li> 
                                    <li>
                                        <a id="work2" class="dropdown-item" href="#work"><i class="fa fa-info"></i>&nbsp;&nbsp;他是怎么工作的？</a>
                                    </li>  
                                    
                                </ul>
                            </li>
                            
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">电影 & 连续剧 & 原创</a>
                                <!-- 下拉菜单 -->
                                <ul class="dropdown-menu">
                                    <!-- 下菜单 -->
                                    <li>
                                        <a class="dropdown-item" href="${ctx}/video_list?video_type=1"><i class="fa fa-youtube-play" style="color:red"></i>&nbsp;&nbsp;&nbsp;高清电影</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="${ctx}/video_list?video_type=2"><i class="fa fa-tv (alias)" style="color:blue"></i>&nbsp;&nbsp;高清连续剧</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="${ctx}/video_list?video_type=3"><i class="fa fa-maxcdn" style="color:green"></i>&nbsp;&nbsp;用户原创&Vlog</a>
                                    </li>
									
									<!-- 分割线 -->
                                    <li class="divider" role="separator"></li>   
                                    
                                    
                                </ul>
                            </li>
                            
                                   <!-- 上菜单 -->
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">博客</a>

                                <!-- 下拉菜单 -->
                                <ul class="dropdown-menu">
                                    <!-- 下菜单 -->
                                    <li>
                                        <a class="dropdown-item" href="${ctx}/blog_list?op=new"><i class="fa fa-paper-plane" style="color:blue"></i>&nbsp;最新博客</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="${ctx}/blog_list?op=yc"><i class="fa fa-maxcdn" style="color:green"></i>&nbsp;原创博客</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="${ctx}/blog_list?op=gf"><i class="fa fa-info"></i>&nbsp;&nbsp;官方博客</a>
                                    </li>

                                    <!-- 分割线 -->
                                    <li class="divider" role="separator"></li>
                                    
                                    
                                </ul>
                            </li>
                            
                              <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">个人中心</a>

                                <!-- 下拉菜单 -->
                                <ul class="dropdown-menu">
                                    <!-- 下菜单 -->
                                    <li>
                                        <a class="dropdown-item my_video" style="cursor:pointer"><i class="fa fa-film"></i>&nbsp;&nbsp;我的视频</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item my_blog" style="cursor:pointer"><i class="fa fa-external-link" style="color:#dd522b"></i>&nbsp;&nbsp;我的博客</a>
                                    </li>	
                                     <li class="divider" role="separator"></li>
                                    <li>
                                        <a class="dropdown-item upVideo" style="cursor: pointer;"><i class="fa fa-cloud-upload" style="color:green"></i>&nbsp;&nbsp;发布视频</a>
                                    </li> 
                                    <li>
                                        <a class="dropdown-item" style="cursor:pointer" id="fbbk"><i class="fa fa-cloud" style="color:blue"></i>&nbsp;&nbsp;发布博客</a>
                                    </li>
                                     <li class="divider" role="separator"></li>
                                    <li>
                                        <a class="dropdown-item wl" style="cursor: pointer;"><i class="fa fa-spinner" style="color:#9352b3"></i>&nbsp;&nbsp;收藏列表</a>
                                    </li> 
                                </ul>
                                
                            </li>

                            <!-- 上菜单2 -->
                             <li class="nav-item">
                                <a class="nav-link" href="${ctx}/actor_list">演员列表</a>
                            </li>

                            <!-- 上菜单 -->
                            

                     

                            <!-- 菜单  -->
                            <li class="nav-item">
                                <a class="nav-link" href="${ctx}/concat_us">联系我们</a>
                            </li>

                        </ul>
                        <!-- ====== 菜单 结束 ====== -->


                        <!-- ====== 额外菜单 开始 ====== -->
                        <ul class="navbar-nav extra-nav" id="login_ok">

                            <!-- 菜单 -->
                            <li class="nav-item">
                                <a class="nav-link toggle-search" style="cursor: pointer;">
                                    <i class="fa fa-search"></i>
                                </a>
                            </li>

                            <!-- 菜单 -->
                            <li class="nav-item m-auto" id="dlk">
                                <a href="#login-register-popup" class="btn btn-main btn-effect login-btn popup-with-zoom-anim" id="login_now">
                                     <i class="icon-user"></i>现在登录
                                </a>
                            </li>
                            
                            <li style="line-height:35px;display:none" id="dlk2">
	                            <a href="#">
	                            	<img id="userPhoto" src="${user.uphoto}" style="border-radius:100px;height:40px;width:40px;"/>
	                            	${user.uname}
	                            </a>
                            </li>
                            <li style="line-height:35px;display:none;margin-left:15px;" id="dlk3">
                            	<a href="${ctx}/out_login" onclick=" return confirm('确定要退出吗')">退出登录</a>
                            </li>
                        </ul>
                        <!-- ====== 额外菜单 结束 ====== -->

                    </div>
                    <!-- ====== 主要导航栏 结束 ====== -->
                </nav>
                <!-- ====== 导航条 结束 ====== -->
            </div>
        </header>
        
        <!-- =============== 顶部搜索框 开始 =============== -->
	    <div class="general-search-wrapper">
	        <form class="general-search" role="search" method="post" action="${ctx}/video_list">
	            <input type="text" placeholder="请输入视频关键字..." name="key">
	            <span id="general-search-close" class="ti-close toggle-search"></span>
	        </form>
	    </div>
    	<!-- =============== 顶部搜索框 结束 =============== -->
        


        <!-- =============== 登陆 注册模块 开始=============== -->
    <div id="login-register-popup" class="small-dialog zoom-anim-dialog mfp-hide">

        <!-- =============== 登录 & 注册窗口 开始 =============== -->
                <div class="small-dialog login-register">

                    <!-- ===== 登录窗口 开始===== -->
                    <div class="signin-wrapper">
                        <div class="small-dialog-headline">
                            <h4 class="text-center">登录</h4>
                        </div>

                        <div class="small-dialog-content">

                            <!-- 登录表单 开始 -->
                            <form id="login" method="post" action="">
                                <p class="status"></p>

                                <div class="form-group">
                                    <label for="username">用户名、邮箱或手机号 *</label>
                                    <input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名、邮箱或手机号" />
                                    <label id="unErr"></label>
                                </div>

                                <div class="form-group">
                                    <label for="password">密码 *</label>
                                    <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码" />
                                    <label id="pwErr"></label>
                                </div>

                                <div class="form-group">
                                    <input type="button" value="登 录" class="btn btn-main btn-effect nomargin" id="denglu"/>
                                </div>
                            </form>
                            <!-- 登录表单 结束 -->

                            <div class="bottom-links">
                                <span>
                                    	非会员？
                                    <a  class="signUpClick">注册</a>
                                </span>
                                <a  class="forgetPasswordClick pull-right">忘记密码</a>
                            </div>
                        </div>

                    </div>
                    <!-- ===== 登录窗口 结束 ===== -->



                    <!-- ===== 注册窗口 开始 ===== -->
                    <div class="signup-wrapper">
                        <div class="small-dialog-headline">
                            <h4 class="text-center">注册</h4>
                        </div>

                        <div class="small-dialog-content">

                            <!-- 注册表单 开始 -->
                            <form id="cariera_registration" method="POST">
                                <p class="status"></p>

                                <div class="form-group">
                                    <label for="movify_user_login">用户名*</label>
                                    <input name="register_username" id="movify_username" class="form-control" type="text" placeholder="请输入用户名（必填）"/>
                                    <label id="movify_usernameErr"></label>
                                </div>
                                
                                <div class="form-group">
                                    <label for="password">密码*</label>
                                    <input name="register_password" id="movify_password" class="form-control" type="password" placeholder="请输入密码（必填）"/>
                                	<label id="movify_passwordErr"></label>
                                </div>
                                
                                <div class="form-group">
                                    <label for="password">确认密码*</label>
                                    <input name="register_password2" id="movify_password2" class="form-control" type="password" placeholder="请输入确认密码（必填）"/>
                                	<label id="movify_password2Err"></label>
                                </div>

                                <div class="form-group">
                                    <input type="button" class="btn btn-main btn-effect nomargin" value="注 册" id="register"/>
                                </div>
                            </form>
                            <!-- 注册表单 结束-->

							
							
                            <div class="bottom-links">
                                <span>
                                   	准备好了吗？
                                    <a class="signInClick" id="closeRegister">登录</a>
                                </span>

                                <a class="forgetPasswordClick pull-right">忘记密码</a>
                            </div>

                        </div> <!-- 小 模 块 -->
                        
                    </div>
                    <!-- ===== 注册窗口 结束 ===== -->



                    <!-- ===== 忘记密码窗口 开始 ===== -->
                    <div class="forgetpassword-wrapper">
                        <div class="small-dialog-headline">
                            <h4 class="text-center">忘记密码</h4>
                        </div>

                        <div class="small-dialog-content">

                            <!-- 忘记密码表单 开始 -->
                            <form id="forget_pass_form" method="post">
                                <p class="status"></p>

                                <div class="form-group">
                                    <label for="password">用户名*</label>
                                    <input type="text" name="rember_username " class="form-control" id="uname" placeholder="请输入用户名" />
                                	<label id="unameErr"></label>
                                </div>
                                <div class="form-group">
                                    <label for="password">挽救码 *</label>
                                    <input type="text" name="rember_password " class="form-control" id="helpcode" placeholder="请输入挽救码" />
                                	<label id="helpcodeErr"></label>
                                </div>
                                <div class="form-group">
                                    <label for="password">新密码 *</label>
                                    <input type="password" name="rember_password " class="form-control" id="password2" placeholder="请输入新密码" />
                                	<label id="password2Err"></label>
                                </div>
								<div class="form-group">
                                    <input type="button" class="btn btn-main btn-effect nomargin" value="更 改" id="upd_password"/>
                                </div>
              
                            </form>
                            <!-- 忘记密码表单 结束 -->

                            <div class="bottom-links">
                                <a class="cancelClick" id="closeForgetUpw">取消</a>
                            </div>
								
                        </div><!-- 小 模 块 -->

                    </div>
                   <!-- ===== 忘记密码窗口 结束 ===== -->
			  </div>
                <!-- =============== 登录 & 注册 窗口 结束=============== -->

    </div>
			
    	<!-- =============== 登录注册模块 结束  =============== -->
    	
    <script type="text/javascript" src="${ctx}/static/jquery-3.2.1.js"></script>
<div class="modal fade" id="updUser">											
	<div class="modal-dialog">
		<div class="modal-content">
		  	<div class="modal-header">
		  		<h4 class="modal-title">编辑个人信息</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				
		  	</div>
		  	
		  	<div class="modal-body">
		  		<form action="${ctx}/updUser" method="post" enctype="multipart/form-data"  id="userForm">
		  			<img src="" id="tx" style="width:100px;height:100px;border-radius:100px;margin-left:170px;cursor:pointer;"><br/>
					<input type="hidden" value="${user.uid}" name="uid"/>
					更换头像：<input type="file" name="touxiang" id="touxiang"/><br/>
					用户名：<input type="text" name="uname" id="htname"/>
							<span id="updname" style="color:red;"></span><br/>
					邮箱：<input type="email" name="uemail" id="uemail"/>
							<span id="updemail" style="color:red;"></span><br/>
					手机号：<input type="text" name="uphone" id="uphone"/>
							<span id="updphone" style="color:red;"></span><br/>
					挽救码：<input type="text" name="helpcode" id="hthelpcode"/>
					角色:<input type="text" name="role" id="role" disabled="disabled"/>
				</form>
		  	</div>
		  	
		  	<div class="modal-footer">
		  		<button type="button" class="btn btn-primary qrxg" id="qrxg">确认修改</button>
		  		<button type="button" class="btn btn-default" data-dismiss="modal" id="qxxg">取消修改</button>
				
			</div>
		</div>
	</div>
</div>
    <script type="text/javascript">
    	$(function () {
    	
    	$(".wl").click(function () {
    		var user = "${user}";
    		if (user=="") {
    			alert("请先登录");
    		} else {
    			location.href="${ctx}/watch_later_show?uid=${user.uid}";
    		}
    	})
    	
    	// 根据登录状态显示不同的样式
    	if (${user != null}) {
    		$("#dlk").css("display","none");
    		$("#dlk2").css("display","block");
    		$("#dlk3").css("display","block");
    	} 
 
    	// 表单验证添加样式
    	$("#unErr").css({"color":"#dc3545","font-size":"12px"});
    	$("#pwErr").css({"color":"#dc3545","font-size":"12px"});
    	$("#movify_usernameErr").css({"color":"#dc3545","font-size":"12px"});
    	$("#movify_passwordErr").css({"color":"#dc3545","font-size":"12px"});
    	$("#movify_password2Err").css({"color":"#dc3545","font-size":"12px"});
    	$("#unameErr").css({"color":"#dc3545","font-size":"12px"});
    	$("#helpcodeErr").css({"color":"#dc3545","font-size":"12px"});
    	$("#password2Err").css({"color":"#dc3545","font-size":"12px"});
    	
    	var num = 0;
    		// 登录时对用户名校验
    		$("#username").blur(function () {
    			var username = $("#username");
    			var unErr = $("#unErr");
    			
    			
    			if (username.val().trim() == "") {
    				unErr.html("用户名不能为空 !");
    				username.css({"border":"1px solid #dc3545"});
    				return false;
    			}
    			
    			var reg1 = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
    			var reg2 = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
    			var reg3 = /^.{4,20}$/;
    			
    			
    			if (reg1.test(username.val())) {
    				num = 1;
    			} else if (reg2.test(username.val())) {
    				num = 2;
    			} else if (reg3.test(username.val())) {
    				num = 3;	
    			}
    			
    			if (!reg1.test(username.val()) &&
    				!reg2.test(username.val()) &&
    				!reg3.test(username.val())
    			) {
    				unErr.html("用户名不符合符合格式（4-20位的数字字母下划线） !");
    				username.css({"border":"1px solid #dc3545"});
    				return false;
    			}
    			unErr.html("");
    			return true;
    		})
    		
    		// 登录时对密码校验
    		$("#password").blur(function () {
    			var password = $("#password");
    			var pwErr = $("#pwErr");
   
    			if (password.val().trim() == "") {
    				pwErr.html("密码不能为空 !");
    				password.css({"border":"1px solid #dc3545"});
    				return false;
    			}
    			
    			if (!/^\w{6,20}$/.test(password.val())) {
    				pwErr.html("密码不符合格式（6-20位数字字母下划线 ）!");
    				password.css({"border":"1px solid #dc3545"});
    				return false;
    			}
    			pwErr.html("");
    			return true;
    		})
    		
    		// 登录异步请求
    		$("#denglu").click(function () {
    			$("#username").blur();
    			$("#password").blur();
    			
    			if ($("#unErr").html()=="" &&
    				$("#pwErr").html()=="" 
    			) {
    				$.ajax({
	    				url:"${ctx}/login",
	    				type:"post",
	    				datatype:"json",
	    				data:{
	    					"username":$("#username").val(),
	    					"password":$("#password").val(),
	    					"num":num,
	    				},
	    				success:function (msg) {
	    					if (msg == "1") {
	    						alert("登录成功，欢迎使用movify");
	    						window.location.reload();
	    					} else {
	    						alert("登录失败，用户名或密码错误");
	    					}
	    				}
	    			})
    			}	
    		})
    		
    		// 注册时对用户名校验
    		$("#movify_username").blur(function () {
    		
    			var username = $("#movify_username");
    			var muErr = $("#movify_usernameErr");
    			
    			
    			if (username.val().trim() == "") {
    				muErr.html("用户名不能为空 !");
    				username.css({"border":"1px solid #dc3545"});
    				return false;
    			}
    			
    			var reg = /^\w{4,20}$/;
    			if (!reg.test(username.val())) {
    				muErr.html("账号必须符合格式 !(4-20为字母数字下划线)");
    				username.css({"border":"1px solid #dc3545"});
    				return false;
    			}
    		
    			// 异步请求验证用户是否存在
    			$.ajax({
    				url:"${ctx}/unameIsExists",
    				data:{
    					"uname":$("#movify_username").val()
    				},
    				success:function (result) {
 						if (result=="2") {
 							muErr.html("用户已存在，请重新输入");
 							username.css({"border":"1px solid #dc3545"});
 							return false;
 						}
    				}
    			})
    			muErr.html("");
    		})
    		
    		// 注册时校验密码1
    		$("#movify_password").blur(function () {
    			var password = $("#movify_password");
    			var pwErr = $("#movify_passwordErr");
    			
    			if (password.val().trim() == "") {
    				pwErr.html("密码不能为空 !");
    				password.css({"border":"1px solid #dc3545"});
    				return false;
    			}
    			
    			if (!/^\w{6,20}$/.test(password.val())) {
    				pwErr.html("密码不符合格式（6-20位数字字母下划线 ）!");
    				password.css({"border":"1px solid #dc3545"});
    				return false;
    			}
    			pwErr.html("");
    			return true;
    		})
    		
    		// 注册时校验密码2
    		$("#movify_password2").blur(function () {
    			var password = $("#movify_password2");
    			var pwErr = $("#movify_password2Err");
    			
    			if (password.val().trim() == "") {
    				pwErr.html("密码不能为空 !");
    				password.css({"border":"1px solid #dc3545"});
    				return false;
    			}
    			
    			if (!/^\w{6,20}$/.test(password.val())) {
    				pwErr.html("密码不符合格式（6-20位数字字母下划线 ）!");
    				password.css({"border":"1px solid #dc3545"});
    				return false;
    			}
    			
    			if ($("#movify_password").val()!=password.val()) {
    				pwErr.html("两次密码不一致，请重新输入");
    				password.css({"border":"1px solid #dc3545"});
    				return false;
    			}
    			pwErr.html("");
    			return true;
    		})
    		
    		// 注册异步请求
    		$("#register").click(function () {
    			$("#movify_username").blur();
    			$("#movify_password").blur();
    			$("#movify_password2").blur();
    			
    			if ($("#movify_usernameErr").html()=="" &&
    				$("#movify_password").html()=="" &&
    				$("#movify_password2").html()==""
    			) {
    				$.ajax({
	    				url:"${ctx}/register",
	    				data:{
	    					"uname":$("#movify_username").val(),
	    					"upw":$("#movify_password2").val()
	    				},
	    				success:function (result) {
	    					if (result!="") {
	    						alert("注册成功,您的挽救码为："+result+"，请务必收好，找回密码时会用到");
	    						$("#closeRegister").click();
	    					} else {
	    						alert("注册失败，请重试！！");
	    					}
	    				}
	    			})
    			}
    		})
    		
    		// 忘记密码时对用户名进行验证
    		$("#uname").blur(function () {
    			var username = $("#uname");
    			var unErr = $("#unameErr");
    			
    			
    			if (username.val().trim() == "") {
    				unErr.html("用户名不能为空 !");
    				username.css({"border":"1px solid #dc3545"});
    				return false;
    			}
    			
    			var reg = /^.{4,20}$/;
    			
    			if (!reg.test(username.val())
    			) {
    				unErr.html("用户名不符合符合格式（4-20位的数字字母下划线） !");
    				username.css({"border":"1px solid #dc3545"});
    				return false;
    			}
    			
    			// 对用户名进行存在校验
    			$.ajax({
    				url:"${ctx}/unameIsExists",
    				data:{
    					"uname":$("#uname").val()
    				},
    				success:function (result) {
 						if (result!="2") {
 							unErr.html("用户不存在，请重新输入");
 							username.css({"border":"1px solid #dc3545"});
 							return false;
 						}
    				}
    			})
    			unErr.html("");
    		})
    		
    		// 忘记密码对挽救码验证
    		$("#helpcode").blur(function () {
    		var helpcode = $("#helpcode");
    		var helpcodeErr = $("#helpcodeErr");

    		if (helpcode.val().trim() == "") {
    				helpcodeErr.html("挽救码不能为空 !");
    				helpcode.css({"border":"1px solid #dc3545"});
    				return false;
    			}
    			
    			var reg = /^\d{6,}$/;
    			if (!reg.test(helpcode.val())) {
    				helpcodeErr.html("挽救码不符合格式（6位纯数字） !");
    				helpcode.css({"border":"1px solid #dc3545"});
    				return false;
    			}
    			
    			helpcodeErr.html("");
    			return true;
    		})
    		
    		// 忘记密码对密码验证
    		$("#password2").blur(function () {
    			var password = $("#password2");
    			var pwErr = $("#password2Err");
    			
    			if (password.val().trim() == "") {
    				pwErr.html("密码不能为空 !");
    				password.css({"border":"1px solid #dc3545"});
    				return false;
    			}
    			
    			if (!/^\w{6,20}$/.test(password.val())) {
    				pwErr.html("密码不符合格式（6-20位数字字母下划线 ）!");
    				password.css({"border":"1px solid #dc3545"});
    				return false;
    			}
    			pwErr.html("");
    			return true;
    		})
    	
    		// 忘记密码异步请求
    		$("#upd_password").click(function () {
    			$("#uname").blur();
    			$("#helpcode").blur();
    			$("#password2").blur();
	
    			if ($("#unameErr").html()=="" &&
    				$("#helpcodeErr").html()=="" &&
    				$("#password2Err").html()==""
    			) {
    				$.ajax({
	    				url:"${ctx}/forget_upw",
	    				type:"post",
	    				datatype:"json",
	    				data:{
	    					"username":$("#uname").val(),
	    					"helpcode":$("#helpcode").val(),
	    					"upw":$("#password2").val()
	    				},
	    				success:function (result) {
	    					if (result=="1") {
	    						alert("修改成功，快去登录吧");
	    						$("#closeForgetUpw").click();
	    					} else {
	    						alert("修改失败，用户名或挽救码错误");
	    					}
	    				}
	    			})
    			}   			
    		})
    		
    		$("#nv").click(function () {
    			$('html,body').animate({scrollTop: ($($(this).attr('href')).offset().top -50 )},1000);
    		})
    		$("#vlog2").click(function () {
    			$('html,body').animate({scrollTop: ($($(this).attr('href')).offset().top -50 )},1000);
    		})
    		$("#hv").click(function () {
    			$('html,body').animate({scrollTop: ($($(this).attr('href')).offset().top -50 )},1000);
    		})
    		$("#work2").click(function () {
    			$('html,body').animate({scrollTop: ($($(this).attr('href')).offset().top -50 )},1000);
    		})
    		$("#nb").click(function () {
    			$('html,body').animate({scrollTop: ($($(this).attr('href')).offset().top -50 )},1000);
    		})
    		$("#vip").click(function () {
    			$('html,body').animate({scrollTop: ($($(this).attr('href')).offset().top -50 )},1000);
    		})
    		
    		$("#fbbk").click(function () {
    			if (${user == null}) {
    				alert("请先登录");
    			} else{
    				location.href="${ctx}/blog_add";
    			}	
    		})
    		
    		$(".upVideo").click(function() {
    			if (${user == null || user == ""}) {
    				alert("请先登录");
    			} else {
    				location.href="${ctx}/video_add";
    			}
    		})
    		
    		$(".my_video").click(function() {
    			if (${user == null || user == ""}) {
    				alert("请先登录");
    			} else {
    				location.href="${ctx}/my_video?uid=${user.uid}";
    			}
    		})
    		
    		$(".my_blog").click(function() {
    			if (${user == null || user == ""}) {
    				alert("请先登录");
    			} else {
    				location.href="${ctx}/my_blog?uid=${user.uid}";
    			}
    		})
    		
    		$("#userPhoto").click(function () {
    			$.ajax({
    				url:"${ctx}/getUserInfo",
    				dataType:"json",
    				data:{
    					"uid":"${user.uid}"
    				},
    				success:function(result) {
    					$("#updUser").modal();
    					$("#htname").val(result.uname);
    					$("#uemail").val(result.uemail);
    					$("#uphone").val(result.uphone);
    					$("#hthelpcode").val(result.helpcode);
    					$("#role").val(result.rname);
    					$("#tx").attr("src",result.uphoto);
    				}
    			})
    		})
    		
    		
    		$("#qrxg").click(function() {
    			if ($("#touxiang").val().trim() !="" || $("#htname").val().trim() == "") {
    				$("#userForm").submit();
    			} else {
    				alert("头像和用户名必须填写");
    			}
    			
    		})
    		
    		$("#htname").blur(function () {
				$("#updname").html("");
				$("#htname").css({"border":"1px solid gary"});
    			if ($("#htname").val() != "${user.uname}") {
    				// 对用户名进行存在校验
		   			$.ajax({
		   				url:"${ctx}/unameIsExists",
		   				data:{
		   					"uname":$("#htname").val()
		   				},
		   				success:function (result) {
								if (result=="2") {
									$("#updname").html("用户已存在，请重新输入");
									$("#htname").css({"border":"1px solid #dc3545"});
									return;
								}
		   				}
		   			})
    			}	
    		})
    		
    		$("#uemail").blur(function () {
    			$("#updemail").html("");
				$("#uemail").css({"border":"1px solid gary"});
    			if ($("#uemail").val().trim() != "" 
    				&& $("#uemail").val() != null 
    				&& $("#uemail").val() != "${user.uemail}") {
    				$.ajax({
    					url:"${ctx}/uemailIsExists",
    					data:{
    						"uemail":$("#uemail").val()
    					},
    					success:function (result) {
    						if (result != "1") {
    							$("#updemail").html("该邮箱已绑定，请重新输入");
								$("#uemail").css({"border":"1px solid #dc3545"});
    						}
    					}
    				})
    			}
    		})
    		
    		$("#uphone").blur(function () {
    			$("#updphone").html("");
				$("#uphone").css({"border":"1px solid gary"});
    			if ($("#uphone").val().trim() != "" 
    				&& $("#uphone").val() != null 
    				&& $("#uphone").val() != "${user.uphone}") {
    				$.ajax({
    					url:"${ctx}/uphonelIsExists",
    					data:{
    						"uphone":$("#uphone").val()
    					},
    					success:function (result) {
    						if (result != "1") {
    							$("#updphone").html("该手机已绑定，请重新输入");
								$("#uphone").css({"border":"1px solid #dc3545"});
    						}
    					}
    				})
    			}
    		})
    	})
    </script>