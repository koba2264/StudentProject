

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.MyClass;
import bean.Student;
import dao.MyClassDAO;
import dao.StudentDAO;
import tool.Action;

/**
 * Servlet implementation class StudentViewAction
 */
public class StudentViewAction extends Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		StudentDAO studao = new StudentDAO();
		MyClassDAO clsdao = new MyClassDAO();

		String Id = request.getParameter("studentId");
		String name = request.getParameter("studentName");
		String classId = request.getParameter("classId");


		List<Student> students = studao.search(Id == null ? "" : Id,name == null ? "" : name,classId == null ? "" : classId);
		List<MyClass> classes = clsdao.allSearch();
		request.setAttribute("students", students);
		request.setAttribute("classes", classes);
		return "studentView.jsp";
	}
}
