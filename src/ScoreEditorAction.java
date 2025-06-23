import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Score;
import tool.Action;

public class ScoreEditorAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Score score_info = new Score();

		String student_id = request.getParameter("student_id");
		String student_name = request.getParameter("student_name");
		String subject_id = request.getParameter("subject_id");
		String subject_name = request.getParameter("subject_name");
		Integer count = Integer.parseInt(request.getParameter("count"));
		Integer score = Integer.parseInt(request.getParameter("score"));
		score_info.setCount(count);
		score_info.setScore(score);

		request.setAttribute("student_id", student_id);
		request.setAttribute("student_name", student_name);
		request.setAttribute("subject_id", subject_id);
		request.setAttribute("subject_name", subject_name);
		request.setAttribute("score_info", score_info);
		return "scoreEditor.jsp";
	}

}
