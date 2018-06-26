/**
 * 
 */

   
    function  setoption(){    	
        option = {
           title: {
               text: "",
               subtext: ""
           },
           tooltip: {
               trigger: "axis",
               
           },
           legend: {
        	   
        	   data:['销量','danjia']
           },
           toolbox: {
        	   show : true,
               feature : {
                   mark : {show: true},
                   dataZoom : {show: true},
                   dataView : {show: true, readOnly: false},
                   restore : {show: true},
                   saveAsImage : {show: true}
               }
           },
           xAxis: {
               type: 'category',
               boundaryGap: false,
               data: id
           },
           yAxis: {
               type: "value"
           },
           series: [
        	    {name: "PH", type: "line", data: PH,markPoint: {
                    data: [
                        {type: 'max', name: '最大值'},
                        {type: 'min', name: '最小值'}
                    ]
                }}, 
        	   {name: "CON", type: "line", data: CON,markPoint: {
                   data: [
                       {type: 'max', name: '最大值'},
                       {type: 'min', name: '最小值'}
                   ]
               }},
        	   /* {name: "DO", type: "line", data: DO},
        	   {name: "TUR", type: "line", data: TUR}, 
        	   {name: "TEMP", type: "line", data: TEMP},
        	   {name: "COD", type: "line", data: COD},
        	   {name: "NH4", type: "line", data: NH4},
        	   {name: "PO4", type: "line", data: PO4}  */
          ]
       }
       
    }   
    
    
    
    function  setoption1(){    	
        option1 = {
           title: {
               text: "1234",
               subtext: ""
           },
           tooltip: {
               trigger: "axis",
               
           },
           legend: {
        	   
        	   data:['销量','danjia']
           },
           toolbox: {
        	   show : true,
               feature : {
                   mark : {show: true},
                   dataZoom : {show: true},
                   dataView : {show: true, readOnly: false},
                   restore : {show: true},
                   saveAsImage : {show: true}
               }
           },
           xAxis: {
               type: 'category',
               boundaryGap: false,
               data: id
           },
           yAxis: {
               type: "value"
           },
           series: [
        	    {name: "PH", type: "line", data: DO,markPoint: {
                    data: [
                        {type: 'max', name: '最大值'},
                        {type: 'min', name: '最小值'}
                    ]
                }}, 
        	   {name: "CON", type: "line", data: TUR,markPoint: {
                   data: [
                       {type: 'max', name: '最大值'},
                       {type: 'min', name: '最小值'}
                   ]
               }},
        	 
          ]
       }
       
    }   