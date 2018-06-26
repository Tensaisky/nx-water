<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
	<meta charset="utf-8" />
	<title>智能水监测管理系统</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	 <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" />       
	 <script src="<%=request.getContextPath()%>/js/jquery-3.2.1.js"></script>
	 <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
	
	<!-- ================== BEGIN BASE CSS STYLE ================== -->
	
	 <link href="<%=request.getContextPath()%>/css/jquery-ui.min.css" rel="stylesheet" /> 
	 <%-- <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" /> --%>                                        
	<link href="<%=request.getContextPath()%>/css/font-awesome.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/css/animate.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/css/style.min.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" id="theme" />
	<!-- ================== END BASE CSS STYLE ================== -->
	
	<!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
	<link href="<%=request.getContextPath()%>/css/jquery-jvectormap-1.2.2.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/css/jquery.gritter.css" rel="stylesheet" />
	<!-- ================== END PAGE LEVEL STYLE ================== -->
	
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	 <%-- <script src="<%=request.getContextPath()%>/js/jquery-3.2.1.js"></script> --%> 
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-table.css">     
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=TkT6Gwuw682lu9gtRYAggS69XRSn5jrc"></script>
	
	<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
   <!--  <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script> -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/echarts.min.js" ></script>	
    <script type="text/javascript" src="../../js/monitoring.js"></script>	
	
	
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
				<div class="navbar-header" style="width: 50%">
					<a style="color:#000; width: 100%;font-size: 24px;"  class="navbar-brand">智能水环境管理系统</a>
			        <button type="button" class="navbar-toggle" data-click="sidebar-toggled">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				
				</div>
				<ul class="nav navbar-nav navbar-right">
				
					<li class="dropdown navbar-user">
						<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
							
							<span class="hidden-xs">${user.USER_NAME}</span> <b class="caret"></b>
						</a>
						<ul class="dropdown-menu animated fadeInLeft">
					          <li><a href="javascript:;" style="color:#000000">个人中心</a></li>
					        <li><a href="${pageContext.request.contextPath }/login.jsp"style="color:#000000">退出</a></li>
						</ul>
					</li>
				</ul>

				 
			</div>
			<!-- end container-fluid -->
		</div>
		<!-- end #header -->
		
		<!-- begin #sidebar -->
		<div id="sidebar" class="sidebar">
			<!-- begin sidebar scrollbar -->
			<div data-scrollbar="true" data-height="100%">
			
				<!-- begin sidebar user -->
				<ul class="nav">
					<li class="nav-profile">
						<div class="image">
							<a ><img src="../../images/usst.png" alt="" /></a>
						</div>
						<div class="info">
							欢迎你！
							<small>${user.USER_NAME}</small>                             
						</div>
					</li>				
				</ul>
				<!-- end sidebar user -->
				<!-- begin sidebar nav -->
				<ul class="nav">
					<!--<li class="nav-header">Navigation</li>-->
					<li class="has-sub active">
						<a href="index.jsp" >						   
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
							<li><a href="../user/historicalDate.jsp">统计图</a></li>
							<li><a  href="../user/NewFile.jsp" >报表</a></li>
							
						</ul>
					</li>
					<li class="has-sub">
						<a href="javascript:;">
						    <b class="caret pull-right"></b>
						    <i class="fa fa-file-o"></i>
						    <span>管理</span> 
						</a>
						<ul class="sub-menu">
							<li><a href="../user/user3.jsp">用户管理</a></li>
							<li><a href="###" >系统设置</a></li>							
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
		  
		   <div class="row">
		      <div class="col-md-12">
		         <div class="panel panel-inverse" data-sortable-id="morris-chart-1">
		 
                        <div class="panel-body">
                            <div id="allmap" class="height-sm"></div>
                        </div>
		         </div>
		           
		      </div>
		      
		  </div> 
		  
		  
		 <div class="row">
		      <div class="col-md-3">
		         <div class="panel panel-inverse" data-sortable-id="morris-chart-1">
		               <div class="panel-heading">
                            <div class="panel-heading-btn">
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-repeat"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
                            </div>
                            <h4 class="panel-title">实时数据</h4>
                        </div>
                        <div class="panel-body"> 
	                                      
                            <div id="main" class="height-sm"></div>
                         </div>
		         </div>		           
		      </div>
		      <div class="col-md-3">
		         <div class="panel panel-inverse" data-sortable-id="morris-chart-1">
		               <div class="panel-heading">
                            <div class="panel-heading-btn">
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-repeat"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
                            </div>
                            <h4 class="panel-title">实时数据</h4>
                        </div>
                        <div class="panel-body"> 
	                         <div id="main1" class="height-sm"></div>                                   
                        </div>
		         </div>		           
		      </div>
		      <div class="col-md-3">
		         <div class="panel panel-inverse" data-sortable-id="morris-chart-1">
		               <div class="panel-heading">
                            <div class="panel-heading-btn">
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-repeat"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
                            </div>
                            <h4 class="panel-title">实时数据</h4>
                        </div>
                        <div class="panel-body"> 
	                         <div id="main2" class="height-sm"></div>                                   
                        </div>
		         </div>		           
		      </div>
		       <div class="col-md-3">
		         <div class="panel panel-inverse" data-sortable-id="morris-chart-1">
		               <div class="panel-heading">
                            <div class="panel-heading-btn">
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-repeat"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
                            </div>
                            <h4 class="panel-title">实时数据</h4>
                        </div>
                        <div class="panel-body"> 
	                         <div id="main3" class="height-sm"></div>                                   
                        </div>
		         </div>		           
		      </div>
		      		    		      	  		     
		  </div>
		
		
         
		</div>
		<!-- end #content -->		
		<!-- begin scroll to top btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
		<!-- end scroll to top btn -->
	</div>
	<!-- end page container -->
	
	<script type="text/javascript">   
	/*定义全局存放数据的变量*/
	var jd = [];
    var wd=[];
	var address=[];
	var phone=[];
	$(document).ready(function() {  
	    getdata();//获取数据
	    initMap();//加载地图
	    setInterval("frash()",10000); //刷新
	 });
	function frash(){
	    map.clearOverlays();//清空地图上标注点
	    getdata();
	    //alert("更新完成");
	    setinfo();//设置数据库信息
	    jd.splice(0,jd.length);//清空数组
	    wd.splice(0,wd.length);
	    address.splice(0,address.length);
	    phone.splice(0,phone.length);
	}
	function getdata(){
		 $.ajax({
		      type : "post",
		      async : false, //同步执行
		      url : "${pageContext.request.contextPath }/minitorServelet?action=findAllPosition",
		      data :{} ,
		      dataType : "json", //返回数据形式为json
		      scriptCharset: "utf-8",
		      success :  function(result) {
		            if (result) {
		                for(var i=0;i<result.length;i++){
		                   console.log(result[i].jd);	                   
		                   jd.push(result[i].jd);
		                   wd.push(result[i].wd);
		                   address.push(result[i].address);
		                   phone.push(result[i].phone);	     
		                   // alert(address[i]);    
		                 }    
		            } 		       	      
	       },
			error : function(errorMsg) {
			    alert("不好意思，图表请求数据失败啦!");
			}
	    })	;
	}
