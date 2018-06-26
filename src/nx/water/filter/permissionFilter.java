package nx.water.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class permissionFilter
 */
@WebFilter("/permissionFilter")
public class permissionFilter implements Filter {

    /**
     * Default constructor. 
     */
    public permissionFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		        //强制转换
				HttpServletRequest request = (HttpServletRequest)req;
				HttpServletResponse response = (HttpServletResponse)resp;
				//是否登录判断逻辑
				//先判断有无session对象存在
				HttpSession session = request.getSession(false);
				if(session==null){
					//没有登录
					response.sendRedirect(request.getContextPath()+"/noPermission.html");
					return;
				}else{					
					if(session.getAttribute("user")==null){
						//没有登录成工
						response.sendRedirect(request.getContextPath()+"/noPermission.html");
						return;
					}
				}
				
				//如果已经登录成功了，则放行！
				chain.doFilter(request, response);

		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
