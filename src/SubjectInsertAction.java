import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Subject;
import dao.SubjectDAO;
import tool.Action;

public class SubjectInsertAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "subjectRegister.jsp";
		Subject subject = new Subject();
		subject.setId(request.getParameter("id"));
		subject.setName(request.getParameter("name"));
		SubjectDAO dao = new SubjectDAO();
		request.setAttribute("subject", subject);
		if (dao.insert(subject)) {
			url = "subject_result.jsp";
		} else {
			request.setAttribute("message", "登録できませんでした");
		}

		return url;
	}

}
