package nx.water.biz.dataRep.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import nx.water.biz.dataRep.service.dataRepService;
import nx.water.biz.dataRep.service.dataRepServiceImpl;
import nx.water.entity.PageBean;
import nx.water.entity.query;
import nx.water.entity.queryTest;
import nx.water.entity.test;
import nx.water.util.baseServlet;
import nx.water.util.webUtils;

/**
 * Servlet implementation class dataRep
 */
@WebServlet("/dataRep")
public class dataRep extends baseServlet {
	private static final long serialVersionUID = 1L;
	dataRepService service = new dataRepServiceImpl();
    
	/**
	 * @see baseServlet#baseServlet()
	 */
	public dataRep() {
		super();
		// TODO Auto-generated constructor stub
	}
    public void hisfind(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/xml;charset=utf-8");  
    	 int pageSize = Integer.parseInt(request.getParameter("pageSize")); //5,10,15      
         int pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //当前页面   
        query que= new query();
        String pgroup = request.getParameter("pgroup");
        if(pgroup.length()!=0) {
    		que.setPgroup(pgroup);
    	}   	
    	String rtu = request.getParameter("rtu");
    	 if(rtu.length()!=0) {
     		que.setRtu(rtu);
     	}   
     	String setStartTime	=request.getParameter("startTime");
    	if(setStartTime.length() !=0) {
    		que.setStartTime(setStartTime);
    	}
    	String endTime	=request.getParameter("endTime");
    	if(endTime.length() !=0) {
    		que.setEndTime(endTime);
    	}
     	//System.out.println(que.toString());
		//调用service方法查询
    	List<test> array=service.queryFind1(que);
    	//得到总记录数  
        int total = array.size(); 
    	//分页
    	List<test> array1=service.hispage(pageNumber, pageSize, array, total);
    	
    	//调用JSONArray.fromObject方法把array中的对象转化为JSON格式的数组
  	     JSONArray json=JSONArray.fromObject(array1);
   	    
   	    String json1 = "{\"total\":" + total + ",\"rows\":" + json + "}"; 
     
   	 PrintWriter out = response.getWriter();  
     out.println(json1);  
     out.flush();  
     out.close();  
    	
    	    
    }
    @SuppressWarnings("unused")
	public void findall(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// response.setCharacterEncoding("utf-8");  
         PrintWriter pw = response.getWriter();  
           
         //得到客户端传递的页码和每页记录数，并转换成int类型  
       
		int pageSize = Integer.parseInt(request.getParameter("pageSize")); //5,10,15      
        int pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //当前页面   
        
        String departmentname = request.getParameter("departmentname");
        String statu = request.getParameter("statu");
         //分页查找商品销售记录，需判断是否有带查询条件  
         List<test> sellRecordList = service.findAllDataP(pageNumber, pageSize);
           
         //将商品销售记录转换成json字符串  
         JSONArray json=JSONArray.fromObject(sellRecordList);
     	  String sellRecordJson=json.toString();
         //得到总记录数  
         int total = service.queryCount();           
         //需要返回的数据有总记录数和行数据  
         String json1 = "{\"total\":" + total + ",\"rows\":" + sellRecordJson + "}"; 
         //System.out.println(json1);
         pw.print(json1);  
    }
	// 查询所有数据
	public void findAllData(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<test> cs = service.findAllData();// 调用service方法查询数据
		request.setAttribute("datatest", cs);// 将结果保存到域对象
		request.getRequestDispatcher("/jsp/user/dataReport.jsp").forward(request, response);
	}

	/*
	 * // 分页查询数据 public void findAllDataP(HttpServletRequest request,
	 * HttpServletResponse response) throws ServletException, IOException {
	 * 
	 * // 接收用户参数 String currentPage = request.getParameter("currentPage"); if
	 * (currentPage == null || currentPage.equals("")) { //
	 * 如果第一次访问，没有currentPage,则为1 currentPage = "1"; } // 接收用户输入的煤业显现记录数 String
	 * pageSize = request.getParameter("pageSize"); if (pageSize == null ||
	 * pageSize.equals("")) { pageSize = "5"; } // 调用service方法，获取结果 PageBean
	 * pageBean = service.dataQueryPageBean(Integer.parseInt(currentPage),
	 * Integer.parseInt(pageSize)); // 把PageBean对象放到与对象中
	 * request.setAttribute("datatPage", pageBean); // 转发到jsp页面
	 * request.getRequestDispatcher("/jsp/user/dataReport.jsp").forward(request,
	 * response); }
	 */

	// 分页+条件 查询数据
	public void findDataByTime(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 接收用户输入的条件
		queryTest qu = webUtils.copyRequestToBean(request, queryTest.class);
		// 接收用户参数
		String currentPage = request.getParameter("currentPage");
		if (currentPage == null || currentPage.equals("")) {
			// 如果第一次访问，没有currentPage,则为1
			currentPage = "1";
		}
		// 接收用户输入的煤业显现记录数
		String pageSize = request.getParameter("pageSize");
		if (pageSize == null || pageSize.equals("")) {
			pageSize = "5";
		}
		// 调用service方法，获取结果
		PageBean pageBean = service.dataQueryPageBean(Integer.parseInt(currentPage), Integer.parseInt(pageSize), qu);
		// 把PageBean对象放到与对象中
		request.setAttribute("datatPage", pageBean);
		// 转发到jsp页面
		request.getRequestDispatcher("/jsp/user/dataReport.jsp").forward(request, response);
		//response.sendRedirect("/jsp/user/dataReport.jsp");
		
	}

	// 导出到excel
	public void exportExcel(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<test> employ = null;
		// 接收用户输入的条件
		queryTest qu = webUtils.copyRequestToBean(request, queryTest.class);
		//调用service方法实现导出
		service.Export(employ, qu);
		response.sendRedirect(request.getContextPath() + "/dataRep?action=findDataByTime");
	}

}