</script>
<script type="text/javascript">
/*定义全局存放数据的变量*/
var mychart;
var option={};
var id=[];            
var PH=[]; 
var CON=[];
$(document).ready(function() {  
	mychart = echarts.init(document.getElementById("main"));
    getdata1();//获取数据
    setoption();//加载
    mychart.setOption(option);
    setInterval("frash1()",5000); //刷新
 });
function frash1(){
	mychart.clear();//清空地图上标注点  
    id.splice(0,id.length);//清空数组
    PH.splice(0,PH.length);
    CON.splice(0,CON.length);
    mychart = echarts.init(document.getElementById("main"));
    getdata1();//获取数据
    setoption();//加载
    mychart.setOption(option);
    
}
function getdata1(){
	$.ajax({
    	type : "post",
        async : false, //同步执行
        url : "${pageContext.request.contextPath}/hisDate?action=findAllData",
        data : {},
        dataType : "json", //返回数据形式为json
        success: function (data) { 
             for(var i=data.length-5;i<data.length;i++){
              id.push(data[i].id);
              PH.push(data[i].PH);
              CON.push(data[i].CON);
             }
        },
        error: erryFunction                 //错误时执行方法
    });
    function erryFunction() {
        alert("数据没返回成功！");
    };
}
function  setoption(){    	
    option = {
       title: {
           text: "",
           subtext: ""
       },
       tooltip: {
           trigger: "axis",
           
       },
       legend: {
    	   
    	   data:['PH','CON']
       },
       toolbox: {
    	   show : true    
       },
       xAxis: {
           type: 'category',
           boundaryGap: false,
           data: id
       },
       yAxis: {
           type: "value"
       },
       series: [
    	    {name: "PH", type: "line", data: PH,markPoint: {
                data: [
                    {type: 'max', name: '最大值'},
                    {type: 'min', name: '最小值'}
                ]
            }}, 
    	   {name: "CON", type: "line", data: CON,markPoint: {
               data: [
                   {type: 'max', name: '最大值'},
                   {type: 'min', name: '最小值'}
               ]
           }},

      ]
   }
   
} 
</script>

