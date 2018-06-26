package nx.water.biz.admin.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import nx.water.biz.admin.dao.adminDaoImpl;
import nx.water.biz.admin.service.adminService;
import nx.water.biz.admin.service.adminServiceImpl;
import nx.water.entity.PageBean;
import nx.water.entity.user;
import nx.water.util.WebUtil;
import nx.water.util.baseServlet;

/**
 * Servlet implementation class admin
 */
@WebServlet("/admin")
public class admin extends baseServlet {
	private static final long serialVersionUID = 1L;
	adminService service = new adminServiceImpl();
	adminDaoImpl dao=new adminDaoImpl();
	/**
	 * @see baseServlet#baseServlet()
	 */
	public admin() {
		super();
		// TODO Auto-generated constructor stub
	}

	// 查询所有用户信息
	public void findAllUsers(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			List<user> cs = service.findAll();// 调用service方法查询数据
			request.setAttribute("cs", cs);// 将结果保存到域对象
			request.getRequestDispatcher("/jsp/admin/userManagement.jsp").forward(request, response);
			return;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.getWriter().write("查询失败");
			return;
		}

	}

	// 增加账户
	public void addUsers(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		//得到修改后的数据
		String list = request.getParameter("datalist");		
		//提取到集合
		Pattern p=Pattern.compile("\"(.*?)\"");
		Matcher m=p.matcher(list);
		ArrayList<String> list1 = new ArrayList<String>();
		String str=null;
		 while(m.find()){
		    list1.add(m.group());
		 }
		 String regexp = "\"";		  		
		 //赋值给实体对象
		 user c = new user();
	    c.setUSER_ID(list1.get(5).replaceAll(regexp, ""));
		c.setUSER_PSW(list1.get(9).replaceAll(regexp, ""));
		c.setPGROUP_ID(list1.get(1).replaceAll(regexp, ""));
		c.setUSER_DESC(list1.get(3).replaceAll(regexp, ""));
		c.setUSER_NAME(list1.get(7).replaceAll(regexp, ""));
		c.setUSER_ROLE(list1.get(11).replaceAll(regexp, ""));
		//System.out.println(c.toString());
		 int res=dao.updateUser(c);
		// System.out.println(res);
		//调用JSONArray.fromObject方法把array中的对象转化为JSON格式的数组
	   	JSONArray json=JSONArray.fromObject(res);
	   	// System.out.println(json);
	   	//返回给前段页面
		PrintWriter out = response.getWriter();  
		 out.println(json);  
		 out.flush();  
		 out.close();				
		
		
	}

	// 删除用户
	public void delByID(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 得到要删除的id
		String USER_NAME = request.getParameter("USER_NAME");
		
		//System.out.println(USER_NAME);
		// 调用serivice方法删除用户
		int deResult=service.delById(USER_NAME);
		
		//调用JSONArray.fromObject方法把array中的对象转化为JSON格式的数组
   	    JSONArray json=JSONArray.fromObject(deResult);
   	    // System.out.println(json);
   	    //返回给前段页面
	     PrintWriter out = response.getWriter();  
	     out.println(json);  
	     out.flush();  
	     out.close(); 

	}

	// 修改用户信息
	public void updateUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 response.setCharacterEncoding("utf-8");  
	        
		// 拷贝表单的数据
		@SuppressWarnings("unused")
		user user = WebUtil.copyRequestToBean(request, user.class);
		//System.out.println("servlet"+user.getPGROUP_ID());
		//String name =  request.getParameter("USER_NAME");
		// 调用serivice方法删除用户
		int res =service.add(user);
		
		
		JSONArray json=JSONArray.fromObject(res);
   	    // System.out.println(json);
   	    //返回给前段页面
	     PrintWriter out = response.getWriter();  
	     out.println(json);  
	     out.flush();  
	     out.close(); 
		

	}

	// 分页查询
	public void pagination(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 接收用户参数
		String currentPage = request.getParameter("currentPage");
		if (currentPage == null || currentPage.equals("")) {
			// 如果第一次访问，没有currentPage,则为1
			currentPage = "1";
		}
		//接收用户输入的煤业显现记录数
		String pageSize = request.getParameter("pageSize");
		if(pageSize == null || pageSize.equals("")) {
			pageSize="5";
		}
		//调用service方法，获取结果
		PageBean pageBean = service.queryPageBean(Integer.parseInt(currentPage),Integer.parseInt(pageSize));
		// 把PageBean对象放到与对象中
		request.setAttribute("pageBean", pageBean);
		// 转发到jsp页面
		request.getRequestDispatcher("/jsp/admin/userManagement.jsp").forward(request, response);
	}
	
	public void finduser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setCharacterEncoding("utf-8");  
        PrintWriter pw = response.getWriter();  
          
        //得到客户端传递的页码和每页记录数，并转换成int类型  
      
		int pageSize = Integer.parseInt(request.getParameter("pageSize")); //5,10,15      
       int pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //当前页面   
       
      // String departmentname = request.getParameter("departmentname");
     //  String statu = request.getParameter("statu");
        //分页查找商品销售记录，需判断是否有带查询条件  
        List<user> sellRecordList = service.findAllP(pageNumber, pageSize);
          
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

}
