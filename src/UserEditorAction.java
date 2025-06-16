import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Role;
import bean.School;
import bean.User;
import dao.RoleDAO;
import dao.SchoolDAO;
import dao.UserDAO;
import tool.Action;

public class UserEditorAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userId = request.getParameter("id");
		UserDAO dao = new UserDAO();
		User user = dao.search(userId);
		SchoolDAO schDao = new SchoolDAO();
		List<School> schools = schDao.all();
		RoleDAO roleDao = new RoleDAO();
		List<Role> roles = roleDao.all();

		request.setAttribute("schools", schools);
		request.setAttribute("roles", roles);
		request.setAttribute("user", user);

		return "userEditor.jsp";
	}

}
