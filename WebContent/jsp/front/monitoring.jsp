<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String company_name=request.getParameter("name");

%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- <meta name="viewport" content="initial-scale=1.0, user-scalable=no" /> -->
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=TkT6Gwuw682lu9gtRYAggS69XRSn5jrc"></script>
	<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
	<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" >
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
    <script type="text/javascript" src="../../js/echarts.min.js" ></script>	
    <script type="text/javascript" src="../../js/monitoring.js"></script>	
	<title>实时监测</title>
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
var DO=[]; var TUR=[]; var TEMP=[]; var COD=[]; var NH4=[];var PO4=[];
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
    DO.splice(0,DO.length);
    TUR.splice(0,TUR.length);
    TEMP.splice(0,TEMP.length);
    COD.splice(0,COD.length);
    NH4.splice(0,NH4.length);
    PO4.splice(0,PO4.length);
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
              DO.push(data[i].DO);
              TUR.push(data[i].TUR);
              TEMP.push(data[i].TEMP);
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
</script>
</head>
<body style="background-color: #fcf8e3; padding: 15px 15px 15px 15px"> 

   <div class="container-fluid" style=" padding:0px;">
	  <div class="row">
	      <div class="col-md-12" >
	         <div id="allmap" style=" height:200px; border-radius:8px; border:1px solid;"></div>
	      </div>         
	  </div>
	  
	  <div class="row">
	      <div class="col-md-12">
	         <div id="main" style="width:100%; height:300PX;border-radius:8px; border:1px solid;"></div>
	      </div>         
	  </div>
   </div>
	
	<script type="text/javascript">
    
    function  setoption(){    	
        option = {
           title: {
               text: "实时数据",
               subtext: ""
           },
           tooltip: {
               show: true,
               trigger: "axis"
           },
           legend: {
		    	
		        data:['PH值','电导率','溶解氧','浊度','温度','化学耗氧量','氨氮','磷酸盐']
		        
		    },
           toolbox: {
               show: true,
               restore: {show: false},
               magicType: {show: true, type: ["line", "bar"]},
               saveImage: {show: true}
           },
           xAxis: {
               type: 'category',
               data: id
           },
           yAxis: {
               type: "value"
           },
           series: [
        	  /*  {name: "PH", type: "line", data: PH}, */
        	   {name: "CON", type: "line", data: CON},
        	   {name: "DO", type: "line", data: DO},
        	 /*   {name: "TUR", type: "line", data: TUR}, */
        	    {name: "TEMP", type: "line", data: TEMP},
        	   {name: "COD", type: "line", data: COD},
        	   {name: "NH4", type: "line", data: NH4},
        	   {name: "PO4", type: "line", data: PO4} 
          ]
       }
       
    }   
</script>	 
	
	
</body>
</html>