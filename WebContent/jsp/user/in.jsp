<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title>智能水监测管理系统</title>
		 
    
	   
</head>
<body>
   <button onclick="ajaxload('../user/NewFile3.jsp')">报表</button>
   <button onclick="ajaxload('../user/NewFile3.jsp')">报表2</button>
        已点次数：
   <span id="dianjicishu"></span>	
   <div id="u"></div>
   
          
</body>
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>  
	
	  <script >
        var x=0;
        function ajaxload(local){	
        	  x=x+1;
        	  if(x==1){
        		  $("#u").load(local); 
        		  
        	  }else{
        		  $("#u").load(local); 
        		  $("#u").load(local);
        	  }		     
		      document.getElementById('dianjicishu').innerHTML = x;    
	       }
     </script>		   
</html>


