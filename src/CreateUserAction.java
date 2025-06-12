import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Role;
import bean.School;
import dao.RoleDAO;
import dao.SchoolDAO;
import tool.Action;

public class CreateUserAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		RoleDAO roleDao = new RoleDAO();
		List<Role> roles = roleDao.all();
		SchoolDAO schoolDao = new SchoolDAO();
		List<School> schools = schoolDao.all();
		request.setAttribute("roles", roles);
		request.setAttribute("schools", schools);


		return "createUser.jsp";
	}

}
