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
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=TkT6Gwuw682lu9gtRYAggS69XRSn5jrc"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/echarts.min.js" ></script>	
    <script type="text/javascript" src="../../js/monitoring.js"></script>	
	<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
	 <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" />
	
</head>
<body>  
    <div class="panel panel-primary">  
        <div class="panel-heading">  
            <div class="panel-title"><a data-toggle="collapse" data-parent="mypanel" href="#item2">设备分布</a></div>  
        </div>  
        <div id="item2" class="panel-collapse ">  
            <div class="panel-body">  
                <div id="allmap" style="height: 200px" ></div>
            </div>  
        </div>  
    </div>  
    <div class="panel panel-primary">  
        <div class="panel-heading">  
            <div class="panel-title"><a data-toggle="collapse" data-parent="mypanel" href="#item2">设备分布</a></div>  
        </div>  
        <div id="item2" class="panel-collapse ">  
            <div class="panel-body">  
                <div id="main" style="height: 200px" ></div>
            </div>  
        </div>  
    </div> 
    <script>
		$(document).ready(function() {
			$("#main").load('../front/echarts.jsp');
		});	   
	</script>
		      
		  	
	<script type="text/javascript">   
	/*定义全局存放数据的变量*/
	var jd = [];
    var wd=[];
	var address=[];
	var phone=[];
	$(document).ready(function() {  
	    getdata();//获取数据
	    initMap();//加载地图
	    setInterval("frash()",10000); //刷新
	 });
	function frash(){
	    map.clearOverlays();//清空地图上标注点
	    getdata();
	    //alert("更新完成");
	    setinfo();//设置数据库信息
	    jd.splice(0,jd.length);//清空数组
	    wd.splice(0,wd.length);
	    address.splice(0,address.length);
	    phone.splice(0,phone.length);
	}
	function getdata(){
		 $.ajax({
		      type : "post",
		      async : false, //同步执行
		      url : "${pageContext.request.contextPath }/minitorServelet?action=findAllPosition",
		      data :{} ,
		      dataType : "json", //返回数据形式为json
		      scriptCharset: "utf-8",
		      success :  function(result) {
		            if (result) {
		                for(var i=0;i<result.length;i++){
		                   console.log(result[i].jd);	                   
		                   jd.push(result[i].jd);
		                   wd.push(result[i].wd);
		                   address.push(result[i].address);
		                   phone.push(result[i].phone);	     
		                   // alert(address[i]);    
		                 }    
		            } 		       	      
	       },
			error : function(errorMsg) {
			    alert("不好意思，图表请求数据失败啦!");
			}
	    })	;
	}
</script>
   	
</body>
</html>


