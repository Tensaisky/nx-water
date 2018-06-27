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
 * 用户登录，注销，
 * 查询历史数据
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
    //根据用户的输入信息验证
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		// 拷贝表单的数据		
		user user = WebUtil.copyRequestToBean(request, user.class);		
		// 验证用户名
		user loginUser = service.login(user.getUSER_NAME());
		if (loginUser != null) {
			// 用户名正确，验证密码
			// 先对用户输入的密码进行md5加密。
			String digestPassworld = md5pass.md5(user.getUSER_PSW());
			// 数据库密码和输入的密码比对
			if (digestPassworld.equals(loginUser.getUSER_PSW())) {
				// 登录成功，把用户数据保存到session中去。
				HttpSession session = request.getSession(true);
				session.setAttribute("user", loginUser);
				// 跳转到用户主页
				response.sendRedirect(request.getContextPath() + "/jsp/front/index.jsp");
				return;
			} else {
				// 登陆失败
				request.setAttribute("msg", "密码错误,请重新输入");
				request.getRequestDispatcher("login.jsp").forward(request, response);
				return;
			}
		} else {
			// 登陆失败
			request.setAttribute("msg", "用户不存在,请重新输入");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}
	}

	public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//false代表：不创建session对象，只是从request中获取。
	    HttpSession session=request.getSession(false);  
        if(session==null){  
        	//没有session域对象，表示没有登陆
            response.sendRedirect("login.jsp");  
            return;  
        }  
        //删除用户登陆信息
        session.removeAttribute("user"); 
      //重定向到登陆界面
        response.sendRedirect("login.jsp"); 
	}

}
