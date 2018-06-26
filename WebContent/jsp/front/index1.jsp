<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title>智慧水监测管理系统</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	 <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" />	      	
	 <link href="<%=request.getContextPath()%>/css/jquery-ui.min.css" rel="stylesheet" /> 	 	                                     
	<link href="<%=request.getContextPath()%>/css/font-awesome.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/css/animate.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/css/style.min.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" id="theme" />	
	<link href="<%=request.getContextPath()%>/css/jquery-jvectormap-1.2.2.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/css/jquery.gritter.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" >			 
    
	   
</head>
<body>
    
	<!-- begin #page-loader -->
	<div id="page-loader" class="fade in"><span class="spinner"></span></div>
	<!-- end #page-loader -->
	
	<!-- begin #page-container -->
	<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
		<!-- begin #header -->
		<div id="header" class="header navbar navbar-default navbar-fixed-top">
			<!-- begin container-fluid -->
			<div class="container-fluid">
				<!-- begin mobile sidebar expand / collapse button -->
				<div class="navbar-header">
					<a style="color:#000" href="index.jsp" class="navbar-brand"><span class="navbar-logo"></span>智慧水环境管理系统</a>
					<!-- <button type="button" class="navbar-toggle" data-click="collapse" data-target="#sidebar">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button> -->
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
			            <span class="sr-only">Toggle navigation</span>
			            <span class="icon-bar"></span>
			            <span class="icon-bar"></span>
			            <span class="icon-bar"></span>
			        </button>
				</div>
				<!-- end mobile sidebar expand / collapse button -->
				
				<!-- begin header navigation right -->
				<ul class="nav navbar-nav navbar-right">
							<li><a href="javascript:;" onclick="ajaxloa('../user/user4.jsp')" style="color: #000000">个人中心</a></li>
							<li><a href="${pageContext.request.contextPath }/userServlet?action=logout" style="color: #000000">退出</a></li>
						<!--</ul>
					</li>-->
				</ul>
				<!-- end header navigation right -->
			</div>
			<!-- end container-fluid -->
		</div>
		<!-- end #header -->
		
		<!-- begin #sidebar -->
		<div id="sidebar" class="sidebar">
			<!-- begin sidebar scrollbar -->
			<div  id="navbar" data-scrollbar="true" data-height="100%" style="background-color: #87AF4C;">
				<!-- begin sidebar user -->
				<ul class="nav">
					<li class="nav-profile">
						<div class="image">
							<a href="javascript:;"><img src="../../images/usst.png" alt="" /></a>
						</div>
						<div class="info">
							欢迎你！
							<small id="username">${user.USER_NAME}</small>
						</div>
					</li>
					
				
				</ul>
				<!-- end sidebar user -->
				<!-- begin sidebar nav -->
				<ul id="liang" class="nav">
				
				    
					<!--<li class="nav-header">Navigation</li>-->
					<li  class="has-sub ">
						<a  href="javascript:;" onclick="ajaxloa('../front/mon.jsp')"	>						   
						    <i class="fa fa-laptop"></i>
						    <span>实时监测</span>
					    </a>
						
					</li>
					
					<li class="has-sub ">
						<a href="javascript:;">
						    <b class="caret pull-right"></b>
						    <i class="fa fa-suitcase"></i>
						    <span>数据</span>
						</a>
						<ul class="sub-menu">
							<li><a href="javascript:;" onclick="ajaxloa('../user/historicalDate5.jsp')" >统计图</a></li>
							<li><a href="javascript:;" onclick="ajaxloa('../user/NewFile4.jsp')">报表</a></li>		
							
						</ul>
					</li>
					<li class="has-sub">
						<a href="javascript:;">
						    <b class="caret pull-right"></b>
						    <i class="fa fa-file-o"></i>
						    <span>管理</span> 
						</a>
						<ul class="sub-menu">
							<li><a href="javascript:;" onclick="ajaxloa('../user/user6.jsp')">用户管理</a></li>
							<li><a href="javascript:;" id="test">系统设置</a></li>							
						</ul>
					</li>
					<li class="has-sub">
						<a href="" >
						   <!-- <b class="caret pull-right"></b>-->
						    <i class="fa fa-warning"></i>
						    <span>故障警报</span>
						</a>			
					</li>
					<li class="has-sub">
						<a href="" >
						   <!-- <b class="caret pull-right"></b>-->
						    <i class="fa fa-th"></i>
						    <span>帮助 </span>
						</a>			
					</li>													
			        <!-- begin sidebar minify button -->
					<li><a href="javascript:;" class="sidebar-minify-btn" data-click="sidebar-minify" style="background-color:#87AF4C;"><i class="fa fa-angle-double-left"></i></a></li>
			        <!-- end sidebar minify button -->
				</ul>
				<!-- end sidebar nav -->
			</div>
			<!-- end sidebar scrollbar -->
		</div>
		<div class="sidebar-bg"></div>
		<!-- end #sidebar -->
		
		<!-- begin #content -->
		<div id="content" class="content">
		   <!--  已点次数： -->
       <!--   <span id="dianjicishu"></span>	 -->
           <div id="con"></div>
         
		</div>
		<!-- end #content -->		
		<!-- begin scroll to top btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
		<!-- end scroll to top btn -->
	</div>
	<!-- end page container -->

	
</body>
	<script src="<%=request.getContextPath()%>/js/jquery-3.2.1.js"></script>  
	<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>	
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=TkT6Gwuw682lu9gtRYAggS69XRSn5jrc"></script>
	 	
	<script src="<%=request.getContextPath()%>/js/jquery-migrate-1.1.0.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>	
	<script src="<%=request.getContextPath()%>/js/jquery.slimscroll.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/apps.min.js"></script>
    
    <script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>  		
		<script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script> 
    
	<script>
    var x=0;
    function ajaxloa(local){	
    	  x=x+1;
    	  if(x==1){
    		  $("#con").load(local); 
    		  
    	  }else{
    		  $("#con").load(local); 
    		  $("#con").load(local);
    	  }		     
    	 // document.getElementById('dianjicishu').innerHTML = x;       
       }
	   
		$(document).ready(function() {
			 $("#con").load('../front/mon.jsp');			
			 App.init();
			 
		});		
		function ajaxload(local){			  
			 htmlobj=$.ajax({url:local,async:false});
		      $("#con").html(htmlobj.responseText);
			
		  }
	</script>

</html>

