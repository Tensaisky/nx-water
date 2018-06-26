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

	       
	 <script src="<%=request.getContextPath()%>/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/echarts.min.js" ></script>	
	
	
	
</head>
<body>
                          
<div id="main" style="width: 400px"></div>                       
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

    	
</body>
</html>

