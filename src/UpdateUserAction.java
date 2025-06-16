import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Role;
import bean.School;
import bean.User;
import dao.UserDAO;
import tool.Action;

public class UpdateUserAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		User user = new User();
		user.setUserId(request.getParameter("id"));
		user.setStudentName(request.getParameter("name"));
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

		UserDAO dao = new UserDAO();
		if (dao.update(user)) {
			request.setAttribute("message", "編集に成功しました");
		} else {
			request.setAttribute("message", "編集に失敗しました");
		}

		return "UserView.action";
	}

}
