

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;

/**
 * Servlet implementation class SubjectRegisterAction
 */
public class SubjectRegisterAction extends Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return "subjectRegister.jsp";
	}
}
