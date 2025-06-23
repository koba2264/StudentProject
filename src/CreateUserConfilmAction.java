import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Role;
import bean.School;
import bean.User;
import dao.UserDAO;
import tool.Action;

public class CreateUserConfilmAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "createUserConfilm.jsp";

		User user = new User();
		user.setUserId(request.getParameter("userId"));
		user.setStudentName(request.getParameter("name"));
		user.setPassword(request.getParameter("password"));
		School school = new School();
		String[] schoolTmp = request.getParameter("school").split(":");
		school.setId(schoolTmp[0]);
		school.setName(schoolTmp[1]);
		user.setSchool(school);
		Role role = new Role();
		String[] roleTmp = request.getParameter("role").split(":");
		role.setId(roleTmp[0]);
		role.setRoleName(roleTmp[1]);
		user.setRole(role);
		request.setAttribute("user", user);

		UserDAO dao = new UserDAO();
		if (dao.checkId(user.getUserId())) {
			url = "CreateUser.action";
			request.setAttribute("message", "idが被っています");
		}

		return url;
	}

}
