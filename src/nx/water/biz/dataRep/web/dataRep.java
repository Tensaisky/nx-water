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
         int pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //��ǰҳ��   
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
		//����service������ѯ
    	List<test> array=service.queryFind1(que);
    	//�õ��ܼ�¼��  
        int total = array.size(); 
    	//��ҳ
    	List<test> array1=service.hispage(pageNumber, pageSize, array, total);
    	
    	//����JSONArray.fromObject������array�еĶ���ת��ΪJSON��ʽ������
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
           
         //�õ��ͻ��˴��ݵ�ҳ���ÿҳ��¼������ת����int����  
       
		int pageSize = Integer.parseInt(request.getParameter("pageSize")); //5,10,15      
        int pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //��ǰҳ��   
        
        String departmentname = request.getParameter("departmentname");
        String statu = request.getParameter("statu");
         //��ҳ������Ʒ���ۼ�¼�����ж��Ƿ��д���ѯ����  
         List<test> sellRecordList = service.findAllDataP(pageNumber, pageSize);
           
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
	// ��ѯ��������
	public void findAllData(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<test> cs = service.findAllData();// ����service������ѯ����
		request.setAttribute("datatest", cs);// ��������浽�����
		request.getRequestDispatcher("/jsp/user/dataReport.jsp").forward(request, response);
	}

	/*
	 * // ��ҳ��ѯ���� public void findAllDataP(HttpServletRequest request,
	 * HttpServletResponse response) throws ServletException, IOException {
	 * 
	 * // �����û����� String currentPage = request.getParameter("currentPage"); if
	 * (currentPage == null || currentPage.equals("")) { //
	 * �����һ�η��ʣ�û��currentPage,��Ϊ1 currentPage = "1"; } // �����û������úҵ���ּ�¼�� String
	 * pageSize = request.getParameter("pageSize"); if (pageSize == null ||
	 * pageSize.equals("")) { pageSize = "5"; } // ����service��������ȡ��� PageBean
	 * pageBean = service.dataQueryPageBean(Integer.parseInt(currentPage),
	 * Integer.parseInt(pageSize)); // ��PageBean����ŵ��������
	 * request.setAttribute("datatPage", pageBean); // ת����jspҳ��
	 * request.getRequestDispatcher("/jsp/user/dataReport.jsp").forward(request,
	 * response); }
	 */

	// ��ҳ+���� ��ѯ����
	public void findDataByTime(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// �����û����������
		queryTest qu = webUtils.copyRequestToBean(request, queryTest.class);
		// �����û�����
		String currentPage = request.getParameter("currentPage");
		if (currentPage == null || currentPage.equals("")) {
			// �����һ�η��ʣ�û��currentPage,��Ϊ1
			currentPage = "1";
		}
		// �����û������úҵ���ּ�¼��
		String pageSize = request.getParameter("pageSize");
		if (pageSize == null || pageSize.equals("")) {
			pageSize = "5";
		}
		// ����service��������ȡ���
		PageBean pageBean = service.dataQueryPageBean(Integer.parseInt(currentPage), Integer.parseInt(pageSize), qu);
		// ��PageBean����ŵ��������
		request.setAttribute("datatPage", pageBean);
		// ת����jspҳ��
		request.getRequestDispatcher("/jsp/user/dataReport.jsp").forward(request, response);
		//response.sendRedirect("/jsp/user/dataReport.jsp");
		
	}

	// ������excel
	public void exportExcel(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<test> employ = null;
		// �����û����������
		queryTest qu = webUtils.copyRequestToBean(request, queryTest.class);
		//����service����ʵ�ֵ���
		service.Export(employ, qu);
		response.sendRedirect(request.getContextPath() + "/dataRep?action=findDataByTime");
	}

}
