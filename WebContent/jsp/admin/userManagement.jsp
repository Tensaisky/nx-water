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
	
	<link href="<%=request.getContextPath()%>/css/bootstrap-datetimepicker.css" rel="stylesheet" />  
	<link href="<%=request.getContextPath()%>/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/assets/css/animate.min.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/assets/css/style.min.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/assets/css/theme/default.css" rel="stylesheet" id="theme" />
	<!-- ================== END BASE CSS STYLE ================== -->
	
	<!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
	
    <link href="<%=request.getContextPath()%>/assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" />
	<!-- ================== END PAGE LEVEL STYLE ================== -->
	
		<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">  
		
		
        <script >
           var userId = "${sessionScope.user.USER_ID}";
        </script>
<script type="text/javascript">

	function del(USER_ID) {
		if(USER_ID==userId){
			alert("你不能删除你自己！！");
		}else{
			var flag = window.confirm("确认删除吗");		
			if (flag) {
				//确认删除
				location.href = "${pageContext.request.contextPath}/admin?action=delByID&&USER_ID="
						+ USER_ID+"&&pageSize="+pageSize;
			}
		}
	}
	//触发模态框的同时调用此方法 	
	function editInfo(USER_ID,USER_NAME,USER_PSW) { 
		//alert(USER_ID);
	    //var USER_NAME = document.getElementById("td").rows[USER_ID].cells[1].innerText;
	    //alert(USER_NAME);
	  // var USER_PSW = document.getElementById("td").rows[USER_ID].cells[2].innerText; 
	  // alert(USER_PSW);
	    //向模态框中传值  
	  $("#id").val(USER_ID);  
	   $("#name").val(USER_NAME);  
	  $("#password").val(USER_PSW);    
	 // $("#update").modal('show');  
	}  
	//提交更改  
	function update(){  
	    //获取模态框数据  
	    var USER_ID = $('#id').val();  
	    var USER_NAME = $('#name').val();  
	    var USER_PSW = $('#password').val();
	    var USER_ROLE = $('#role').val();
	    $.ajax({  
	        type: "post",  
	        url: "",  
	        data: "USER_ID=" + USER_ID + "&USER_NAME=" + USER_NAME + "&USER_PSW=" + USER_PSW+"&USER_ROLE="+USER_ROLE,  
	        dataType: 'html',  
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",  
	        success: function(result) {  
	            //location.reload();  
	        }  
	    });  
	}  
   
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
					<li class="has-sub ">
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
					<li class="has-sub active">
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
		<div id="content" class="content" style="color:">
		      <c:if test="${empty pageBean}">
       无客户信息
   </c:if>
   <c:if test="${not empty pageBean}">
   <div class="container" >
    <div class="row">
         
        <div class="col-md-12">
            <div class="page-header">
                <h1>用户管理</h1>
            </div>
         <!--    <ul class="nav nav-tabs">
                <li class="active">
                    <a href="user_list.html">用户列表</a>
                </li>               
            </ul> -->
            <table class="table" id="td">
                <thead>
                    <tr>
                       <!--  <th>编号</th> -->
                        <th>账号</th>
                        <th>所属组</th>
                    </tr>
                </thead>
                <tbody id="tbody">
                   <c:forEach items="${pageBean.user}" var="c"> 
                        <tr id="tddd">
							<%-- <td >${c.USER_ID}</td> --%>
							<td>${c.USER_NAME}</td>
							<%-- <td>${c.USER_PSW }</td> --%>
							<td>${c.USER_ROLE}</td>
							<td>
							  <div role="presentation" class="dropdown">
                                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                    操作<span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a href="" role="button" data-toggle="modal" data-target="#update"  onclick="editInfo('${c.USER_ID}','${c.USER_NAME}','${c.USER_PSW}')">编辑</a></li>
                                    <li><a href="javascript:void(0)"onclick="del('${c.USER_ID}')">删除</a></li>
                                </ul>
                            </div>			
						 </td>
				       </tr>
                    </c:forEach>
                  
                </tbody>
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
			    	 	 	<c:when test="${pageBean.currentPage==pageBean.firstPage}">
			    	 	 		首页&nbsp;
			    	 	 		上一页
			    	 	 	</c:when>
			    	 	 	<c:otherwise>
			    	 	 		<a href="${pageContext.request.contextPath}/admin?action=pagination&&currentPage=${pageBean.firstPage}&&pageSize=${pageBean.pageSize}">首页</a>&nbsp;
			    	 			<a href="${pageContext.request.contextPath}/admin?action=pagination&&currentPage=${pageBean.prePage}&&pageSize=${pageBean.pageSize}">上一页</a>&nbsp;
			    	 	 	</c:otherwise>
			    	 	 </c:choose>
			    	 	 
			    	 	 <c:choose>
			    	 	 	<c:when test="${pageBean.currentPage==pageBean.totalPage}">
			    	 	 		下一页&nbsp;
			    	 	 		末页
			    	 	 	</c:when>
			    	 	 	<c:otherwise>
			    	 	 		<a href="${pageContext.request.contextPath}/admin?action=pagination&&currentPage=${pageBean.nextPage}&&pageSize=${pageBean.pageSize}">下一页</a>&nbsp;
			    	 			<a href="${pageContext.request.contextPath}/admin?action=pagination&&currentPage=${pageBean.totalPage}&&pageSize=${pageBean.pageSize}">末页</a>&nbsp;
			    	 	 	</c:otherwise>
			    	 	 </c:choose>
			    	 		当前为第${pageBean.currentPage }页/共${pageBean.totalPage }页&nbsp;
			    	 		共${pageBean.totalCount }条数据&nbsp;
			    	 		每页显示 <input type="text" size="2" id="pageSize" value="${pageBean.pageSize }" onblur="changePageSize()"/> 条&nbsp;
			    	 		跳转到第<input type="text" id="curPage" size="2" onblur="changePage()"/>页
    	 		                                                                                    
                       </td>						       
			        </tr>
			         <tr>
			            <td>
				             <a href="" role="button" data-toggle="modal" data-target="#myModal">增加用户</a></li>
				       </td>			           
			         </tr>
            </table>
            
        </div>
       
    </div>
