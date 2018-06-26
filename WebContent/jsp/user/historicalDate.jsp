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
	<%--  <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" /> --%>                                        
	<link href="<%=request.getContextPath()%>/css/font-awesome.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/css/animate.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/css/style.min.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" id="theme" />
	<!-- ================== END BASE CSS STYLE ================== -->
	
	<!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
	<link href="<%=request.getContextPath()%>/css/jquery-jvectormap-1.2.2.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/css/jquery.gritter.css" rel="stylesheet" />
	<!-- ================== END PAGE LEVEL STYLE ================== -->
	
		<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">  
		
		<script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>  
		<link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">  
		<script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script> 
		 <script type="text/javascript" src="<%=request.getContextPath()%>/js/echarts.min.js" ></script>	
        <script type="text/javascript">
		    $(function () {  
		        var picker1 = $('#datetimepicker1').datetimepicker({  
		            format: 'YYYY-MM-DD HH:mm',  
		            locale: moment.locale('zh-cn'),  
		            //minDate: '2016-7-1'  
		        });  
		        var picker2 = $('#datetimepicker2').datetimepicker({  
		            format: 'YYYY-MM-DD HH:mm',  
		            locale: moment.locale('zh-cn')  
		        });  
		        //动态设置最小值  
		        picker1.on('dp.change', function (e) {  
		            picker2.data('DateTimePicker').minDate(e.date);  
		        });  
		        //动态设置最大值  
		        picker2.on('dp.change', function (e) {  
		            picker1.data('DateTimePicker').maxDate(e.date);  
		        });      
	         });  
		</script>

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
					<li class="has-sub ">
						<a href="../front/index.jsp" >						   
						    <i class="fa fa-laptop"></i>
						    <span>实时监测</span>
					    </a>
						
					</li>
					<li class="has-sub active ">
						<a href="javascript:;">
						    <b class="caret pull-right"></b>
						    <i class="fa fa-suitcase"></i>
						    <span>数据</span>
						</a>
						<ul class="sub-menu">
							<li><a href="../user/historicalDate.jsp">统计图</a></li>
							<li><a href="../user/NewFile.jsp">报表</a></li>
							
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
							<li><a href="form_plugins.html">系统设置</a></li>
							
							
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
						<a href="#" onclick="showAtRight('help.html')">
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
                    <div class="panel panel-inverse" data-sortable-id="flot-chart-1">
                       
                        <div class="panel-body">
                        <form action="">
                               <div class="col-sm-2">
                                     <div class="form-group">
                                         <label>项目：</label> 
			                             <select id="pgroup" class="form-control"> 									       
									       <option>1</option> 
									       <option>2</option> 
									       <option>3</option> 
									       <option>4</option> 
									       <option>5</option> 
									     </select>
									     </div>
			                     </div>
			                     <div class="col-sm-2">
                                     <div class="form-group">
                                         <label>设备:</label> 
			                             <select class="form-control"> 									       
									       <option>1</option> 
									       <option>2</option> 
									       <option>3</option> 
									       <option>4</option> 
									       <option>5</option> 
									     </select>
									     </div>
			                     </div>
                              <div class='col-sm-3'>  
						            <div class="form-group">  
						                <label>开始时间：</label>  
						                <!--指定 date标记-->  
						                <div class='input-group date' id='datetimepicker1'>  
						                    <input type='text' class="form-control" />  
						                    <span class="input-group-addon">  
						                        <span class="glyphicon glyphicon-calendar"></span>  
						                    </span>  
						                </div>  
						            </div>  
						      </div>  
					        <div class='col-sm-3'>  
					            <div class="form-group">  
					                <label>结束时间：</label>  
					                <!--指定 date标记-->  
					                <div class='input-group date' id='datetimepicker2'>  
					                    <input type='text' class="form-control" />  
					                    <span class="input-group-addon">  
					                        <span class="glyphicon glyphicon-calendar"></span>  
					                    </span>  
					                </div>  
					            </div>  
					        </div> 
					          <div class="col-sm-1" style="text-align:left;">
			                            <button type="submit" style="margin-top:25px;" id="btn_query" class="btn btn-primary">查询</button>
			                        </div>
					        
					        </form>
                        </div>
                    </div>
		        </div>		   
		    </div>		   
		    <div class="row">
		        <div class="col-md-12">
                    <div class="panel panel-inverse" data-sortable-id="flot-chart-1">
                       
                        <div class="panel-body">
                            <div id="main3" class="height-md"></div>
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
var mychart4;
var option3={};
var id3=[];            
var NH4=[]; 
var PO4=[]; 
var COD=[];            
var TEMP=[]; 
var TUR=[]; 
var DO=[];            
var CON=[]; 
var PH=[]; 
$(document).ready(function() {  
	mychart4 = echarts.init(document.getElementById("main3"));
    getdata4();//获取数据
    setoption3();//加载
    mychart4.setOption(option3);
 });

