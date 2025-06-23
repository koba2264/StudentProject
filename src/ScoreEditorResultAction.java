import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ScoreDAO;
import tool.Action;

public class ScoreEditorResultAction extends Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String student_id = request.getParameter("student_id");
		String subject_id = request.getParameter("subject_id");
		Integer count = Integer.parseInt(request.getParameter("count"));
		Integer score = Integer.parseInt(request.getParameter("score"));

		ScoreDAO scoDAO = new ScoreDAO();
//		scoDAO.update(student_id, subject_id, count, score);

		return "score.jsp";
	}

}