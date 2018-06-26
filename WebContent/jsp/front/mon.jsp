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
		                                       
	<link href="<%=request.getContextPath()%>/css/font-awesome.css" rel="stylesheet" />	
	<link href="<%=request.getContextPath()%>/css/style.min.css" rel="stylesheet" />	
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" >	
	 <script src="<%=request.getContextPath()%>/js/jquery-3.2.1.js"></script>
	 <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script> 
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=TkT6Gwuw682lu9gtRYAggS69XRSn5jrc"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/echarts.min.js" ></script>	
    <script type="text/javascript" src="../../js/monitoring.js"></script>	
	
	
</head>
<body>		  
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
		      <div class="col-md-6">
		         <div class="panel panel-inverse" data-sortable-id="morris-chart-1">
		               <div class="panel-heading">
                            <h4 class="panel-title">实时数据</h4>
                        </div>
                        <div class="panel-body"> 
	                                      
                            <div id="main" class="height-sm"></div>
                         </div>
		         </div>		           
		      </div>
		      <div class="col-md-6">
		         <div class="panel panel-inverse" data-sortable-id="morris-chart-1">
		               <div class="panel-heading">
                            <h4 class="panel-title">实时数据</h4>
                        </div>
                        <div class="panel-body"> 
	                         <div id="main2" class="height-sm"></div>                                   
                        </div>
		         </div>		           
		      </div>		      		    		      	  		     
		  </div>

	
	<script type="text/javascript">   
	/*定义全局存放数据的变量*/
	var mapid = [];
	var mapjd = [];
    var mapwd=[];
    var maptime = [];
    
    var mapNH4=[]; 
    var mapPO4=[]; 
    var mapCOD=[];            
    var mapTEMP=[]; 
    var mapTUR=[]; 
    var mapDO=[];            
    var mapCON=[]; 
    var mapPH=[]; 
	$(document).ready(function() {  
	    getdata();//获取数据
	    initMap();//加载地图
	    setInterval("frash()",20000); //刷新
	 });
	function frash(){
	    map.clearOverlays();//清空地图上标注点
	    getdata();
	    //alert("更新完成");
	    setinfo();//设置数据库信息
	    mapid.splice(0,mapid.length);//清空数组
	    mapjd.splice(0,mapjd.length);//清空数组
	    mapwd.splice(0,mapwd.length);
	    maptime.splice(0,maptime.length);//清空数组
	   
	    mapPH.splice(0,mapPH.length);
	    mapDO.splice(0,mapDO.length);
	    mapCON.splice(0,mapCON.length);
	    mapTEMP.splice(0,mapTEMP.length);
	    
	    mapTUR.splice(0,mapTUR.length);
	    mapNH4.splice(0,mapNH4.length);
	    mapPO4.splice(0,mapPO4.length);
	    mapCOD.splice(0,mapCOD.length);
	    
	}
	function getdata(){
		 $.ajax({
		      type : "post",
		      async : false, //同步执行
		      url : "${pageContext.request.contextPath }/minitorServelet?action=mapShow",
		      data :{} ,
		      dataType : "json", //返回数据形式为json
		      scriptCharset: "utf-8",
		      success :  function(result) {
		    	 
		            if (result) {
		                for(var i=0;i<result.length;i++){
		                	mapid.push(result[i].id); 		                	
		                	mapjd.push(result[i].jd);		                	
		                	mapwd.push(result[i].wd);		                
		                	maptime.push(result[i].time);	
		                	
		                	mapPH.push(result[i].PH);	
		                	mapDO.push(result[i].DO);	
		                	mapCON.push(result[i].CON);	
		                	mapNH4.push(result[i].NH4);	
		                	
		                	mapTEMP.push(result[i].TEMP);	
		                	mapTUR.push(result[i].TUR);	
		                	mapPO4.push(result[i].PO4);	
		                	mapCOD.push(result[i].COD);	
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
var DO=[]; 
var TEMP=[];
var strs=[];
$(document).ready(function() {  
	mychart = echarts.init(document.getElementById("main"));
    getdata1();//获取数据
    setoption();//加载
    mychart.setOption(option);
    setInterval("frash1()",25000); //刷新
 });
function frash1(){
	mychart.clear();//清空地图上标注点  
    id.splice(0,id.length);//清空数组
    PH.splice(0,PH.length);
    DO.splice(0,DO.length);
    CON.splice(0,CON.length);
    TEMP.splice(0,TEMP.length);
    mychart = echarts.init(document.getElementById("main"));
    getdata1();//获取数据
    setoption();//加载
    mychart.setOption(option);
    
}
function getdata1(){
	$.ajax({
    	type : "post",
        async : false, //同步执行
        url : "${pageContext.request.contextPath}/hisDate?action=findd",
        data : {},
        dataType : "json", //返回数据形式为json
        success: function (data) { 
             for(var i=data.length-5;i<data.length;i++){
              strs=data[i].time.split(" ");
              id.push(strs[1]);
              PH.push(data[i].PH);
              CON.push(data[i].CON);
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
    	   
    	   data:['PH值','电导率','溶解氧','温度']
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
           {name: "温度", type: "line", data: TEMP,markPoint: {
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
var NH4=[]; 
var PO4=[];
var str1=[];
$(document).ready(function() {  
	mychart3 = echarts.init(document.getElementById("main2"));
    getdata3();//获取数据
    setoption2();//加载
    mychart3.setOption(option2);
    setInterval("frash3()",15000); //刷新
 });
function frash3(){
	mychart3.clear();//清空地图上标注点  
    id2.splice(0,id2.length);//清空数组
    TUR.splice(0,TUR.length);
    COD.splice(0,COD.length);
    NH4.splice(0,NH4.length);
    PO4.splice(0,PO4.length);
    mychart3 = echarts.init(document.getElementById("main2"));
    getdata3();//获取数据
    setoption2();//加载
    mychart3.setOption(option2);
    
}
function getdata3(){
	$.ajax({
    	type : "post",
        async : false, //同步执行
        url : "${pageContext.request.contextPath}/hisDate?action=findd",
        data : {},
        dataType : "json", //返回数据形式为json
        success: function (data) { 
             for(var i=data.length-5;i<data.length;i++){
              str1=data[i].time.split(" ");
              id2.push(str1[1]);
             
              TUR.push(data[i].TUR);
              COD.push(data[i].COD);
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
    	   
    	   data:['浊度','化学耗氧量','氨氮','磷酸盐']
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
    	   
    	    {name: "浊度", type: "line", data: TUR,markPoint: {
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

</body>
</html>

