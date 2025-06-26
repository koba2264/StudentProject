

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ScoreDAO;
import tool.Action;

/**
 * Servlet implementation class ScoreAction
 */

public class ScoreInsertAction extends Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO 自動生成されたメソッド・スタブ

		String class_id = request.getParameter("class_id");
		String student_id = request.getParameter("student_id");
		String subject_id = request.getParameter("subject_id");
		Integer count = Integer.parseInt(request.getParameter("count"));
		Integer score = Integer.parseInt(request.getParameter("score"));

		ScoreDAO scoDAO = new ScoreDAO();
		scoDAO.insert(student_id, subject_id, count, class_id, score);

		request.setAttribute("class_id", class_id);
		request.setAttribute("student_id", student_id);
		request.setAttribute("subject_id", subject_id);
		request.setAttribute("count", count);
		request.setAttribute("score", score);

		return "score_result.jsp";
//		return null;
	}
}