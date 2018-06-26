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
	
	
	<link href="<%=request.getContextPath()%>/css/style.min.css" rel="stylesheet" />

		<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">  
		<link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">  
		<script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>  		
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
            <div class="row">
		        <div class="col-md-12">
                    <div class="panel panel-inverse" data-sortable-id="flot-chart-1">                    
                        <div class="panel-body">
                        
                               <div class="col-sm-2">
                                     <div class="form-group">
                                         <label>项目：</label> 
			                             <select id="pgroup" class="form-control"> 			                             								       									     
									     </select>
									     </div>
			                     </div>
			                     <div class="col-sm-2">
                                     <div class="form-group">
                                         <label>设备:</label> 
			                             <select id="rtu" class="form-control"> 									       
									      
									     </select>
									     </div>
			                     </div>
                              <div class='col-sm-3'>  
						            <div class="form-group">  
						                <label>开始时间：</label>  
						                <!--指定 date标记-->  
						                <div class='input-group date' id='datetimepicker1'>  
						                    <input id="startTime" type='text' class="form-control" />  
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
					                    <input type='text' id = "endTime" class="form-control" />  
					                    <span class="input-group-addon">  
					                        <span class="glyphicon glyphicon-calendar"></span>  
					                    </span>  
					                </div>  
					            </div>  
					        </div> 
					          <div class="col-sm-1" style="text-align:left;">
			                            <button type="submit" style="margin-top:25px;" id="btn_query" class="btn btn-primary" onclick="find()">查询</button>
			                            
			                        </div>
					        
					        
                        </div>
                    </div>
		        </div>		   
		    </div>		   
		    <div class="row">
		        <div class="col-md-12">
                    <div class="panel panel-inverse" data-sortable-id="flot-chart-1">
                       
                        <div class="panel-body">
                            <div id="hismain3" class="height-md"></div>
                        </div>
                    </div>
		        </div>		   
		    </div>


<script type="text/javascript">
/*定义全局存放数据的变量*/
var hismychart4;
var hisoption3={};
var id3=[];            
var NH4=[]; 
var PO4=[]; 
var COD=[];            
var TEMP=[]; 
var TUR=[]; 
var DO=[];            
var CON=[]; 
var PH=[]; 
var str=[];
$(document).ready(function() { 
	slexiangmu();
    sleEquipment();
	hismychart4 = echarts.init(document.getElementById("hismain3"));
    findByQuery();
    hissetoption3();//加载
    hismychart4.setOption(hisoption3);
    
 });
 function find(){
	    hismychart4.clear();//清注点  
	    id3.splice(0,id3.length);//清空数组
	    NH4.splice(0,NH4.length);
	    PO4.splice(0,PO4.length);
	    COD.splice(0,COD.length);
	    TEMP.splice(0,TEMP.length);
	    TUR.splice(0,TUR.length);
	    DO.splice(0,DO.length);
	    CON.splice(0,CON.length);
	    PH.splice(0,PH.length);
	    hismychart4 = echarts.init(document.getElementById("hismain3"));
	    findByQuery();
	    hissetoption3();//加载
	    hismychart4.setOption(hisoption3);
 }
function findByQuery(){
	var pgroup= $("#pgroup").find("option:selected").val();	
	var rtu= $("#rtu").find("option:selected").val();	
	var startTime=$("#startTime").val();	
	var endTime=$("#endTime").val();
	 
	$.ajax({
    	type : "post",
        async : false, //同步执行
        url : "${pageContext.request.contextPath}/hisDate?action=queryFind",
        data : {"pgroup":pgroup,"rtu":rtu,"startTime":startTime,"endTime":endTime},
        dataType : "json", //返回数据形式为json
        success: function (data) { 
             for(var i=0;i<data.length;i++){           	            	
               strs=data[i].time.split(" ");
               id3.push(strs[1]);
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
function slexiangmu(){
	$.ajax({
    	type : "post",
        async : false, //同步执行
        url : "${pageContext.request.contextPath}/hisDate?action=findAllGroup",
        data : {},
        dataType : "json", //返回数据形式为json
        success: function (data) {         	
        	 //清空下拉菜单
        	 $("#pgroup").empty();
        	 var optionString = "<option grade=\'请选择项目\' selected = \'selected\' disabled = \'disabled\'>--请选择项目--</option>";
        	 var beanList = data;            //返回的json数据
        	 if(beanList){                   //判断
                   for(var i=0; i<beanList.length; i++){ //遍历，动态赋值                	 
                       optionString +="<option grade=\""+beanList[i].PGROUP_ID+"\" value=\""+beanList[i].PGROUP_ID+"\"";  
                       optionString += ">"+beanList[i].PGROUP_DESC+"</option>";  //动态添加数据  
                   }  
        	       $("#pgroup").append(optionString);  // 为当前name为asd的select添加数据。
               }
        },
        error: erryFunction                 //错误时执行方法
    });
	  function erryFunction() {
	        alert("项目名称未获取成功！");
	    };
}
function sleEquipment(){
	$.ajax({
    	type : "post",
        async : false, //同步执行
        url : "${pageContext.request.contextPath}/hisDate?action=findAllEquipment",
        data : {},
        dataType : "json", //返回数据形式为json
        success: function (data) {         	
        	 //清空下拉菜单
        	 $("#rtu").empty();
        	 var optionString = "<option grade=\'请选择设备\' selected = \'selected\' disabled = \'disabled\'>--请选择设备--</option>";
        	 var beanList = data;            //返回的json数据
        	 if(beanList){                   //判断
                   for(var i=0; i<beanList.length; i++){ //遍历，动态赋值                	 
                       optionString +="<option grade=\""+beanList[i].RTU_ID+"\" value=\""+beanList[i].RTU_ID+"\"";  
                       optionString += ">"+beanList[i].RTU_DESC+"</option>";  //动态添加数据  
                   }  
        	       $("#rtu").append(optionString);  // 为当前name为asd的select添加数据。
               }
        },
        error: erryFunction                 //错误时执行方法
    });
	  function erryFunction() {
	        alert("设备未获取成功！");
	    };
}
function  hissetoption3(){    	
    hisoption3 = {
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
       dataZoom: [
           {
               show: true,
               realtime: true,
               start: 65,
               end: 85
           },
           {
               type: 'inside',
               realtime: true,
               start: 65,
               end: 85
           }
       ],
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

 
</body>
</html>

