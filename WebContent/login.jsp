<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
	<meta charset="utf-8" />
	<title>用户登录</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	
	<!-- ================== BEGIN BASE CSS STYLE ================== -->
	<link href="css/bootstrap.min.css" rel="stylesheet" />
	<link href="css/font-awesome.css" rel="stylesheet" />
	<link href="css/animate.css" rel="stylesheet" />
	 <link href="css/style.min.css" rel="stylesheet" /> 
	<!-- ================== END BASE CSS STYLE ================== -->
</head>
<body>
	<!-- begin #page-loader -->
	<div id="page-loader" class="fade in"><span class="spinner"></span></div>
	<!-- end #page-loader -->
	
	<div class="login-cover">
	    <div class="login-cover-image"><img src="assets/img/login-bg/5.jpg" data-id="login-cover-image" alt="" /></div>
	    <div class="login-cover-bg"></div>
	</div>
	<!-- begin #page-container -->
	<div id="page-container" class="fade">
	    <!-- begin login -->
        <div class="login login-v2" data-pageload-addclass="animated flipInX">
            <!-- begin brand -->
            <div class="login-header">
                <div class="brand">
                    <span class="logo"></span>智慧水环境管理系统
                   
                </div>
                <div class="icon">
                    <i class="fa fa-sign-out" aria-hidden="true"></i>
                </div>
            </div>
            <!-- end brand -->
            <div class="login-content">
                <form  action="${pageContext.request.contextPath }/userServlet?action=login" method="POST" class="margin-bottom-0">
                    <div style="color: red">${msg}</div>
                    <div class="form-group m-b-20">
                        <input name="USER_NAME" type="text" class="form-control input-lg" placeholder="账号" / style="font-size: 22px;">
                    </div>
                    <div class="form-group m-b-20">
                        <input name="USER_PSW" type="password" class="form-control input-lg" placeholder="密码" style="font-size: 22px;" />
                    </div>
                    <div class="checkbox m-b-20" >
                        <label>
                            <input type="checkbox" /> 记住我
                        </label>
                    </div>
                    <div class="login-buttons">
                        <button type="submit" class="btn btn-success btn-block btn-lg">登&nbsp;&nbsp;&nbsp;&nbsp;录</button>
                    </div>
                    <div class="m-t-20">
                       还未注册? 请 <a href="#">点击</a> 注册.
                    </div>
                </form>
            </div>
        </div>
        <!-- end login -->
	</div>
	<!-- end page container -->
	
	<!-- ================== BEGIN BASE JS ================== -->
	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="js/jquery-migrate-1.1.0.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!--[if lt IE 9]>
		<script src="assets/crossbrowserjs/html5shiv.js"></script>
		<script src="assets/crossbrowserjs/respond.min.js"></script>
		<script src="assets/crossbrowserjs/excanvas.min.js"></script>
	<![endif]-->
	<script src="js/jquery.slimscroll.min.js"></script>
	<script src="js/jquery.cookie.js"></script>
	<!-- ================== END BASE JS ================== -->
	
	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
	<script src="js/apps.min.js"></script>
	<!-- ================== END PAGE LEVEL JS ================== -->

	<script>
		$(document).ready(function() {
			App.init();
		});
	</script>
	 
</body>
</html>