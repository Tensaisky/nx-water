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
		// 以下这段代码的共性：
				// 1)接收到action的参数 2）根据不同的参数值调用不同的方法（约定前提：方法名和action的参数值一致的！！！)
				/**
				 * 用户访问的URL： 增加: /contact?action=addCon 修改： /contact?action=updCon 删除：
				 * /contact?action=delCon 查询： /contact?action=listCon
				 */
				// 1)获取action的参数值
				String action = request.getParameter("action");
				// 2)根据action参数值决定执行什么功能
				/*
				 * if(action.equals("addCon")){ addCon(request, response); }else
				 * if(action.equals("updCon")){ updCon(request, response); }else
				 * if(action.equals("listCon")){ listCon(request, response); }
				 */
				try {
					/**
					 * 通过反射得到指定方法名的方法对象，且调用方法
					 */
					Method method = this.getClass().getDeclaredMethod(action,
							HttpServletRequest.class, HttpServletResponse.class);
					// 执行方法
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
