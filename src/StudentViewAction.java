

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

		List<Student> students = studao.search("","","");
		List<MyClass> classes = clsdao.allSearch();
		request.setAttribute("students", students);
		request.setAttribute("classes", classes);
		return "studentView.jsp";
	}
}
