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
	<link href="<%=request.getContextPath()%>/css/bootstrap-editable.css" rel="stylesheet" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-table.css">     
    
	 
	 
        
</head>
<body>
	<!-- begin #page-loader -->
	<div id="page-loader" class="fade in"><span class="spinner"></span></div>
	<!-- end #page-loader -->
	
	<!-- begin #page-container -->
	<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
		<!-- begin #header -->
		<div id="header" class="header navbar navbar-default navbar-fixed-top">
			<!-- begin container-fluid -->
			<div class="container-fluid">
				<!-- begin mobile sidebar expand / collapse button -->
				<div class="navbar-header" style="width: 50%">
					<a style="color:#000; width: 100%;font-size: 24px;"  class="navbar-brand">智能水环境管理系统</a>
			        <button type="button" class="navbar-toggle" data-click="sidebar-toggled">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				
				</div>
				<ul class="nav navbar-nav navbar-right">
				
					<li class="dropdown navbar-user">
						<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
							
							<span class="hidden-xs">${user.USER_NAME}</span> <b class="caret"></b>
						</a>
						<ul class="dropdown-menu animated fadeInLeft">
					          <li><a href="javascript:;" style="color:#000000">个人中心</a></li>
					        <li><a href="${pageContext.request.contextPath }/login.jsp"style="color:#000000">退出</a></li>
						</ul>
					</li>
				</ul>

				 
			</div>
			<!-- end container-fluid -->
		</div>
		<!-- end #header -->
		
		<!-- begin #sidebar -->
		<div id="sidebar" class="sidebar">
			<!-- begin sidebar scrollbar -->
			<div data-scrollbar="true" data-height="100%">
			
				<!-- begin sidebar user -->
				<ul class="nav">
					<li class="nav-profile">
						<div class="image">
							<a ><img src="../../images/usst.png" alt="" /></a>
						</div>
						<div class="info">
							欢迎你！
							<small id="using">${user.USER_NAME}</small>                             
						</div>
					</li>				
				</ul>
				<!-- end sidebar user -->
				<!-- begin sidebar nav -->
				<ul class="nav">
					<!--<li class="nav-header">Navigation</li>-->
					<li class="has-sub ">
						<a href="<%=request.getContextPath()%>/jsp/front/index.jsp" >						   
						    <i class="fa fa-laptop"></i>
						    <span>实时监测</span>
					    </a>
						
					</li>
					<li class="has-sub ">
						<a href="javascript:;">
						    <b class="caret pull-right"></b>
						    <i class="fa fa-suitcase"></i>
						    <span>数据</span>
						</a>
						<ul class="sub-menu">
							<li><a href="../user/historicalDate.jsp">统计图</a></li>
							<li><a href="../user/NewFile.jsp">报表</a></li>
							
						</ul>
					</li>
					<li class="has-sub active">
						<a href="javascript:;">
						    <b class="caret pull-right"></b>
						    <i class="fa fa-file-o"></i>
						    <span>管理</span> 
						</a>
						<ul class="sub-menu">
							<li><a href="../user/user3.jsp">用户管理</a></li>
							<li><a href="#">系统设置</a></li>
							
							
						</ul>
					</li>
					<li class="has-sub">
						<a href="" >
						   <!-- <b class="caret pull-right"></b>-->
						    <i class="fa fa-warning"></i>
						    <span>故障警报</span>
						</a>			
					</li>
					<li class="has-sub">
						<a href="#" onclick="showAtRight('help.html')">
						   <!-- <b class="caret pull-right"></b>-->
						    <i class="fa fa-th"></i>
						    <span>帮助 </span>
						</a>
			
					</li>
					
				
				
			        <!-- begin sidebar minify button -->
					<li><a href="javascript:;" class="sidebar-minify-btn" data-click="sidebar-minify" style="background-color:#87AF4C;"><i class="fa fa-angle-double-left"></i></a></li>
			        <!-- end sidebar minify button -->
				</ul>
				<!-- end sidebar nav -->
			</div>
			<!-- end sidebar scrollbar -->
		</div>
		<div class="sidebar-bg"></div>
		<!-- end #sidebar -->
		
		<!-- begin #content -->
		<div id="content" class="content">
		   <div class="panel panel-primary">  
        <div class="panel-heading">  
            <div class="panel-title"><a  data-parent="mypanel" >用戶管理</a></div>  
        </div>  
        <div id="item2" class="panel-collapse ">  
            <div class="panel-body"> 
                <div id="toolbar">
                   <button  type="button" class="btn btn-default" data-toggle="modal" data-target="#update">
			                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
			                 <a href="" role="button" data-toggle="modal" data-target="#myModal">增加用户</a></li>
			       </button>
               </div>
                <table id="tb_departments"></table>
            </div>  
        </div>  
    </div>
    <!-- 增加 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加用户</h4>
            </div>
            <div class="modal-body">          
               <%--  <form action="${pageContext.request.contextPath}/admin?action=updateUser" method="post"> --%>            
                    <div class="form-group">
                        <label for="addname">用户名</label>
                        <input type="text" name="USER_NAME" value="" id="addname" class="form-control" placeholder="用户名">
                    </div>
                    <div class="form-group">
                        <label for="addpassword">用户密码</label>
                        <input type="text" name="USER_PSW" value="" id="addpassword" class="form-control" placeholder="请输入用户密码">
                    </div>
                    <div class="form-group">
                        <label for="addpassword1">确认用户密码</label>
                        <input type="text" id="addpassword1" class="form-control" placeholder="请确认输入用户密码">
                    </div>
                    <div class="form-group">
                        <label for="addyonghuzu">所属用户组</label>
                        <select name="USER_ROLE" id="addyonghuzu" class="form-control">
                            <option>管理员</option>
                            <option>用户</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="addyonghuzu">项目编号</label>
                        <select name="PGROUP_ID" id="addxiangmu" class="form-control">
                            <option>0</option>
                            <option>1</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="addname">备注</label>
                        <input type="text" name="USER_DESC" value="" id="addbeizhu" class="form-control" placeholder="备注">
                    </div>
                    
                    <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		                <!-- <button id="btn_add" type="submit" class="btn btn-primary" >提交</button> -->
		                <button id="btn_add" type="button" class="btn btn-primary btn-sm"data-dismiss="modal"  >保存</button>
            		</div>
               <!--  </form> -->
            </div>
           
        </div>
    </div>
