

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;
import dao.UserDAO;
import tool.Action;

/**
 * Servlet implementation class LoginServletAction
 */
public class LoginServletAction extends Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO 自動生成されたメソッド・スタブ
		HttpSession session = request.getSession();

		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		UserDAO dao = new UserDAO();
		User user = new User();
		try {
			user = dao.login(userId, password);
		}catch(Exception e) {
			String errorMessage = "システムエラー";
			request.setAttribute("errorMessage", errorMessage);
			return "login.jsp";
		}
		if (user == null) {
			String errorMessage = "idかパスワードを間違えています";
			request.setAttribute("errorMessage", errorMessage);
			return "login.jsp";
		}else{
			session.setAttribute("user", user);
		}
		return "mainMenu.jsp";
	}
}
