

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Subject;
import dao.SubjectDAO;
import tool.Action;

/**
 * Servlet implementation class SubjectComfirmAction
 */
public class SubjectConfirmAction extends Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = null;
		String name = request.getParameter("name");
		String id = request.getParameter("id");

		SubjectDAO dao = new SubjectDAO();

		if (dao.checkId(id)) {
			Subject subject = new Subject();
			subject.setId(id);
			subject.setSubjectName(name);
			request.setAttribute("subject", subject);
			url = "subjectConfirm.jsp";
		} else {
			request.setAttribute("message", "idが被っています");
			url = "subjectRegister.jsp";
		}
		return url;
	}
}
