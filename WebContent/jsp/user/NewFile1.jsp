<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<!--<![endif]-->
<head>
	<meta charset="utf-8" />
	<title>智能水监测管理系统</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />	    	       
	
	 <link href="<%=request.getContextPath()%>/css/jquery-ui.min.css" rel="stylesheet" /> 
	 <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" />                                        
	<link href="<%=request.getContextPath()%>/css/font-awesome.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/css/animate.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/css/style.min.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" id="theme" />
	<!-- ================== END BASE CSS STYLE ================== -->
	
	<!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
	<link href="<%=request.getContextPath()%>/css/jquery-jvectormap-1.2.2.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/css/jquery.gritter.css" rel="stylesheet" />
	<!-- ================== END PAGE LEVEL STYLE ================== -->
	
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" > 
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-table.css">     

	 
	 
        
</head>
<body>
	
		     
               <div class="panel-body" style="padding-bottom:0px;">
			        <div class="panel panel-default">
			            <div class="panel-heading">查询条件</div>
			            <div class="panel-body">
			                <form id="formSearch" class="form-horizontal">
			                    <div class="form-group" >
			                        <label class="control-label col-sm-1" for="txt_search_departmentname">开始</label>
			                        <div class="col-sm-3">
			                            <input type="text" class="form-control" id="txt_search_departmentname">
			                        </div>
			                        <label class="control-label col-sm-1" for="txt_search_statu">结束</label>
			                        <div class="col-sm-3">
			                            <input type="text" class="form-control" id="txt_search_statu">
			                        </div>
			                        <div class="col-sm-4" style="text-align:left;">
			                            <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询</button>
			                        </div>
			                        
			                    </div>
			                    
			                </form>
			                
			            </div>
			        </div>       
			
			        <div id="toolbar" class="btn-group">
			            <button id="btn_add" type="button" class="btn btn-default">
			                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
			            </button>
			            <button id="btn_edit" type="button" class="btn btn-default">
			                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
			            </button>
			            <button id="btn_delete" type="button" class="btn btn-default">
			                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
			            </button>
			            
			            
			        </div>
			        <table id="tb_departments"></table>
           
		</div>

	 
	
	<script src="<%=request.getContextPath()%>/js/jquery-3.2.1.js" ></script>
	 <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
	 
	<script src="<%=request.getContextPath()%>/js/jquery-migrate-1.1.0.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.slimscroll.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/apps.min.js"></script>
	<script src="../../js/bootstrap-table.js"></script>
    <script src="../../js/bootstrap-table-zh-CN.js"></script>
	<script>
		$(document).ready(function() {
			App.init();
			/*Dashboard.init();*/
		});
	</script>
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
	            $('#tb_departments').bootstrapTable({
	                url: "${pageContext.request.contextPath}/dataRep?action=findall",//请求后台的URL（*）
	                method: 'get',                      //请求方式（*）
	                toolbar: '#toolbar',                //工具按钮用哪个容器
	                striped: true,                      //是否显示行间隔色
	                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
	                pagination: true,                   //是否显示分页（*）
	                sortable: true,                     //是否启用排序
	                sortOrder: "asc",                   //排序方式
	                queryParams: oTableInit.queryParams,//传递参数（*）
	                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
	                pageNumber:1,                       //初始化加载第一页，默认第一页
	                pageSize: 10,                       //每页的记录行数（*）
	                pageList: [2,5,10, 25, 50, 100],        //可供选择的每页的行数（*）
	                search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
	                strictSearch: true,
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
	                    field: 'id',
	                    title: '编号'
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