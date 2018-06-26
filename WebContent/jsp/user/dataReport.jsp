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
	<!-- ================== BEGIN BASE CSS STYLE ================== -->
	
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
	
		<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">  
		<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  
		<script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>  
		<link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">  
		<script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script> 
		<script type="text/javascript" src="http://echarts.baidu.com/build/dist/echarts.js"></script>
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
		      //导出excel
		        $("#output").click(function(){
		                var myDate = new Date();
		                $("#table").table2excel({
		                    exclude: ".noExl",
		                    name: "Excel Document Name.xlsx",
		                    filename: myDate.toLocaleString(),
		                    exclude_img: true,
		                    exclude_links: true,
		                    exclude_inputs: true
		                });
		            }); 
	         });  
		</script>      
        
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
              <c:if test="${empty datatPage}">
       无客户信息
   </c:if>
   <c:if test="${not empty datatPage}">
   <div class="container" >
    <div class="row">    
        <div class="col-md-12">
            <form name="QuerryUserFrom" id= "queryFrom"  method="post">
                  <%--当前页 --%>
  		          <input type="hidden" id="currentPage" name="currentPage" value="${datatPage.currentPage }"/>
  		          <%--每页显示记录数 --%>
  		          <input type="hidden" id="pageSizeId" name="pageSize" value="${datatPage.pageSize }"/>
			  	<div class="row">  
			        <div class='col-sm-4'>  
			            <div class="form-group">  
			                <label>选择开始时间：</label>  
			                <!--指定 date标记-->  
			                <div class='input-group date' id='datetimepicker1'>  
			                    <input type='text' class="form-control" />  
			                    <span class="input-group-addon">  
			                        <span class="glyphicon glyphicon-calendar"></span>  
			                    </span>  
			                </div>  
			            </div>  
			        </div>  
			        <div class='col-sm-4'>  
			            <div class="form-group">  
			                <label>选择结束时间：</label>  
			                <!--指定 date标记-->  
			                <div class='input-group date' id='datetimepicker2'>  
			                    <input type='text' class="form-control" />  
			                    <span class="input-group-addon">  
			                        <span class="glyphicon glyphicon-calendar"></span>  
			                    </span>  
			                </div>  
			            </div>  
			        </div>  
			    </div> 
  		
            <table>             
                <tr>
                    <td>
                                                             开始时间<input type="text" name ="starttime" value="${param['starttime']}"/>
                                                             结束时间<input type="text" name ="endtime" value="${param['endtime']}"/>
                       <input type="submit" onClick="QuerryUserFrom.action='${pageContext.request.contextPath}/dataRep?action=findDataByTime';QuerryUserFrom.submit()" value="查询"/>
                       <input type="submit" onClick="QuerryUserFrom.action='${pageContext.request.contextPath}/dataRep?action=exportExcel';QuerryUserFrom.submit()" value="导出"/>
                       <input type="submit" id="output" value="导出"/>
                    </td>                       
                </tr>               
            </table>
            </form>
            <hr>
            <table class="table" id="td">
                <thead>
                    <tr>
                        <th>编号</th>
                        <th>PH值</th>
                        <th>电导率</th>
                        <th>溶解氧</th>
                        <th>浊度</th>
                        <th>温度</th>
                        <th>化学耗氧量</th>
                        <th>氨氮</th>
                        <th>磷酸盐</th>
                    </tr>
                </thead>
                <tbody id="tbody">
                <c:forEach items="${datatPage.test}" var="test">
                      <tr>
                         <td>${test.id}</td>
                         <td>${test.PH}</td>
                         <td>${test.CON}</td>
                         <td>${test.DO}</td>
                         <td>${test.TUR}</td>
                         <td>${test.TEMP}</td>
                         <td>${test.COD}</td>
                         <td>${test.NH4}</td>
                         <td>${test.PO4}</td>
                     </tr>
                </c:forEach>
                  
                </tbody>
                <tfoot>
                 
                </tfoot>
            </table>
            <table>
                     <tr>
                       <td>
                       <%--
			    	 	需求： 
			    	 		1） 如果当前页是首页，那么不能点击“首页”和“上一页”，否则可以点击
			    	 		2) 如果当前页是末页，那么不能点击“下一页”和“末页”，否则可以点击
			    	 	 --%>
			              <c:choose>
			    	 	 	<c:when test="${datatPage.currentPage==datatPage.firstPage}">
			    	 	 		首页&nbsp;
			    	 	 		上一页
			    	 	 	</c:when>
			    	 	 	<c:otherwise>
			    	 	 		<a href="javascript:void(0)" onclick="toPage(${datatPage.firstPage})">首页</a>&nbsp;
			    	 			<a href="javascript:void(0)" onclick="toPage(${datatPage.prePage})">上一页</a>&nbsp;
			    	 	 	</c:otherwise>
			    	 	 </c:choose>
			    	 	 
			    	 	 <c:choose>
			    	 	 	<c:when test="${datatPage.currentPage==datatPage.totalPage}">
			    	 	 		下一页&nbsp;
			    	 	 		末页
			    	 	 	</c:when>
			    	 	 	<c:otherwise>
			    	 	 		<a href="javascript:void(0)" onclick="toPage(${datatPage.nextPage})">下一页</a>&nbsp;
			    	 			<a href="javascript:void(0)" onclick="toPage(${datatPage.totalPage})">末页</a>&nbsp;
			    	 	 	</c:otherwise>
			    	 	 </c:choose>
			    	 		当前为第${datatPage.currentPage }页/共${datatPage.totalPage }页&nbsp;
			    	 		共${datatPage.totalCount }条数据&nbsp;
			    	 		每页显示 <input type="text" size="2" id="pageSize" value="${datatPage.pageSize }" onblur="changePageSize()"/> 条&nbsp;
			    	 		跳转到第<input type="text" id="curPage" size="2" onblur="changePage()"/>页
    	 		                                                                                    
                       </td>						       
			        </tr>
            
            </table>
         
        </div>
        </form>
    </div>
