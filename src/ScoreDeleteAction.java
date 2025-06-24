import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ScoreDAO;
import tool.Action;

public class ScoreDeleteAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String student_id  = request.getParameter("student_id");
		String subject_id  = request.getParameter("subject_id");
		Integer count  = Integer.parseInt(request.getParameter("count"));

		ScoreDAO scoDAO = new ScoreDAO();
		scoDAO.delete(student_id, subject_id, count);
		return "Score.action";
	}

}