</div>

<!-- 修改用户 -->
<!-- 模态框（Modal） -->  
<div class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">  
    <div class="modal-dialog">  
        <div class="modal-content">
           <div class="modal-header">  
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>  
                <h4 class="modal-title" id="myModalLabel">修改信息</h4>  
           </div>
         <form action="${pageContext.request.contextPath}/admin?action=updateUser"  method="post" >                  
           <div class="modal-body"> 
                 <input type="hidden" name="USER_ID" id="id" value="" > 
                <div class="form-group">
                        <label for="addname">用户名</label>
                        <input type="text" name="USER_NAME" value="" id="name" class="form-control" placeholder="用户名">
                 </div>
                 <div class="form-group">
                     <label for="addpassword">用户密码</label>
                     <input type="text" name="USER_PSW" value="" id="password" class="form-control" placeholder="请输入用户密码">
                 </div>
                 <div class="form-group">
                     <label for="addpassword1">确认用户密码</label>
                     <input type="text" id="password1" class="form-control" placeholder="请确认输入用户密码">
                 </div>
                 <div class="form-group">
                     <label for="addyonghuzu">所属用户组</label>
                     <select name="USER_ROLE" id="role" class="form-control">
                         <option>管理员</option>
                         <option>用户</option>
                     </select>
                 </div>
           </div>  
           <div class="modal-footer">  
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>  
                <button type="submit" class="btn btn-primary" onclick="update()">提交</button> 
           </div>
        </form> 
        </div>  
        <!-- /.modal-content -->  
    </div>  
    <!-- /.modal -->  
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
                <form action="${pageContext.request.contextPath}/admin?action=addUsers" method="post">            
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
                    <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		                <button type="submit" class="btn btn-primary">提交</button>
            		</div>
                </form>
            </div>
           
        </div>
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
	<%-- <script src="<%=request.getContextPath()%>/css/jquery-1.9.1.min.js"></script> --%>
	<script src="<%=request.getContextPath()%>/js/jquery-migrate-1.1.0.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
	<%-- <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script> --%>
	<script src="<%=request.getContextPath()%>/js/jquery.slimscroll.min.js"></script>
	<!-- ================== END BASE JS ================== -->
	
	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
	<script src="<%=request.getContextPath()%>/js/apps.min.js"></script>
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
		//2.请求servlet同时发送参数(pageSize)
	    var url="${pageContext.request.contextPath}/admin?action=pagination&&pageSize="+pageSize;
	    window.location.href=url;
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
	    var totalPage = "${pageBean.totalPage}";
	    if(curPage>totalPage){
	    	alert("已超过总页数");
	    	return;
	    }     
		//2.请求servlet同时发送参数(pageSize)
	    var url="${pageContext.request.contextPath}/admin?action=pagination&&currentPage="+curPage+"&&pageSize=${pageBean.pageSize}";
	    window.location.href=url;
    }

</script>
</html>