</div>
 </c:if>
		</div>
		<!-- end #content -->		
		<!-- begin scroll to top btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
		<!-- end scroll to top btn -->
	</div>
	<!-- end page container -->
	 
	
	
	<!-- ================== BEGIN BASE JS ================== -->
	<script src="<%=request.getContextPath()%>/assets/plugins/jquery/jquery-1.9.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/plugins/jquery-ui/ui/minified/jquery-ui.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.table2excel.js" ></script>
	<script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
	<script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>  
	<!-- ================== END BASE JS ================== -->
	
	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
	<script src="<%=request.getContextPath()%>/assets/js/apps.min.js"></script>
	<!-- ================== END PAGE LEVEL JS ================== -->
	
	<script>
		$(document).ready(function() {
			App.init();
			/*Dashboard.init();*/
		});
	</script>
 
</body>
<script type="text/javascript">
/*改变每页显示记录数*/
	function changePageSize(){
		//1.得到用户输入
		var pageSize = document.getElementById("pageSize").value;
		//判断规则：只能输入1-2个的数字
		var reg = /^[1-9][0-9]?$/;
		if(!reg.test(pageSize)){
			alert("只能输入1-2位的数字");
			return;
		}
		//2提交表单同时发送参数(pageSize)
		document.getElementById("pageSizeId").value=pageSize;
		 //提交表单
    	var queryFrom=document.getElementById("queryFrom");
    	queryFrom.submit();
	}

    /*跳转页面*/
    function changePage(){
    	//1.得到用户输入
		var curPage = document.getElementById("curPage").value;
		//判断规则：只能输入1-2个的数字
		var reg = /^[1-9][0-9]?$/;
		if(!reg.test(curPage)){
			alert("只能输入1-2位的数字");
			return;
		}
		/*如果输入的页码大于总页数*/
	    var totalPage = "${datatPage.totalPage}";
	    if(curPage>totalPage){
	    	alert("已超过总页数");
	    	return;
	    } 
	
  	    document.getElementById("currentPage").value=curPage;
  	    //提交表单
    	var queryFrom=document.getElementById("queryFrom");
    	queryFrom.submit();
		/* //2.请求servlet同时发送参数(pageSize)
	    var url="${pageContext.request.contextPath}/dataRep?action=findDataByTime&&currentPage="+curPage+"&&pageSize=${datatPage.pageSize}";
	    window.location.href=url; */
    }
    /*提交表单*/
    function toPage(pageNo){
    	//提交之前，把当前页设置跳转页码
    	document.getElementById("currentPage").value=pageNo;
    	//提交表单
    	var queryFrom=document.getElementById("queryFrom");
    	queryFrom.submit();
    }
    /* ${pageContext.request.contextPath}/dataRep?action=findDataByTime&&currentPage=${datatPage.firstPage}&&pageSize=${datatPage.pageSize} */

</script>
</html>