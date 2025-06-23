import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Score;
import tool.Action;

public class ScoreConfirmAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Score score_info = new Score();

		String class_id = request.getParameter("class_select");
		String student_id = request.getParameter("student_select");
		String gender_id = request.getParameter("gender_select");
		String subject_id = request.getParameter("subject_select");
		Integer count = Integer.parseInt(request.getParameter("count_select"));
		Integer score = Integer.parseInt(request.getParameter("score"));
		score_info.setCount(count);
		score_info.setScore(score);

		request.setAttribute("class_id", class_id);
		request.setAttribute("student_id", student_id);
		request.setAttribute("gender_id", gender_id);
		request.setAttribute("subject_id", subject_id);
		request.setAttribute("score_info", score_info);
		return "scoreConfirm.jsp";
	}

}
