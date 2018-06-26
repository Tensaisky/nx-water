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
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/echarts.min.js" ></script>	
  	
	
	
</head>
<body>
   
	                                      
<div id="main3" class="height-sm" style="height: 500px;width: 100%"></div>
 

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
	        	 dataZoom: {
	                 yAxisIndex: 'none'
	             },
	            dataView : {show: true, readOnly: false},
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
</body>
</html>

