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
import javax.servlet.http.HttpServletRequestWrapper;

/**
 * Servlet Filter implementation class EncodingFilter
 */
@WebFilter("/EncodingFilter")
public class EncodingFilter implements Filter {

    /**
     * Default constructor. 
     */
    public EncodingFilter() {
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
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		/**
		 * ˼·�� ʹ��װ����ģʽ��ȥװ��HttpServletRequest����
		 */
		// ���post�����ύ������
		request.setCharacterEncoding("utf-8");
		
		MyRequest myRequest = new MyRequest((HttpServletRequest) request);
		// ���У����е�����ʱװ�κ������Ķ���
		chain.doFilter(myRequest, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
//װ����
class MyRequest extends HttpServletRequestWrapper {
	private HttpServletRequest request;

	public MyRequest(HttpServletRequest request) {
		super(request);
		this.request = request;
	}

	@Override
	public String getParameter(String name) {
		try {
			/**
			 * GET�ύ��������
			 */
			// ԭ����
			String value = this.request.getParameter(name);
			if (value != null) {
				if ("GET".equals(this.request.getMethod())) {
					value = new String(value.getBytes("iso-8859-1"), "utf-8");
				}
			}
			return value;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	// �����ǵķ����� getParameterValues("name") / getParameterMap()



}
