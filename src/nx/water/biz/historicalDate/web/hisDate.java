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
 * ��ʷ���ݵ�����ͼ��ʾ
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
    //��������ѯ
    public void queryFind(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// �����û����������
    	//query que = webUtils.copyRequestToBean(request, query.class);
    	query que= new query();
    	String pgroup = request.getParameter("pgroup");
    	if("--��ѡ����Ŀ--".equals(pgroup)) {
    		//System.out.println("��ʼ����");
    	} else {
    		que.setPgroup(pgroup);
    	}   	
    	String rtu = request.getParameter("rtu");
    	if("--��ѡ���豸--".equals(rtu)) {
    		//System.out.println("��ʼ����");
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
    		//����service������ѯ
        	List<test> array=service.queryFind1(que);
        
        	//����JSONArray.fromObject������array�еĶ���ת��ΪJSON��ʽ������
       	     JSONArray json=JSONArray.fromObject(array);

       	     //���ظ�ǰ��ҳ��
    	     PrintWriter out = response.getWriter();  
    	     out.println(json);  
    	     out.flush();  
    	     out.close(); 
    	 	
    	 
    }
    public void findd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//����service������ѯ
    	List<test> array=service.find();    
    	//����JSONArray.fromObject������array�еĶ���ת��ΪJSON��ʽ������
   	     JSONArray json=JSONArray.fromObject(array);
   	     //���ظ�ǰ��ҳ��
	     PrintWriter out = response.getWriter();  
	     out.println(json);  
	     out.flush();  
	     out.close(); 
    }
    public void find(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//����service������ѯ
    	List<test> array=service.find();    
    	//����JSONArray.fromObject������array�еĶ���ת��ΪJSON��ʽ������
   	     JSONArray json=JSONArray.fromObject(array);
   	     //���ظ�ǰ��ҳ��
	     PrintWriter out = response.getWriter();  
	     out.println(json);  
	     out.flush();  
	     out.close(); 
    }
    //��ʾ��������
    public void findAllData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//�����û��������
    	//����service������ѯ
    	List<rmd> array = (List<rmd>) service.findAllData();
    	//����JSONArray.fromObject������array�еĶ���ת��ΪJSON��ʽ������
    	 JSONArray json=JSONArray.fromObject(array);
    	 
    	 //���ظ�ǰ��ҳ��
	     PrintWriter out = response.getWriter();  
	     out.println(json);  
	     out.flush();  
	     out.close();   
    }
    //��̬������Ŀ������
    public void findAllGroup(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//����service������ѯ
    	List<pgroup> array = (List<pgroup>) service.findAllGroup();
    	//����JSONArray.fromObject������array�еĶ���ת��ΪJSON��ʽ������
    	 JSONArray json=JSONArray.fromObject(array);
    	 //���ظ�ǰ��ҳ��
	     PrintWriter out = response.getWriter();  
	     out.println(json);  
	     out.flush();  
	     out.close();   
    }
    //��̬�����豸������
    public void findAllEquipment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//����service������ѯ
    	List<rtu> array = (List<rtu>) service.findAllEquipment();
    	//����JSONArray.fromObject������array�еĶ���ת��ΪJSON��ʽ������
    	 JSONArray json=JSONArray.fromObject(array);
    	 //���ظ�ǰ��ҳ��
	     PrintWriter out = response.getWriter();  
	     out.println(json);  
	     out.flush();  
	     out.close();   
    }

}
