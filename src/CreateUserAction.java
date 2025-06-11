import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Role;
import dao.RoleDAO;
import tool.Action;

public class CreateUserAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		RoleDAO dao = new RoleDAO();
		List<Role> roles = dao.all();
		request.setAttribute("roles", roles);

		return "createUser.jsp";
	}

}
