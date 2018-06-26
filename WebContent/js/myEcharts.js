
        // 基于准备好的dom，初始化echarts图表
    var myChart1 = echarts.init(document.getElementById('chart1')); 
        
        var option = {
    title: {
        text: '检测数据',       
    },
    tooltip: {
        trigger: 'axis'
    },
    legend: {
        data:['PH','CON','DO','TUR','TEMP']
    },
    toolbox: {
            feature: {           
            saveAsImage: {}
        }
    },
    xAxis:  {
        type: 'category',
        boundaryGap: false,
        data: ['00:00','01:00','02:00','03:00','04:00','05:00','06:00']
    },
    yAxis: {
        type: 'value',
        axisLabel: {
            formatter: '{value} °C'
        }
    },
    series: [
        {
            name:'PH',
            type:'line',
            data:[11, 11, 15, 13, 12, 13, 10],          
        },
         {
            name:'CON',
            type:'line',
            data:[23, 13, 34, 12, 9, 20, 10],          
        },
         {
            name:'DO',
            type:'line',
            data:[16,10, 15, 18, 32,27,35],          
        },
         {
            name:'TUR',
            type:'line',
            data:[17, 26, 11,20, 45, 11,20],          
        },
         {
            name:'TEMP',
            type:'line',
            data:[12, 9, 22,16, 28, 23, 6],          
        }        
    ]
};
// 为echarts对象加载数据 
myChart1.setOption(option); 

        