<script type="text/javascript">
/*定义全局存放数据的变量*/
var mychart1;
var option1={};
var id1=[];            
var DO=[]; 
var TEMP=[];
$(document).ready(function() {  
	mychart1 = echarts.init(document.getElementById("main1"));
    getdata2();//获取数据
    setoption1();//加载
    mychart1.setOption(option1);
    setInterval("frash2()",5000); //刷新
 });
function frash2(){
	mychart1.clear();//清空地图上标注点  
    id1.splice(0,id1.length);//清空数组
    DO.splice(0,DO.length);
    TEMP.splice(0,TEMP.length);
    mychart1 = echarts.init(document.getElementById("main1"));
    getdata2();//获取数据
    setoption1();//加载
    mychart1.setOption(option1);
    
}
function getdata2(){
	$.ajax({
    	type : "post",
        async : false, //同步执行
        url : "${pageContext.request.contextPath}/hisDate?action=findAllData",
        data : {},
        dataType : "json", //返回数据形式为json
        success: function (data) { 
             for(var i=data.length-5;i<data.length;i++){
              id1.push(data[i].id);
              DO.push(data[i].DO);
              TEMP.push(data[i].TEMP);
             }
        },
        error: erryFunction                 //错误时执行方法
    });
    function erryFunction() {
        alert("数据没返回成功！");
    };
}
function  setoption1(){    	
    option1 = {
       title: {
           text: "",
           subtext: ""
       },
       tooltip: {
           trigger: "axis",
           
       },
       legend: {
    	   
    	   data:['DO','TEMP']
       },
       toolbox: {
    	   show : true    
       },
       xAxis: {
           type: 'category',
           boundaryGap: false,
           data: id1
       },
       yAxis: {
           type: "value"
       },
       series: [
    	    {name: "DO", type: "bar", data: DO,markPoint: {
                data: [
                    {type: 'max', name: '最大值'},
                    {type: 'min', name: '最小值'}
                ]
            }}, 
    	   {name: "TEMP", type: "bar", data: TEMP,markPoint: {
               data: [
                   {type: 'max', name: '最大值'},
                   {type: 'min', name: '最小值'}
               ]
           }},

      ]
   }
   
} 
</script>    
 
<script type="text/javascript">
/*定义全局存放数据的变量*/
var mychart3;
var option2={};
var id2=[];            
var TUR=[]; 
var COD=[];
$(document).ready(function() {  
	mychart3 = echarts.init(document.getElementById("main2"));
    getdata3();//获取数据
    setoption2();//加载
    mychart3.setOption(option2);
    setInterval("frash3()",5000); //刷新
 });
