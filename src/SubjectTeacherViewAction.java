import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Subject;
import dao.SubjectDAO;
import tool.Action;

public class SubjectTeacherViewAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SubjectDAO dao = new SubjectDAO();
		List<Subject> subjects = dao.all();
		request.setAttribute("subjects", subjects);
		return "subjectTeacherView.jsp";
	}

}
