<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'echart.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


        <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>  
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
	         });  
		</script>
<script type="text/javascript">
	// 路径配置
	require.config({
		paths : {
			echarts : 'http://echarts.baidu.com/build/dist'
		}
	});
	// 使用
	require([ 'echarts', 'echarts/chart/line', 'echarts/chart/bar'// 使用柱状图就加载bar模块，按需加载
	], 
	drewEcharts
);
	function drewEcharts(ec) {
		// 基于准备好的dom，初始化echarts图表
		var myChart = ec.init(document.getElementById('mai'));

		var option = {
			    title : {
			        text: '监测数据',
			        subtext: ''
			    },
			    tooltip : {
			        trigger: 'axis',
			        
			    },
			    dataZoom: [
	                 {
	                     type: 'slider',    //支持鼠标滚轮缩放
	                     start: 0,            //默认数据初始缩放范围为10%到90%
	                     end: 100
	                 },
	                 {
	                     type: 'inside',    //支持单独的滑动条缩放
	                     start: 0,            //默认数据初始缩放范围为10%到90%
	                     end: 100
	                 }
	            ],
			    legend: {
			    	
			        data:['PH值','电导率','溶解氧','浊度','温度','化学耗氧量','氨氮','磷酸盐']
			        
			    },
			    toolbox: {
			        show : true,
			        feature : {
			        	 dataZoom: {
			                 yAxisIndex: 'none'
			             },
			            dataView : {show: true, readOnly: false},
			            magicType : {show: true, type: ['bar', 'line']},
			            restore : {show: true},
			            saveAsImage : {show: true}
			           
			        }
			    },
			    
			    xAxis : [
			             {
			            	 name : '',
			            	 boundaryGap: false,
			            	 type : 'category',
			                 data : (function(){
			                                 var arr=[];
			                                 $.ajax({
			                                 type : "post",
			                                 async : false, //同步执行
			                                 url : "hisDate?action=findAllData",
			                                 data : {},
			                                 dataType : "json", //返回数据形式为json
			                                 success : function(result) {
			                                 if (result) {
			                                        for(var i=0;i<result.length;i++){
			                                           console.log(result[i].id);
			                                           arr.push(result[i].id);
			                                         }    
			                                 }
			                                 
			                             },
			                             error : function(errorMsg) {
			                                 alert("不好意思，图表请求数据失败啦!");
			                                 myChart.hideLoading();
			                             }
			                            })
			                            return arr;
			                         })() 
			             }
			         ],
			yAxis : [ {
				type : 'value',
				
				
			} ],
			series : [ 
			     {
				"name" : "PH值",
				"type" : "line",
				"data" : (function(){
                                        var arr=[];
                                        $.ajax({
                                        type : "post",
                                        async : false, //同步执行
                                        url : "hisDate?action=findAllData",
                                        data : {},
                                        dataType : "json", //返回数据形式为json
                                        success : function(result) {
                                        if (result) {
                                               for(var i=0;i<result.length;i++){
                                                  console.log(result[i].PH);
                                                  arr.push(result[i].PH);
                                                }  
                                        }
                                    },
                                    error : function(errorMsg) {
                                        alert("不好意思，大爷，图表请求数据失败啦!");
                                        myChart.hideLoading();
                                    }
                                   })
                                  return arr;
				 })(),
				 
				  markPoint : {
                data : [
                    {type : 'max', name: '最大值'},
                    {type : 'min', name: '最小值'}
                ]
            },
           /*  markLine : {
                data : [
                    {type : 'average', name: '平均值'}
                ]
            } */
				 },
			
				{
				name : '电导率',
				type : 'line',
				"data" : (function() {
					var arr = [];
					$.ajax({
						type : "post",
						async : false, //同步执行
						url : "hisDate?action=findAllData",
						data : {},
						dataType : "json", //返回数据形式为json
						success : function(result) {
							if (result) {
								for (var i = 0; i < result.length; i++) {
									console.log(result[i].CON);
									arr.push(result[i].CON);
								}
							}
						},
						error : function(errorMsg) {
							alert("不好意思，大爷，图表请求数据失败啦!");
							myChart.hideLoading();
						}
					})
					return arr;
				})(),
				markPoint : {
	                data : [
	                        {type : 'max', name: '最大值'},
	                        {type : 'min', name: '最小值'}
	                    ]
	                },
	                /* markLine : {
	                    data : [
	                        {type : 'average', name: '平均值'}
	                    ]
	                } */
	    	},
	    	{
				name : '溶解氧',
				type : 'line',
				"data" : (function() {
					var arr = [];
					$.ajax({
						type : "post",
						async : false, //同步执行
						url : "hisDate?action=findAllData",
						data : {},
						dataType : "json", //返回数据形式为json
						success : function(result) {
							if (result) {
								for (var i = 0; i < result.length; i++) {
									console.log(result[i].DO);
									arr.push(result[i].DO);
								}
							}
						},
						error : function(errorMsg) {
							alert("不好意思，大爷，图表请求数据失败啦!");
							myChart.hideLoading();
						}
					})
					return arr;
				})(),
				markPoint : {
	                data : [
	                        {type : 'max', name: '最大值'},
	                        {type : 'min', name: '最小值'}
	                    ]
	                },
	                /* markLine : {
	                    data : [
	                        {type : 'average', name: '平均值'}
	                    ]
	                } */
	    	},
	    	{
				name : '浊度',
				type : 'line',
				"data" : (function() {
					var arr = [];
					$.ajax({
						type : "post",
						async : false, //同步执行
						url : "hisDate?action=findAllData",
						data : {},
						dataType : "json", //返回数据形式为json
						success : function(result) {
							if (result) {
								for (var i = 0; i < result.length; i++) {
									console.log(result[i].TUR);
									arr.push(result[i].TUR);
								}
							}
						},
						error : function(errorMsg) {
							alert("不好意思，大爷，图表请求数据失败啦!");
							myChart.hideLoading();
						}
					})
					return arr;
				})(),
				markPoint : {
	                data : [
	                        {type : 'max', name: '最大值'},
	                        {type : 'min', name: '最小值'}
	                    ]
	                },
	                /* markLine : {
	                    data : [
	                        {type : 'average', name: '平均值'}
	                    ]
	                } */
	    	},
	    	{
				name : '温度',
				type : 'line',
				"data" : (function() {
					var arr = [];
					$.ajax({
						type : "post",
						async : false, //同步执行
						url : "hisDate?action=findAllData",
						data : {},
						dataType : "json", //返回数据形式为json
						success : function(result) {
							if (result) {
								for (var i = 0; i < result.length; i++) {
									console.log(result[i].TEMP);
									arr.push(result[i].TEMP);
								}
							}
						},
						error : function(errorMsg) {
							alert("不好意思，大爷，图表请求数据失败啦!");
							myChart.hideLoading();
						}
					})
					return arr;
				})(),
				markPoint : {
	                data : [
	                        {type : 'max', name: '最大值'},
	                        {type : 'min', name: '最小值'}
	                    ]
	                },
	                /* markLine : {
	                    data : [
	                        {type : 'average', name: '平均值'}
	                    ]
	                } */
	    	},
	    	{
				name : '化学耗氧量',
				type : 'line',
				"data" : (function() {
					var arr = [];
					$.ajax({
						type : "post",
						async : false, //同步执行
						url : "hisDate?action=findAllData",
						data : {},
						dataType : "json", //返回数据形式为json
						success : function(result) {
							if (result) {
								for (var i = 0; i < result.length; i++) {
									console.log(result[i].COD);
									arr.push(result[i].COD);
								}
							}
						},
						error : function(errorMsg) {
							alert("不好意思，大爷，图表请求数据失败啦!");
							myChart.hideLoading();
						}
					})
					return arr;
				})(),
				markPoint : {
	                data : [
	                        {type : 'max', name: '最大值'},
	                        {type : 'min', name: '最小值'}
	                    ]
	                },
	                /* markLine : {
	                    data : [
	                        {type : 'average', name: '平均值'}
	                    ]
	                } */
	    	},
	    	{
				name : '氨氮',
				type : 'line',
				"data" : (function() {
					var arr = [];
					$.ajax({
						type : "post",
						async : false, //同步执行
						url : "hisDate?action=findAllData",
						data : {},
						dataType : "json", //返回数据形式为json
						success : function(result) {
							if (result) {
								for (var i = 0; i < result.length; i++) {
									console.log(result[i].NH4);
									arr.push(result[i].NH4);
								}
							}
						},
						error : function(errorMsg) {
							alert("不好意思，大爷，图表请求数据失败啦!");
							myChart.hideLoading();
						}
					})
					return arr;
				})(),
				markPoint : {
	                data : [
	                        {type : 'max', name: '最大值'},
	                        {type : 'min', name: '最小值'}
	                    ]
	                },
	                /* markLine : {
	                    data : [
	                        {type : 'average', name: '平均值'}
	                    ]
	                } */
	    	},
	    	{
				name : '磷酸盐',
				type : 'line',
				"data" : (function() {
					var arr = [];
					$.ajax({
						type : "post",
						async : false, //同步执行
						url : "hisDate?action=findAllData",
						data : {},
						dataType : "json", //返回数据形式为json
						success : function(result) {
							if (result) {
								for (var i = 0; i < result.length; i++) {
									console.log(result[i].PO4);
									arr.push(result[i].PO4);
								}
							}
						},
						error : function(errorMsg) {
							alert("不好意思，大爷，图表请求数据失败啦!");
							myChart.hideLoading();
						}
					})
					return arr;
				})(),
				markPoint : {
	                data : [
	                        {type : 'max', name: '最大值'},
	                        {type : 'min', name: '最小值'}
	                    ]
	                },
	                /* markLine : {
	                    data : [
	                        {type : 'average', name: '平均值'}
	                    ]
	                } */
	    	}

			]
		};

		// 为echarts对象加载数据 
		myChart.setOption(option);
	}
</script>
</head>

<body >
  <div class="container">
                
     <div class="row">
	     <div class='col-sm-12' id="mai" style="height:500px; width:100%;"></div>
	</div>
	</div>
</body>
</html>
