import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import tool.Action;

public class UserDeleteAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserDAO dao = new UserDAO();
		String userId = request.getParameter("id");
		String message = "削除に失敗しました";
		if (dao.delete(userId)) {
			message = "正常に削除しました";
		}
		request.setAttribute("message", message);
		return "UserView.action";
	}

}
