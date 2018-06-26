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
	       
	 <script src="<%=request.getContextPath()%>/js/jquery-3.2.1.js"></script>
	 <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
	 
	<link href="<%=request.getContextPath()%>/css/font-awesome.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" /> 
	<link href="<%=request.getContextPath()%>/css/style.min.css" rel="stylesheet" />

	 <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-table.css">     
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=TkT6Gwuw682lu9gtRYAggS69XRSn5jrc"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/echarts.min.js" ></script>	
    <script type="text/javascript" src="../../js/monitoring.js"></script>	
	
	
</head>
<body>

		  
		   <div class="row">
		      <div class="col-md-12">
		         <div class="panel panel-inverse" data-sortable-id="morris-chart-1">
		               <div class="panel-heading">
                            <div class="panel-heading-btn">
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-repeat"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
                            </div>
                            <h4 class="panel-title">设备分布</h4>
                        </div>
                        <div class="panel-body">
                            <div id="allmap" class="height-sm"></div>
                        </div>
		         </div>
		           
		      </div>
		      
		  </div> 
		  
		  
		 <div class="row">
		      <div class="col-md-12">
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
	                        <div class="row">	                           
	                           <div class="col-xs-1" >	                           
	                           <select class="form-control selectpicker" data-size="6" data-live-search="true" data-style="btn-danger" style="width:72%" >
	                                            <option value="" style="color: #b6b6b6" disabled selected>设备</option>
	                                            <option value="one" >设备1</option>
	                                            <option value="AF">设备2</option>
	                                            <option value="AL">设备3</option>
	                                            <option value="DZ">设备4</option>	                                           
	                                        </select>
	                           </div>
	                           <div class="col-xs-1">	                           
	                           <select class="form-control selectpicker" data-size="6" data-live-search="true" data-style="btn-danger" style="width:72%" >
	                                            <option value="" style="color: #b6b6b6" disabled selected>项目</option>
	                                            <option value="one" >项目1</option>
	                                            <option value="AF">项目2</option>
	                                            <option value="AL">项目3</option>
	                                            <option value="DZ">项目4</option>	                                           
	                                        </select>
	                           </div>
	                           <div class="col-xs-4">	                           
	                                <label class="control-label">Inline Checkbox</label>
	                                <div >
                                        <label class="checkbox-inline">
                                            <input type="checkbox" value="" />
                                            Checkbox Label 1
                                        </label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" value="" />
                                            Checkbox Label 2
                                        </label>
                                    </div>
	                           </div>
	                        </div>                           
                            <div id="main" class="height-sm"></div>
                         </div>
		         </div>		           
		      </div>
		    
		    
		      	  		     
		  </div>
		
		
         

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
/* var DO=[]; var TUR=[]; var TEMP=[]; var COD=[]; var NH4=[];var PO4=[]; */
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
   /*  DO.splice(0,DO.length);
    TUR.splice(0,TUR.length);
    TEMP.splice(0,TEMP.length);
    COD.splice(0,COD.length);
    NH4.splice(0,NH4.length);
    PO4.splice(0,PO4.length); */
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
             /*  DO.push(data[i].DO);
              TUR.push(data[i].TUR);
              TEMP.push(data[i].TEMP);
              COD.push(data[i].COD);
              NH4.push(data[i].NH4);
              PO4.push(data[i].PO4); */
             }
        },
        error: erryFunction                 //错误时执行方法
    });
    function erryFunction() {
        alert("数据没返回成功！");
    };
}
</script>
<script src="<%=request.getContextPath()%>/js/main.js"></script>	 
	
	
	<!-- ================== BEGIN BASE JS ================== -->
	<!-- <script src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script> -->
	
	<script src="<%=request.getContextPath()%>/js/jquery-migrate-1.1.0.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
	
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

