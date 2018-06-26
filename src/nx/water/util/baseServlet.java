package nx.water.util;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class baseServlet
 */
@WebServlet("/baseServlet")
public class baseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public baseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ������δ���Ĺ��ԣ�
				// 1)���յ�action�Ĳ��� 2�����ݲ�ͬ�Ĳ���ֵ���ò�ͬ�ķ�����Լ��ǰ�᣺��������action�Ĳ���ֵһ�µģ�����)
				/**
				 * �û����ʵ�URL�� ����: /contact?action=addCon �޸ģ� /contact?action=updCon ɾ����
				 * /contact?action=delCon ��ѯ�� /contact?action=listCon
				 */
				// 1)��ȡaction�Ĳ���ֵ
				String action = request.getParameter("action");
				// 2)����action����ֵ����ִ��ʲô����
				/*
				 * if(action.equals("addCon")){ addCon(request, response); }else
				 * if(action.equals("updCon")){ updCon(request, response); }else
				 * if(action.equals("listCon")){ listCon(request, response); }
				 */
				try {
					/**
					 * ͨ������õ�ָ���������ķ��������ҵ��÷���
					 */
					Method method = this.getClass().getDeclaredMethod(action,
							HttpServletRequest.class, HttpServletResponse.class);
					// ִ�з���
					method.invoke(this, request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
