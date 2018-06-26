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
				<div class="navbar-header">
					<a style="color:#000" href="<%=request.getContextPath()%>/jsp/front/index.jsp" class="navbar-brand"><span class="navbar-logo"></span>智能水环境管理系统</a>
					<button type="button" class="navbar-toggle" data-click="sidebar-toggled">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div>
				<!-- end mobile sidebar expand / collapse button -->
				
				<!-- begin header navigation right -->
				<ul class="nav navbar-nav navbar-right">
							<li><a href="javascript:;">个人中心</a></li>
							<li><a href="${pageContext.request.contextPath }/login.jsp">退出</a></li>
						<!--</ul>
					</li>-->
				</ul>
				<!-- end header navigation right -->
			</div>
			<!-- end container-fluid -->
		</div>
		<!-- end #header -->
		
		<!-- begin #sidebar -->
		<div id="sidebar" class="sidebar">
			<!-- begin sidebar scrollbar -->
			<div data-scrollbar="true" data-height="100%" style="background-color: #87AF4C;">
				<!-- begin sidebar user -->
				<ul class="nav">
					<li class="nav-profile">
						<div class="image">
							<a href="javascript:;"><img src="<%=request.getContextPath()%>/images/usst.png" alt="" /></a>
						</div>
						<div class="info">
							欢迎你！
							<small>${user.USER_NAME}</small>
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
					<li class="has-sub active">
						<a href="javascript:;">
						    <b class="caret pull-right"></b>
						    <i class="fa fa-suitcase"></i>
						    <span>数据</span>
						</a>
						<ul class="sub-menu">
							<li><a href="<%=request.getContextPath()%>/jsp/user/historicalDate.jsp">统计图</a></li>
							<li><a href="${pageContext.request.contextPath}/dataRep?action=findDataByTime">报表</a></li>
							
						</ul>
					</li>
					<li class="has-sub">
						<a href="javascript:;">
						    <b class="caret pull-right"></b>
						    <i class="fa fa-file-o"></i>
						    <span>管理</span> 
						</a>
						<ul class="sub-menu">
							<li><a href="${pageContext.request.contextPath}/admin?action=pagination">用户管理</a></li>
							<li><a href="#">系统设置</a></li>
							<li><a href="#">预警设置</a></li>
							
						</ul>
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
              
                <table id="table"></table>
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
	    window.operateEvents = {
	        'click .remove': function (e, value, row, index) {
	            $.ajax({
	                type : "POST",
	                url : "/wadmin/ad/deleteAd",
	                data : {
	                    adId : row['adId']
	                },
	                dataType : 'JSON',
	                success : function (data) {
	                    if (data.result != 0) {
	                        toastr.info("info", data.message);
	                        return ;
	                    }
	                    toastr.success("success", '删除成功');
	                    $("#table").bootstrapTable('remove', {
	                        field: 'adId',
	                        values: [row['adId']]
	                    });
	                }
	            });

	            return false;
	        },
	        'click .using': function (e, value, row, index) {
	            $.ajax({
	                type : "POST",
	                url : "/wadmin/ad/usingAd",
	                data : {
	                    adId : row['adId']
	                },
	                dataType : 'JSON',
	                success : function (data) {
	                    if (data.result != 0) {
	                        toastr.info("info", data.message);
	                        return ;
	                    }
	                    toastr.success("success", '使用该广告');
	                    $("#table").bootstrapTable('refresh');
	                }
	            });

	            return false;
	        },
	        'click .upload': function (e, value, row, index) {
	            $('.adUpload').fileupload({
	                url : '/wadmin/ad/adUpload/adId/'+row['adId'],
	                dataType: 'json',
	                add: function (e, data) {
	                    data.submit();
	                },
	                done: function (e, data) {
	                    var response = data.result;
	                    if (response.result != 0) {
	                        toastr.error(response.message);
	                        return false;
	                    }
	                    toastr.success("上传成功");
	                    $("#table").bootstrapTable('refresh');
	                }
	            });

	            return false;
	        }
	    };


	    /*bootstrap table*/
	    $('#table').bootstrapTable({
	        url:"/wadmin/ad/doAdList",//请求数据url
	        toolbar : "#toolbar",
	        // toolbarAlign : "right",
	        queryParams: function (params) {
	            return {
	                offset: params.offset,  //页码
	                limit: params.limit,   //页面大小
	                search : params.search, //搜索
	                order : params.order, //排序
	                ordername : params.sort, //排序
	            };
	        },
	        detailView : true,
	        detailFormatter : function (index, row) {
	            var image = '<div class="photos">'
	                +'<a target="_blank" href="'+row['jumpUrl']+'"><img alt="image" class="feed-photo" src="'+row['picUrl']+'"></a>'
	                +'</div>';
	            return image;
	        },
	        showHeader : true,
	        showColumns : true,
	        showRefresh : true,
	        pagination: true,//分页
	        sidePagination : 'server',//服务器端分页
	        pageNumber : 1,
	        pageList: [5, 10, 20, 50],//分页步进值
	        search: true,//显示搜索框
	        //表格的列
	        columns: [
	            {
	                field: 'adId',//域值
	                title: '广告ID',//标题
	                visible: true,//false表示不显示
	                sortable: true,//启用排序
	                width : '5%',
	            },
	            {
	                field: 'picUrl',//域值
	                title: '图片',//标题
	                visible: true,//false表示不显示
	                sortable: true,//启用排序
	                width : '15%',
	                formatter : function (value, row, index) {
	                    return "<img style='width: 50px;height: 50px;' src='"+value+"' alt=''>"
	                }
	            },
	            {
	                field: 'jumpUrl',//域值
	                title: '跳转链接',//内容
	                visible: true,//false表示不显示
	                sortable: true,//启用排序
	                width : '10%',
	                editable : true,
	                cellStyle : function (value, row, index) {
	                    return {
	                        css: {
	                            "max-width": "300px",
	                            "word-wrap": "break-word",
	                            "word-break": "normal"
	                        }
	                    };
	                }
	            },
	            {
	                field: 'adDesc',//域值
	                title: '描述',//内容
	                visible: true,//false表示不显示
	                sortable: true,//启用排序
	                width : '10%',
	                editable : true,
	            },
	            {
	                field: 'displayType',//域值
	                title: '表现形式',//内容
	                visible: true,//false表示不显示
	                sortable: true,//启用排序
	                width : '10%',
	                editable: {
	                    type: 'select',
	                    source: [ //0->无广告，1->静态不可点击，2->静态可点击，3->动态不可点击，4->动态可点击
	                        {value: 0, text: '无广告'},
	                        {value: 1, text: '静态不可点击'},
	                        {value: 2, text: '静态可点击'},
	                        {value: 3, text: '动态不可点击'},
	                        {value: 4, text: '动态可点击'},
	                    ]
	                }
	            },
	            {
	                field: 'displaySeconds',//域值
	                title: '时间',//内容
	                visible: true,//false表示不显示
	                sortable: true,//启用排序
	                width : '5%',
	                editable : true,
	            },
	            {
	                field: 'scope',//域值
	                title: '影响范围',//内容
	                visible: true,//false表示不显示
	                sortable: true,//启用排序
	                width : '10%',
	                editable: {
	                    type: 'select',
	                    source: [ //0->全国
	                        {value: 0, text: '全国'},
	                    ]
	                }
	            },
	            {
	                field: 'userType',//域值
	                title: '影响群体',//内容
	                visible: true,//false表示不显示
	                sortable: true,//启用排序
	                width : '5%',
	                editable: {
	                    type: 'select',
	                    source: [ //0->全部
	                        {value: 0, text: '全部'},
	                    ]
	                }
	            },
	            {
	                field: 'status',//域值
	                title: '状态',//内容
	                visible: true,//false表示不显示
	                sortable: true,//启用排序
	                width : '10%',
	                formatter : function (value, row, index) {
	                    return value==1||value=='1' ? '正在使用' : '没有使用';
	                }
	            },
	            {
	                field: 'addTime',//域值
	                title: '时间',//内容
	                visible: true,//false表示不显示
	                sortable: true,//启用排序
	                width : '10%',
	            }
	            ,{
	                field: 'operate',
	                title: '操作',
	                align: 'center',
	                events: operateEvents,
	                width : '25%',
	                formatter: operateFormatter
	            }
	        ],
	        onEditableSave: function (field, row, oldValue, $el) {
	            $.ajax({
	                type: "post",
	                url: "/wadmin/ad/updateAdInfo",
	                dataType : 'json',
	                data: row,
	                success: function (data, status) {
	                    if (status == "success" && data.result == 0) {
	                        toastr.success('更新成功');
	                        if (field == 'jumpUrl') {
	                            $('#table').bootstrapTable("refresh");
	                        }
	                        return true;
	                    } else {
	                        toastr.info(data.message);
	                        $('#table').bootstrapTable("refresh");
	                    }
	                },
	                error: function () {
	                    alert("Error");
	                },
	                complete: function () {

	                }

	            });
	        }
	    });

	    $("#btn_add").click(function () {
	        $.ajax({
	            type : "POST",
	            url : "/wadmin/ad/addAd",
	            dataType : 'JSON',
	            success : function (data) {
	                if (data.result != 0) {
	                    toastr.info("info", data.message);
	                    return ;
	                }
	                toastr.success("success", '标签');
	                $("#table").bootstrapTable('insertRow', {index:0, row:data.data});
	            }
	        });

	    });

	    function operateFormatter(value, row, index) {
	        return [
	            '<a class="using" href="javascript:void(0)" title="Remove">',
	            '<i class="fa fa-check"></i>',
	            '</a>&nbsp;&nbsp;&nbsp;&nbsp;',
	            '<a class="upload" style="cursor: pointer" href="javascript:void(0)" title="Upload">',
	            '<label style="cursor: pointer" for="'+row['adId']+'">',
	            '<i class="fa fa-upload"></i>',
	            '<input type="file" name="adUpload" style="display: none;" class="adUpload" id="'+row['adId']+'" >',
	            '</label>',
	            '</a>&nbsp;&nbsp;&nbsp;&nbsp;',
	            '<a class="remove" href="javascript:void(0)" title="Using">',
	            '<i class="fa fa-times"></i>',
	            '</a>',
	        ].join('');
	    }
	});
   </script>
     
</body>

</html>