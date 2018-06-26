<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		 <meta charset="UTF-8">
         <meta http-equiv="X-UA-Compatible" content="IE=edge">
         <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
         <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>  
		<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">  
		<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  
		<script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>  
		<link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">  
		<script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
		<script type="text/javascript" src="../../js/jquery.table2excel.js" ></script>
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
         
        
        
         
         <title>数据报表</title>
</head>
<body style="background-color:#fcf8e3;">
  <c:if test="${empty datatPage}">
       无客户信息
   </c:if>
   <c:if test="${not empty datatPage}">
   <div class="container" >
    <div class="row">    
        <div class="col-md-12">
            <div class="page-header">
                <h1>数据报表</h1>
                 
            </div>
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
   /*  //改变每页显示记录数
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
  		var queryForm = document.getElementById("queryForm");
  		queryForm.submit();//提交表单
		/* //2.请求servlet同时发送参数(pageSize)
	    var url="${pageContext.request.contextPath}/dataRep?action=findDataByTime&&pageSize="+pageSize;
	    window.location.href=url; 
	} */
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