import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import tool.Action;

public class UpdateStuAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String name = request.getParameter("name");
		String classId = request.getParameter("class");
		String id = request.getParameter("id");
		UserDAO dao = new UserDAO();
		dao.updateStu(name, id, classId);
		System.out.println(3);
 		return "StudentView.action";
	}

}
