package nx.water.biz.historicalDate.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import nx.water.biz.historicalDate.service.hisDateService;
import nx.water.biz.historicalDate.service.hisDateServiceImpl;
import nx.water.entity.pgroup;
import nx.water.entity.query;
import nx.water.entity.queryTest;
import nx.water.entity.rmd;
import nx.water.entity.rtu;
import nx.water.entity.test;
import nx.water.util.baseServlet;
import nx.water.util.webUtils;

/**
 * 历史数据的折线图显示
 */
@WebServlet("/hisDate")
public class hisDate extends baseServlet {
	private static final long serialVersionUID = 1L;
	hisDateService service = new hisDateServiceImpl();   
    /**
     * @see baseServlet#baseServlet()
     */
    public hisDate() {
        super();
        // TODO Auto-generated constructor stub
    }
    //按条件查询
    public void queryFind(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 接收用户输入的条件
    	//query que = webUtils.copyRequestToBean(request, query.class);
    	query que= new query();
    	String pgroup = request.getParameter("pgroup");
    	if("--请选择项目--".equals(pgroup)) {
    		//System.out.println("初始进入");
    	} else {
    		que.setPgroup(pgroup);
    	}   	
    	String rtu = request.getParameter("rtu");
    	if("--请选择设备--".equals(rtu)) {
    		//System.out.println("初始进入");
    	} else {
    		que.setRtu(rtu);
    	}
    	String setStartTime	=request.getParameter("startTime");
    	if(setStartTime !="") {
    		que.setStartTime(setStartTime);
    	}
    	String endTime	=request.getParameter("endTime");
    	if(endTime !="") {
    		que.setEndTime(endTime);
    	}
    	//System.out.println(que.toString());
    		//调用service方法查询
        	List<test> array=service.queryFind1(que);
        
        	//调用JSONArray.fromObject方法把array中的对象转化为JSON格式的数组
       	     JSONArray json=JSONArray.fromObject(array);

       	     //返回给前段页面
    	     PrintWriter out = response.getWriter();  
    	     out.println(json);  
    	     out.flush();  
    	     out.close(); 
    	 	
    	 
    }
    public void findd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//调用service方法查询
    	List<test> array=service.find();    
    	//调用JSONArray.fromObject方法把array中的对象转化为JSON格式的数组
   	     JSONArray json=JSONArray.fromObject(array);
   	     //返回给前段页面
	     PrintWriter out = response.getWriter();  
	     out.println(json);  
	     out.flush();  
	     out.close(); 
    }
    public void find(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//调用service方法查询
    	List<test> array=service.find();    
    	//调用JSONArray.fromObject方法把array中的对象转化为JSON格式的数组
   	     JSONArray json=JSONArray.fromObject(array);
   	     //返回给前段页面
	     PrintWriter out = response.getWriter();  
	     out.println(json);  
	     out.flush();  
	     out.close(); 
    }
    //显示所有数据
    public void findAllData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//接受用户输入参数
    	//调用service方法查询
    	List<rmd> array = (List<rmd>) service.findAllData();
    	//调用JSONArray.fromObject方法把array中的对象转化为JSON格式的数组
    	 JSONArray json=JSONArray.fromObject(array);
    	 
    	 //返回给前段页面
	     PrintWriter out = response.getWriter();  
	     out.println(json);  
	     out.flush();  
	     out.close();   
    }
    //动态加载项目下拉框
    public void findAllGroup(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//调用service方法查询
    	List<pgroup> array = (List<pgroup>) service.findAllGroup();
    	//调用JSONArray.fromObject方法把array中的对象转化为JSON格式的数组
    	 JSONArray json=JSONArray.fromObject(array);
    	 //返回给前段页面
	     PrintWriter out = response.getWriter();  
	     out.println(json);  
	     out.flush();  
	     out.close();   
    }
    //动态加载设备下拉框
    public void findAllEquipment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//调用service方法查询
    	List<rtu> array = (List<rtu>) service.findAllEquipment();
    	//调用JSONArray.fromObject方法把array中的对象转化为JSON格式的数组
    	 JSONArray json=JSONArray.fromObject(array);
    	 //返回给前段页面
	     PrintWriter out = response.getWriter();  
	     out.println(json);  
	     out.flush();  
	     out.close();   
    }

}
