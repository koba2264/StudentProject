

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.MyClass;
import dao.MyClassDAO;
import tool.Action;

/**
 * Servlet implementation class SubjectViewAction
 */
public class SubjectViewAction extends Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MyClassDAO dao = new MyClassDAO();
		List<MyClass> myClasses = dao.allSearch();
		request.setAttribute("myClasses", myClasses);

		return "subjectView.jsp";
	}
}