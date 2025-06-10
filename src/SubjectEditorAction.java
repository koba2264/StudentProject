import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.MyClass;
import bean.Subject;
import dao.SubjectDAO;
import tool.Action;

public class SubjectEditorAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MyClass myClass = new MyClass();
		String classId = request.getParameter("id");
		String className = request.getParameter("name");
		myClass.setId(classId == null ? (String)request.getAttribute("id") : classId);
		myClass.setName(className == null ? (String)request.getAttribute("name") : className);
		SubjectDAO dao = new SubjectDAO();
		List<Subject> subjects = dao.search();
		List<String> enrolledSubjects = dao.getEnrolledSubjectId(myClass.getId());

		request.setAttribute("myClass", myClass);
		request.setAttribute("subjects", subjects);
		request.setAttribute("enrolledSubjects", enrolledSubjects);
		return "subjectEditor.jsp";
	}

}