</div>
            
		</div>
		<!-- end #content -->		
		<!-- begin scroll to top btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
		<!-- end scroll to top btn -->
	</div>
	<!-- end page container -->
	 
	
	<script src="<%=request.getContextPath()%>/js/jquery-3.2.1.js" ></script>
	 <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
	 
	<script src="<%=request.getContextPath()%>/js/jquery-migrate-1.1.0.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.slimscroll.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/apps.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap-editable.js"></script>
	<script src="../../js/bootstrap-table.js"></script>
    <script src="../../js/bootstrap-table-zh-CN.js"></script>
    <script src="../../js/bootstrap-table-editable.js"></script>
	<script>
		$(document).ready(function() {
			App.init();
			/*Dashboard.init();*/
		});
	</script>
	
    <script type="text/javascript">
    var res=[];
	 $(function () {

	        //1.初始化Table
	        var oTable = new TableInit();
	        oTable.Init();

	        //2.初始化Button的点击事件
	        var oButtonInit = new ButtonInit();
	        oButtonInit.Init();
	        //
	       

	    });
	


	    var TableInit = function () {
	        var oTableInit = new Object();
	        //初始化Table
	        oTableInit.Init = function () {
	            $('#tb_departments').bootstrapTable({
	                url: "${pageContext.request.contextPath}/admin?action=finduser",//请求后台的URL（*）
	                method: 'get',                      //请求方式（*）
	                toolbar: '#toolbar',                //工具按钮用哪个容器
	                striped: true,                      //是否显示行间隔色
	                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
	                pagination: true,                   //是否显示分页（*）
	                queryParams: oTableInit.queryParams,//传递参数（*）
	                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
	                pageNumber:1,                       //初始化加载第一页，默认第一页
	                pageSize: 5,                       //每页的记录行数（*）
	                pageList: [2,5,10, 25, 50, 100],        //可供选择的每页的行数（*）	              
	                showColumns: true,                  //是否显示所有的列
	                showRefresh: true,                  //是否显示刷新按钮
	                minimumCountColumns: 2,             //最少允许的列数	               
	                height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
	                uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
	                showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
	                cardView: false,                    //是否显示详细视图
	                detailView: false,                   //是否显示父子表		                
	                columns: [{
	                    checkbox: true
	                }, 
	                {
	                    field: 'USER_ID',
	                    title: '编号',
	                    visible: false,//false表示不显示
	                }, 
	                {
	                    field: 'USER_NAME',
	                    title: '账号',
	                    editable: {
	                        type: 'text',
	                        title: '账号',
	                        validate: function (v) {
	                            if (!v) return '用户名不能为空';

	                        }
	                    }
	                }, {
	                    field: 'USER_ROLE',
	                    title: '权限',
	                    visible: true,//false表示不显示
	                    editable: {
	                        type: 'select',
	                        title: '部门',
	                        source:[{value:"0",text:"管理员"},{value:"1",text:"用户"}]
	                    }
	                }, {
	                    field: 'USER_PSW',
	                    title: '密码',
	                    visible: false,//false表示不显示
	                    editable: {
	                        type: 'password',
	                        title: '密码',
	                        validate: function (v) {
	                            if (!v) return '用户名不能为空';

	                        }
	                    }
	                    
	                    
	                    
	                }, 
	                 
	                {
	                    field: 'PGROUP_ID',
	                    title: '项目',
	                    editable: {
	                        type: 'select',
	                        title: '项目',
	                        source:[{value:"0",text:"项目1"},{value:"1",text:"项目2"}]
	                    }
	                    
	                },
	                {
	                    field: 'USER_DESC',
	                    title: '备注',
	                    visible: false,//false表示不显示
	                    editable: {
	                        type: 'text',
	                        title: '备注',
	                        
	                    }
	                },
	                {
			            field:"shortcutOperation",
			            title:"操作",
			            align: "center",
			            events: operateEvents,
			            formatter: function(value, row, index){
			    	        return [
			    	            '<a class="remove" href="javascript:void(0)" title="刪除">',
			    	            '<i class="fa fa-times"></i>',
			    	            '</a>',
			    	        ].join('');
			    	    }
			        }
	                ],
	                onEditableSave: function (field, row, oldValue, $el) {             
	    	            $.ajax({
	    	                type: "post",
	    	                url: "${pageContext.request.contextPath}/admin?action=addUsers",
	    	                dataType : 'json',
	    	                data:{datalist:JSON.stringify(row)},  
	    	                success: function (data) {
	    	                    if (data == 0) {
	    	                       alert("失败");
	    	                    } else {	
	    	                    	
	    	                    	$table.bootstrapTable("refresh");
	    	                    }
	    	                },
	    	          	    	            
	    	            });
	    	        }
	            });
	        };
	     /*    $("#btn_add").click(function () {
		
		                $("#table").bootstrapTable('insertRow', {
		                	index:0, 
		                	row:{
		                		USER_ID:"qingshuru",
		                		USER_NAME:"qingshuru",
		                		USER_ROLE:"qingshuru",
		                		USER_PSW:"qingshuru",
		                		PGROUP_ID:"qingshuru",
		                		USER_DESC:"qingshuru",
		                		
		                	}
		                });		  
		    }); */
	        
	        
	         $("#btn_add").click(function () {
	        	 var USER_NAME = $('#addname').val();
	        	// alert(USER_NAME);
	        	 var USER_PSW = $('#addpassword').val();
	        	 //alert(USER_PSW);
	        	 var USER_ROLE = $('#addyonghuzu').val();
	        	 //alert(USER_ROLE);
	        	 var USER_DESC = $('#addbeizhu').val();
	        	 alert(USER_DESC);
	        	 var PGROUP_ID = $('#addxiangmu').val();addxiangmu
	        	// alert(PGROUP_ID);
	        		        	 
		         $.ajax({
		            type : "POST",
		            url : "${pageContext.request.contextPath}/admin?action=updateUser",
		            dataType : 'JSON',
		            data : {
	                	USER_NAME :USER_NAME ,
	                	USER_PSW:USER_PSW,
	                	USER_ROLE:USER_ROLE,
	                	USER_DESC:USER_DESC,
	                	PGROUP_ID:PGROUP_ID	                	
	                },
		            scriptCharset: "utf-8",
				      success :  function(result) {
				    	  alert(result);
				            if (result==0) {
				            	alert("失败");
				            } else{
				            	
				            	$('#tb_departments').bootstrapTable("refresh");
				            }	        	      
			      
		           
		                /*  toastr.success("success", '标签');
		                $("#table").bootstrapTable('insertRow', {
		                	index:0, 
		                	row:{
		                		USER_ID,
		                		USER_NAME,
		                		USER_ROLE,
		                		USER_PSW,
		                		PGROUP_ID,
		                		USER_DESC,
		                		shortcutOperation
		                	}
		                }); */
		            }
		        }); 

		    });           
	        //得到查询的参数
	        oTableInit.queryParams = function (params) {
	            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
	            	pageSize: params.limit,   //页面大小           	
	                pageNumber: params.offset,  //页码               
	               // departmentname: $("#txt_search_departmentname").val(),//
	               // statu: $("#txt_search_statu").val()
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
		<script>
		var $table = $('#tb_departments')
		var name = $('#using').text();
		
		window.operateEvents = {
			        'click .remove': function (e, value, row, index) {	  
			        	 //alert(name);
			        	 if(row['USER_NAME'] ==name){
			        		 alert("你不能删除你自己");
			        	 }else{
				             $.ajax({
				                type : "POST",
				                url : "${pageContext.request.contextPath}/admin?action=delByID",
				                data : {
				                	USER_NAME : row['USER_NAME']
				                },
				                dataType : 'JSON',
				                success : function (data) {			                	
				                    if (data == 0) {
				                    	alert("删除失败");
				                    }else{
				                    	$('#tb_departments').bootstrapTable("refresh");
					                    /* $table.bootstrapTable('remove', {
					                        field: 'USER_NAME',
					                        values: row['USER_NAME']
					                    }); */
				                    }
				                }
				            });
			        	 }
			            return false; 
			        },
			 };
		</script>
     
</body>

</html>