<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.2.1.js" ></script>
</head>
<body>
   <button id="ussts">dianji</button>
   <div id="content"></div>
</body>
<script type="text/javascript">
		 $(document).ready(function(){ 
		    $("#ussts").click(function(){		      
		      ajaxload('../user/NewFile1.jsp')		     
		   return false;
		  });	   		   
		  function ajaxload(local){			  
		      htmlobj=$.ajax({url:local,async:false});
		      $("#content").html(htmlobj.responseText);
		  }
		 }); 	
	</script> 
</html>