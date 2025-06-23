import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StudentDAO;
import tool.Action;

public class GraduationStudentAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String classId = request.getParameter("classId");
		StudentDAO dao = new StudentDAO();
		dao.graduation(classId);
		return "StudentView.action";
	}

}
