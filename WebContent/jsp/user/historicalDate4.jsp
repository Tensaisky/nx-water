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

 
</body>
</html>