function frash3(){
	mychart3.clear();//清空地图上标注点  
    id2.splice(0,id2.length);//清空数组
    TUR.splice(0,TUR.length);
    COD.splice(0,COD.length);
    mychart3 = echarts.init(document.getElementById("main2"));
    getdata3();//获取数据
    setoption2();//加载
    mychart3.setOption(option2);
    
}
function getdata3(){
	$.ajax({
    	type : "post",
        async : false, //同步执行
        url : "${pageContext.request.contextPath}/hisDate?action=findAllData",
        data : {},
        dataType : "json", //返回数据形式为json
        success: function (data) { 
             for(var i=data.length-5;i<data.length;i++){
              id2.push(data[i].id);
              TUR.push(data[i].TUR);
              COD.push(data[i].COD);
             }
        },
        error: erryFunction                 //错误时执行方法
    });
    function erryFunction() {
        alert("数据没返回成功！");
    };
}
function  setoption2(){    	
    option2 = {
       title: {
           text: "",
           subtext: ""
       },
       tooltip: {
           trigger: "axis",
           
       },
       legend: {
    	   
    	   data:['TUR','COD']
       },
       toolbox: {
    	   show : true    
       },
       xAxis: {
           type: 'category',
           boundaryGap: false,
           data: id2
       },
       yAxis: {
           type: "value"
       },
       series: [
    	    {name: "TUR", type: "line", data: TUR,markPoint: {
                data: [
                    {type: 'max', name: '最大值'},
                    {type: 'min', name: '最小值'}
                ]
            }}, 
    	   {name: "COD", type: "line", data: COD,markPoint: {
               data: [
                   {type: 'max', name: '最大值'},
                   {type: 'min', name: '最小值'}
               ]
           }},

      ]
   }
   
} 
</script>
<script type="text/javascript">
/*定义全局存放数据的变量*/
var mychart4;
var option3={};
var id3=[];            
var NH4=[]; 
var PO4=[]; 
$(document).ready(function() {  
	mychart4 = echarts.init(document.getElementById("main3"));
    getdata4();//获取数据
    setoption3();//加载
    mychart4.setOption(option3);
    setInterval("frash4()",5000); //刷新
 });
function frash4(){
	mychart4.clear();//清空地图上标注点  
    id3.splice(0,id3.length);//清空数组
    NH4.splice(0,NH4.length);
    PO4.splice(0,PO4.length);
    mychart4 = echarts.init(document.getElementById("main3"));
    getdata4();//获取数据
    setoption3();//加载
    mychart4.setOption(option3);
    
}
function getdata4(){
	$.ajax({
    	type : "post",
        async : false, //同步执行
        url : "${pageContext.request.contextPath}/hisDate?action=findAllData",
        data : {},
        dataType : "json", //返回数据形式为json
        success: function (data) { 
             for(var i=data.length-5;i<data.length;i++){
              id3.push(data[i].id);
              NH4.push(data[i].NH4);
              PO4.push(data[i].PO4);  
             }
        },
        error: erryFunction                 //错误时执行方法
    });
    function erryFunction() {
        alert("数据没返回成功！");
    };
}
function  setoption3(){    	
    option3 = {
       title: {
           text: "",
           subtext: ""
       },
       tooltip: {
           trigger: "axis",
           
       },
       legend: {
    	   
    	   data:['NH4','PO4']
       },
       toolbox: {
    	   show : true    
       },
       xAxis: {
           type: 'category',
           boundaryGap: false,
           data: id3
       },
       yAxis: {
           type: "value"
       },
       series: [
    	    {name: "NH4", type: "bar", data: NH4,markPoint: {
                data: [
                    {type: 'max', name: '最大值'},
                    {type: 'min', name: '最小值'}
                ]
            }}, 
    	   {name: "PO4", type: "bar", data: PO4,markPoint: {
               data: [
                   {type: 'max', name: '最大值'},
                   {type: 'min', name: '最小值'}
               ]
           }},

      ]
   }
   
} 
</script> 	
	
	<!-- ================== BEGIN BASE JS ================== -->
	<!-- <script src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script> -->
	
	<script src="<%=request.getContextPath()%>/js/jquery-migrate-1.1.0.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
	<%-- <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script> --%>
	
	<!-- ================== END BASE JS ================== -->
	
	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
	<script src="<%=request.getContextPath()%>/js/jquery.slimscroll.min.js"></script>
	 <script src="<%=request.getContextPath()%>/js/jquery.cookie.js"></script>
	 
	 
	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
	<script src="<%=request.getContextPath()%>/js/jquery.gritter.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.flot.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.flot.time.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.flot.resize.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.flot.pie.min.js"></script>
	
	
	
	
	<script src="<%=request.getContextPath()%>/js/dashboard.min.js"></script> 
	<script src="<%=request.getContextPath()%>/js/apps.min.js"></script>
	<!-- ================== END PAGE LEVEL JS ================== -->
	
	<script>
		$(document).ready(function() {
			App.init();
			//Dashboard.init();
		});
	</script>
    	
</body>
</html>

