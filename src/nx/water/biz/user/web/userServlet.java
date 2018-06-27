package nx.water.biz.user.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import nx.water.biz.user.service.userService;
import nx.water.biz.user.service.userServiceImpl;
import nx.water.entity.test;
import nx.water.entity.user;
import nx.water.util.MD5Util;
import nx.water.util.WebUtil;
import nx.water.util.baseServlet;
import nx.water.util.webUtils;

/**
 * 
 * �û���¼��ע����
 * ��ѯ��ʷ����
 */

@WebServlet("/userServlet")
public class userServlet extends baseServlet {
	private static final long serialVersionUID = 1L;
	userService service = new userServiceImpl();
	MD5Util md5pass = new MD5Util();

	/**
	 * @see baseServlet#baseServlet()
	 */
	public userServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
    //�����û���������Ϣ��֤
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		// ������������		
		user user = WebUtil.copyRequestToBean(request, user.class);		
		// ��֤�û���
		user loginUser = service.login(user.getUSER_NAME());
		if (loginUser != null) {
			// �û�����ȷ����֤����
			// �ȶ��û�������������md5���ܡ�
			String digestPassworld = md5pass.md5(user.getUSER_PSW());
			// ���ݿ���������������ȶ�
			if (digestPassworld.equals(loginUser.getUSER_PSW())) {
				// ��¼�ɹ������û����ݱ��浽session��ȥ��
				HttpSession session = request.getSession(true);
				session.setAttribute("user", loginUser);
				// ��ת���û���ҳ
				response.sendRedirect(request.getContextPath() + "/jsp/front/index.jsp");
				return;
			} else {
				// ��½ʧ��
				request.setAttribute("msg", "�������,����������");
				request.getRequestDispatcher("login.jsp").forward(request, response);
				return;
			}
		} else {
			// ��½ʧ��
			request.setAttribute("msg", "�û�������,����������");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}
	}

	public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//false����������session����ֻ�Ǵ�request�л�ȡ��
	    HttpSession session=request.getSession(false);  
        if(session==null){  
        	//û��session����󣬱�ʾû�е�½
            response.sendRedirect("login.jsp");  
            return;  
        }  
        //ɾ���û���½��Ϣ
        session.removeAttribute("user"); 
      //�ض��򵽵�½����
        response.sendRedirect("login.jsp"); 
	}

}
