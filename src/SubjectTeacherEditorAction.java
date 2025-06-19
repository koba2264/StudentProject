import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Subject;
import bean.User;
import dao.UserDAO;
import tool.Action;

public class SubjectTeacherEditorAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Subject subject = new Subject();
		subject.setId(request.getParameter("id"));
		subject.setSubjectName(request.getParameter("name"));
		UserDAO dao = new UserDAO();
		List<User> teachers = dao.roleAll("002");
		List<User> managers = dao.subjectSearch(subject.getId());
		List<String> managerIdList = new ArrayList<>();
		for (User manager : managers) {
			managerIdList.add(manager.getUserId());
		}

		request.setAttribute("subject", subject);
		request.setAttribute("managers", managerIdList);
		request.setAttribute("teachers", teachers);
		return "subjectTeacherEditor.jsp";
	}
}