function getdata4(){
	$.ajax({
    	type : "post",
        async : false, //同步执行
        url : "${pageContext.request.contextPath}/hisDate?action=findAllData",
        data : {},
        dataType : "json", //返回数据形式为json
        success: function (data) { 
             for(var i=0;i<data.length;i++){
              id3.push(data[i].id);
              NH4.push(data[i].NH4);
              PO4.push(data[i].PO4);
              COD.push(data[i].COD);
              TEMP.push(data[i].TEMP);
              TUR.push(data[i].TUR);  
              DO.push(data[i].DO);
              CON.push(data[i].CON);
              PH.push(data[i].PH);  
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
           text: "监测数据",
           subtext: ""
       },
       tooltip: {
           trigger: "axis",
           
       },
       legend: {
    	   
    	   data:['PH值','电导率','溶解氧','浊度','温度','化学耗氧量','氨氮','磷酸盐']
       },
       toolbox: {
	        show : true,
	        feature : {
	            magicType : {show: true, type: ['bar', 'line']},
	            restore : {show: true},
	            saveAsImage : {show: true}           
	        }
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
    	    {name: "PH值", type: "line", data: PH,markPoint: {
                data: [
                    {type: 'max', name: '最大值'},
                    {type: 'min', name: '最小值'}
                ]
            }}, 
    	   {name: "电导率", type: "line", data: CON,markPoint: {
               data: [
                   {type: 'max', name: '最大值'},
                   {type: 'min', name: '最小值'}
               ]
           }},
           {name: "溶解氧", type: "line", data: DO,markPoint: {
               data: [
                   {type: 'max', name: '最大值'},
                   {type: 'min', name: '最小值'}
               ]
           }},
           {name: "浊度", type: "line", data: TUR,markPoint: {
               data: [
                   {type: 'max', name: '最大值'},
                   {type: 'min', name: '最小值'}
               ]
           }},
           {name: "温度", type: "line", data: TEMP,markPoint: {
               data: [
                   {type: 'max', name: '最大值'},
                   {type: 'min', name: '最小值'}
               ]
           }},
           {name: "化学耗氧量", type: "line", data: COD,markPoint: {
               data: [
                   {type: 'max', name: '最大值'},
                   {type: 'min', name: '最小值'}
               ]
           }},
           {name: "氨氮", type: "line", data: NH4,markPoint: {
               data: [
                   {type: 'max', name: '最大值'},
                   {type: 'min', name: '最小值'}
               ]
           }},
           {name: "磷酸盐", type: "line", data: PO4,markPoint: {
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
	
     <script src="<%=request.getContextPath()%>/js/jquery-migrate-1.1.0.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.slimscroll.min.js"></script>
	<!-- ================== END BASE JS ================== -->
	
	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
	<script src="<%=request.getContextPath()%>/js/apps.min.js"></script>
	<!-- ================== END PAGE LEVEL JS ================== -->
	
	<script>
		$(document).ready(function() {
			App.init();
			/*Dashboard.init();*/
		});
	</script>
 
</body>
</html>

