package nx.water.biz.monitoring.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import nx.water.biz.monitoring.service.monitorService;
import nx.water.biz.monitoring.service.monitorServiceImpl;
import nx.water.entity.mapShowInfo;
import nx.water.entity.position;
import nx.water.util.baseServlet;

/**
 * Servlet implementation class minitorServelet
 */
@WebServlet("/minitorServelet")
public class minitorServelet extends baseServlet {
	private static final long serialVersionUID = 1L;
	monitorService service = new monitorServiceImpl();      
    /**
     * @see baseServlet#baseServlet()
     */
    public minitorServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void findAllPosition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	response.setContentType("text/html; charset=utf-8"); 
    	//����service������ѯ
    	List<position> array = (List<position>) service.find();
    	//����JSONArray.fromObject������array�еĶ���ת��ΪJSON��ʽ������
    	 JSONArray json=JSONArray.fromObject(array);
    	
    	 //���ظ�ǰ��ҳ��
	     PrintWriter out = response.getWriter();  
	     out.println(json);  
	     out.flush();  
	     out.close(); 
    }
    
    public void mapShow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html; charset=utf-8"); 
    	//����service������ѯ
    	List<mapShowInfo> array = (List<mapShowInfo>) service.mapShow1();
    	//����JSONArray.fromObject������array�еĶ���ת��ΪJSON��ʽ������
    	 JSONArray json=JSONArray.fromObject(array);   	
    	 //���ظ�ǰ��ҳ��
	     PrintWriter out = response.getWriter();  
	     out.println(json);  
	     out.flush();  
	     out.close(); 
    }

}
