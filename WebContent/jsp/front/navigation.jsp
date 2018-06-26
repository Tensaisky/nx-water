<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>主页</title>
		
		<link rel="stylesheet" href="../../css/font-awesome.css">
		<link rel="stylesheet" href="../../css/index.css">	<!-- 修改自Bootstrap官方Demon，你可以按自己的喜好制定CSS样式 -->
		<link rel="stylesheet" href="../../css/font-change.css">	<!-- 将默认字体从宋体换成微软雅黑（个人比较喜欢微软雅黑，移动端和桌面端显示效果比较接近） -->	
		<link rel="stylesheet" href="../../css/bootstrap.min.css" />
		
		
		<link rel="stylesheet" href="../../css/indexstyle.css" />
        
       <!-- <link rel="stylesheet" href="../../css/map.css" />-->
       <script type="text/javascript" src="../../js/jquery-3.2.1.js" ></script>
		
		<script type="text/javascript" src="../../js/bootstrap.min.js" ></script>
       
        <script type="text/javascript" src="../../js/echarts.min.js" ></script>
	</head>
	<body>
	    <!-- 左侧菜单选项========================================= -->
		<div class="container-fluid">
			<div class="row-fluie">
				<div class="col-sm-3 col-md-2 sidebar">		
					
					
				</div>
			</div>
		</div>  
		<!--导航-->
		<nav id="navig" class="navbar navbar-default navbar-fixed-top">
		    <div class="container-fluid">				        
		        <!--导航-->
		        <div id="noo">		        	
		        		<ul class="nav navbar-pills nav-stacked">
				        	<li class="nav-header">
			                    <div class="dropdown profile-element">
			                        <span><img alt="image" class="img-circle" src="../../images/usst.png" style="margin-top: 10px;"></span>			                        
									<ul class="nav nav-pills">
										<li class="dropdown all-camera-dropdown">
											<a class="dropdown-toggle" data-toggle="dropdown" href="#">
												${user.USER_NAME}
												<b class="caret"></b>
											</a>
											<ul class="dropdown-menu">
												<li data-filter-camera-type="all"><a data-toggle="tab" href="#"><i class="fa  fa-user"></i>&nbsp;个人中心</a></li>
									            <li data-filter-camera-type="Bravo"><a href = "#" onclick="window.top.location.href='${pageContext.request.contextPath }/userServlet?action=logout'"><i class="fa fa-power-off"></i>&nbsp;退出</a></li>
											</ul>
										</li>
									</ul>
			                    </div>
			                </li>
			                 <li><a class="na-li" href="monitoring.jsp" target="main">
			                 	<i class="fa  fa-eye"></i>&nbsp; 实时监控 <span class="sr-only">(current)</span></a>
			                 </li>
						    <li><a class="na-li" href="#productMeun" class="nav-header menu-first collapsed" data-toggle="collapse">
							   <i class="fa  fa-database"></i>&nbsp; 数据统计 <span class="sr-only">(current)</span></a>
						    </li> 
							<ul id="productMeun" class="nav nav-list collapse menu-second">
								<li><a class="na-li"href="../user/historicalDate1.jsp" target="main" ><i class="fa fa-list-alt"></i>&nbsp;折线图</a></li>
								<li><a class="na-li"href="${pageContext.request.contextPath}/dataRep?action=findDataByTime" target="main"><i class="fa fa-th"></i>&nbsp;&nbsp;报&nbsp;&nbsp;&nbsp;表</a></li>
							</ul>
			                <li><a class="na-li" href="#recordMeun" class="nav-header menu-first collapsed" data-toggle="collapse">
							    <i class="fa fa-cog"></i>&nbsp; 用户设置<span class="sr-only">(current)</span></a>
						    </li> 
							<ul id="recordMeun" class="nav nav-list collapse menu-second">
								<li><a class="na-li"href="../admin/systemSettings.html" target="main"><i class="fa fa-wrench"></i> 系统设置</a></li>
								<li><a class="na-li"href="../user/warning.html" target="main"><i class="fa fa-bell"></i> 故障警报</a></li>
								<li><a class="na-li"href="${pageContext.request.contextPath}/admin?action=pagination" target="main"><i class="fa fa-list"></i> 个人中心</a></li>
							</ul>
			                <li><a class="na-li" href="help.html" target="main" ><i class="fa fa-tag"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;帮&nbsp;&nbsp;助&nbsp;</a></li> 
			               
			                
		              </ul>		        	   
		        </div>
		        <!--导航-->		
		    </div>
		</nav>
		<!--导航-->	
			       
		
		
	</body>
</html>
