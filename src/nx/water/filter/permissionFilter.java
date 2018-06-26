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
		        //ǿ��ת��
				HttpServletRequest request = (HttpServletRequest)req;
				HttpServletResponse response = (HttpServletResponse)resp;
				//�Ƿ��¼�ж��߼�
				//���ж�����session�������
				HttpSession session = request.getSession(false);
				if(session==null){
					//û�е�¼
					response.sendRedirect(request.getContextPath()+"/noPermission.html");
					return;
				}else{					
					if(session.getAttribute("user")==null){
						//û�е�¼�ɹ�
						response.sendRedirect(request.getContextPath()+"/noPermission.html");
						return;
					}
				}
				
				//����Ѿ���¼�ɹ��ˣ�����У�
				chain.doFilter(request, response);

		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
