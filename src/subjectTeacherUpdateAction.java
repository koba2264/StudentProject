import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SubjectDAO;
import tool.Action;

public class subjectTeacherUpdateAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] teacherList = request.getParameterValues("userId");
		String subjectId = request.getParameter("subjectId");
		SubjectDAO dao = new SubjectDAO();
		dao.updateTeacher(subjectId, teacherList);
		return "SubjectTeacherView.action";
	}

}
