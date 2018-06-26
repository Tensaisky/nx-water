/**
 * 地图展示控制
 */

//创建和初始化地图函数：
    function initMap(){
      createMap();//创建地图
      setMapEvent();//设置地图事件     
      setinfo();//加载数据库信息
    }
    function createMap(){ 
      map = new BMap.Map("allmap"); //建树Map实例
      map.centerAndZoom(new BMap.Point(121.3087108264,31.3033217082),11);// 建树点坐标,初始化地图,设置中心点坐标和地图级别。
    }
    function setMapEvent(){
      map.enableScrollWheelZoom();//启用地图滚轮放大缩小
      map.enableContinuousZoom();
      map.enableDragging(); //启用地图拖拽事件，默认启用(可不写)
      
      // 添加带有定位的导航控件
      var navigationControl = new BMap.NavigationControl({
        // 靠左上角位置
        anchor: BMAP_ANCHOR_TOP_LEFT,
        // LARGE类型
        type: BMAP_NAVIGATION_CONTROL_LARGE,
        // 启用显示定位
        enableGeolocation: true
      });
      map.addControl(navigationControl);
      // 添加定位控件
      var geolocationControl = new BMap.GeolocationControl();
      geolocationControl.addEventListener("locationSuccess", function(e){
        // 定位成功事件
        var address = '';
        address += e.addressComponent.province;
        address += e.addressComponent.city;
        address += e.addressComponent.district;
        address += e.addressComponent.street;
        address += e.addressComponent.streetNumber;
        alert("当前定位地址为：" + address);
      });
      geolocationControl.addEventListener("locationError",function(e){
        // 定位失败事件
        alert(e.message);
      });
      map.addControl(geolocationControl);
      
      
    }
    function setinfo(){
    	var opts = {
				width : 250,     // 信息窗口宽度
				height: 220,     // 信息窗口高度
				//title : "信息窗口" , // 信息窗口标题
				enableMessage:true//设置允许信息窗发送短息
			   };
	    for(var i=0;i<mapjd.length;i++){
			var marker = new BMap.Marker(new BMap.Point(mapjd[i],mapwd[i]));  // 创建标注
			var content ="设备编号："+mapid[i]+"<br/>监测时间："+maptime[i]+
			             "<br/>PH值："+mapPH[i]+"<br/>电导率(uS/cm)："+mapCON[i]+"<br/>溶解氧(mg/L)："+mapDO[i]+
			             "<br/>浊度(NTU)："+mapTUR[i]+"<br/>温度(℃)："+mapTEMP[i]+"<br/>化学耗氧量(mg/L)："+mapCOD[i]+
			             "<br/>氨氮(mg/L)："+mapNH4[i]+"<br/>磷酸盐(mg/L)："+mapPO4[i];
			map.addOverlay(marker);  // 将标注添加到地图中
			marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
			addClickHandler(content,marker);
	   }
	    function addClickHandler(content,marker){
			marker.addEventListener("click",function(e){
				openInfo(content,e)}
			);
		}
		function openInfo(content,e){
			var p = e.target;
			var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
			var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象 
			map.openInfoWindow(infoWindow,point); //开启信息窗口
		}
    };
    
    var map;
    //  initMap();