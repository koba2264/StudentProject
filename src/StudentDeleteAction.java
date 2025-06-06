import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StudentDAO;
import tool.Action;

public class StudentDeleteAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String studentId = request.getParameter("id");
		StudentDAO dao = new StudentDAO();
		String message = "削除に失敗しました";
		if (dao.delete(studentId)) {
			message = "正常に削除しました";
		}
		request.setAttribute("message", message);
		return "StudentView.action";
	}

}
