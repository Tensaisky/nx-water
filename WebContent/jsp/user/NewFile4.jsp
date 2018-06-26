<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  
<!DOCTYPE html>
<html lang="en">
<!--<![endif]-->
<head>

	<meta charset="utf-8" />
	<title>智能水监测管理系统</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />	    	       

	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-table.css">  	  
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" > 
	<link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">     
</head>
<body>
      
      <div class="panel panel-primary">  
        <div class="panel-heading">  
            <div class="panel-title"><a  data-parent="mypanel" >历史数据</a></div>  
        </div>  
        <div id="item2" class="panel-collapse ">  
            <div class="panel-body"> 
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
                <table id="tb_departments"></table>
            </div>  
        </div>  
    </div>	
    <script src="<%=request.getContextPath()%>/js/jquery-3.2.1.js" ></script>		
    <script src="../../js/bootstrap-table.js"></script>
    <script src="../../js/bootstrap-table-zh-CN.js"></script>    
     <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script> 
     <script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>  		
		<script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script> 
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
    <script type="text/javascript">
   
	 $(function () {
		    slexiangmu();
		    sleEquipment();
	        //1.初始化Table
	        var oTable = new TableInit();
	        oTable.Init();

	        //2.初始化Button的点击事件
	        var oButtonInit = new ButtonInit();
	        oButtonInit.Init();

	    });
	 
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
		        	 var optionString ;
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
		        	 var optionString ;
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
	   function	find(){
		    //1.初始化Table
	        var oTable = new TableInit();
	        oTable.Init();
			
	   }
	    var TableInit = function () {
	        var oTableInit = new Object();
	        //初始化Table
	        oTableInit.Init = function () {
	        	$("#tb_departments").bootstrapTable('destroy'); 
	            $('#tb_departments').bootstrapTable({
	                url: "${pageContext.request.contextPath}/dataRep?action=hisfind",//请求后台的URL（*）
	                method: 'get',                      //请求方式（*）
	                toolbar: '#toolbar',                //工具按钮用哪个容器
	                striped: true,                      //是否显示行间隔色
	                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
	                pagination: true,                   //是否显示分页（*）
	                queryParams: oTableInit.queryParams,//传递参数（*）
	                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
	                pageNumber:1,                       //初始化加载第一页，默认第一页
	                pageSize: 10,                       //每页的记录行数（*）
	                pageList: [2,5,10, 25, 50, 100],        //可供选择的每页的行数（*）	              
	                showColumns: true,                  //是否显示所有的列
	                showRefresh: true,                  //是否显示刷新按钮
	                minimumCountColumns: 2,             //最少允许的列数
	                clickToSelect: true,                //是否启用点击选中行
	                height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
	                uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
	                showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
	                cardView: false,                    //是否显示详细视图
	                detailView: false,                   //是否显示父子表
	                showExport: true,                     //是否显示导出
	                exportDataType: "basic",              //basic', 'all', 'selected'.
	                columns: [{
	                    checkbox: true
	                }, {
	                    field: 'time',
	                    title: '监测时间'
	                }, {
	                    field: 'TUR',
	                    title: '浊度'
	                }, {
	                    field: 'TEMP',
	                    title: '温度'
	                }, {
	                    field: 'PO4',
	                    title: '磷酸盐'
	                },{
	                	 field: 'PH',
	                     title: 'PH值'
	                } ,{
	                	field: 'NH4',
	                    title: 'NH4'
	                },{
	                	field: 'DO',
	                    title: 'DO'
	                },{
	                	field: 'CON',
	                    title: 'CON'
	                },{
	                	field: 'COD',
	                    title: 'COD'
	                }]
	            });
	        };

	        //得到查询的参数
	        oTableInit.queryParams = function (params) {
	            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
	            	pageSize: params.limit,   //页面大小           	
	                pageNumber: params.offset,  //页码 
	                pgroup:$("#pgroup").find("option:selected").val(),	
	            	rtu:$("#rtu").find("option:selected").val(),	
	            	startTime:$("#startTime").val(),	
	            	endTime:$("#endTime").val()
	               
	            };
	            return temp;
	        };
	        return oTableInit;
	    };


	    var ButtonInit = function () {
	        var oInit = new Object();
	        var postdata = {};

	        oInit.Init = function () {
	            //初始化页面上面的按钮事件
	        };

	        return oInit;
	    };
		</script>      
</body>

</html>