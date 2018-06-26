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
	    
</head>
<body>
      
      <div class="panel panel-primary">  
        <div class="panel-heading">  
            <div class="panel-title"><a  data-parent="mypanel" >历史数据</a></div>  
        </div>  
        <div id="item2" class="panel-collapse ">  
            <div class="panel-body">  
                <table id="tb_departments"></table>
            </div>  
        </div>  
    </div>	
    <script src="<%=request.getContextPath()%>/js/jquery-3.2.1.js" ></script>		
    <script src="../../js/bootstrap-table.js"></script>
    <script src="../../js/bootstrap-table-zh-CN.js"></script>    
     <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script> 

    <script type="text/javascript">
	 $(function () {

	        //1.初始化Table
	        var oTable = new TableInit();
	        oTable.Init();

	        //2.初始化Button的点击事件
	        var oButtonInit = new ButtonInit();
	        oButtonInit.Init();

	    });
	    var TableInit = function () {
	        var oTableInit = new Object();
	        //初始化Table
	        oTableInit.Init = function () {
	        	$("#tb_departments").bootstrapTable('destroy'); 
	            $('#tb_departments').bootstrapTable({
	                url: "${pageContext.request.contextPath}/dataRep?action=findall",//请求后台的URL（*）
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
	                departmentname: $("#txt_search_departmentname").val(),//
	                statu: $("#txt_search_statu").val()
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