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

	// ��ѯ�����û���Ϣ
	public void findAllUsers(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			List<user> cs = service.findAll();// ����service������ѯ����
			request.setAttribute("cs", cs);// ��������浽�����
			request.getRequestDispatcher("/jsp/admin/userManagement.jsp").forward(request, response);
			return;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.getWriter().write("��ѯʧ��");
			return;
		}

	}

	// �����˻�
	public void addUsers(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		//�õ��޸ĺ������
		String list = request.getParameter("datalist");		
		//��ȡ������
		Pattern p=Pattern.compile("\"(.*?)\"");
		Matcher m=p.matcher(list);
		ArrayList<String> list1 = new ArrayList<String>();
		String str=null;
		 while(m.find()){
		    list1.add(m.group());
		 }
		 String regexp = "\"";		  		
		 //��ֵ��ʵ�����
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
		//����JSONArray.fromObject������array�еĶ���ת��ΪJSON��ʽ������
	   	JSONArray json=JSONArray.fromObject(res);
	   	// System.out.println(json);
	   	//���ظ�ǰ��ҳ��
		PrintWriter out = response.getWriter();  
		 out.println(json);  
		 out.flush();  
		 out.close();				
		
		
	}

	// ɾ���û�
	public void delByID(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// �õ�Ҫɾ����id
		String USER_NAME = request.getParameter("USER_NAME");
		
		//System.out.println(USER_NAME);
		// ����serivice����ɾ���û�
		int deResult=service.delById(USER_NAME);
		
		//����JSONArray.fromObject������array�еĶ���ת��ΪJSON��ʽ������
   	    JSONArray json=JSONArray.fromObject(deResult);
   	    // System.out.println(json);
   	    //���ظ�ǰ��ҳ��
	     PrintWriter out = response.getWriter();  
	     out.println(json);  
	     out.flush();  
	     out.close(); 

	}

	// �޸��û���Ϣ
	public void updateUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 response.setCharacterEncoding("utf-8");  
	        
		// ������������
		@SuppressWarnings("unused")
		user user = WebUtil.copyRequestToBean(request, user.class);
		//System.out.println("servlet"+user.getPGROUP_ID());
		//String name =  request.getParameter("USER_NAME");
		// ����serivice����ɾ���û�
		int res =service.add(user);
		
		
		JSONArray json=JSONArray.fromObject(res);
   	    // System.out.println(json);
   	    //���ظ�ǰ��ҳ��
	     PrintWriter out = response.getWriter();  
	     out.println(json);  
	     out.flush();  
	     out.close(); 
		

	}

	// ��ҳ��ѯ
	public void pagination(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// �����û�����
		String currentPage = request.getParameter("currentPage");
		if (currentPage == null || currentPage.equals("")) {
			// �����һ�η��ʣ�û��currentPage,��Ϊ1
			currentPage = "1";
		}
		//�����û������úҵ���ּ�¼��
		String pageSize = request.getParameter("pageSize");
		if(pageSize == null || pageSize.equals("")) {
			pageSize="5";
		}
		//����service��������ȡ���
		PageBean pageBean = service.queryPageBean(Integer.parseInt(currentPage),Integer.parseInt(pageSize));
		// ��PageBean����ŵ��������
		request.setAttribute("pageBean", pageBean);
		// ת����jspҳ��
		request.getRequestDispatcher("/jsp/admin/userManagement.jsp").forward(request, response);
	}
	
	public void finduser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setCharacterEncoding("utf-8");  
        PrintWriter pw = response.getWriter();  
          
        //�õ��ͻ��˴��ݵ�ҳ���ÿҳ��¼������ת����int����  
      
		int pageSize = Integer.parseInt(request.getParameter("pageSize")); //5,10,15      
       int pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //��ǰҳ��   
       
      // String departmentname = request.getParameter("departmentname");
     //  String statu = request.getParameter("statu");
        //��ҳ������Ʒ���ۼ�¼�����ж��Ƿ��д���ѯ����  
        List<user> sellRecordList = service.findAllP(pageNumber, pageSize);
          
        //����Ʒ���ۼ�¼ת����json�ַ���  
        JSONArray json=JSONArray.fromObject(sellRecordList);
    	  String sellRecordJson=json.toString();
        //�õ��ܼ�¼��  
        int total = service.queryCount();           
        //��Ҫ���ص��������ܼ�¼����������  
        String json1 = "{\"total\":" + total + ",\"rows\":" + sellRecordJson + "}"; 
        //System.out.println(json1);
        pw.print(json1);  
	}

}
