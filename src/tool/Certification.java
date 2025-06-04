package tool;

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

import bean.User;

/**
 * Servlet Filter implementation class Certification
 */
@WebFilter("/*")
public class Certification implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpSession session = ((HttpServletRequest)request).getSession();
		User user = (User)session.getAttribute("user");
		String path=((HttpServletRequest)request).getServletPath().substring(1);
		if (user == null && !(path.equals("login.jsp") || path.equals("LoginServlet.action"))) {
			((HttpServletResponse)response).sendRedirect("/StudentProject/login.jsp");
			return;
		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

	@Override
	public void destroy() {

	}

}
