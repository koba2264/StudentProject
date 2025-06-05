import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Student;
import tool.Action;

public class StudentConfirmAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Student student = new Student();
		student.setId(request.getParameter("studentId"));
		student.setName(request.getParameter("studentName"));

		String classId = request.getParameter("classId");
		String[] gender = request.getParameter("gender").split(":");
		return "studentConfirm.jsp";
	}

}
