

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Gender;
import bean.Student;
import bean.Subject;
import dao.GenderDAO;
import dao.ScoreDAO;
import dao.StudentDAO;
import dao.SubjectDAO;
import tool.Action;

/**
 * Servlet implementation class ScoreAction
 */

public class ScoreRegisterAction extends Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO 自動生成されたメソッド・スタブ
		String class_id = request.getParameter("class_id");
		String student_id = request.getParameter("student_id");
		String subject_id = request.getParameter("subject_id");

		StudentDAO stuDAO = new StudentDAO();
		SubjectDAO subDAO = new SubjectDAO();
		GenderDAO genDAO = new GenderDAO();
		ScoreDAO scoDAO = new ScoreDAO();

		List<Student> students = stuDAO.search("", "", class_id);
		List<Subject> subjects = subDAO.ClassSearch(class_id);
		Gender gender = genDAO.search(student_id);
		List<Integer> count = scoDAO.sizeSearch(student_id,subject_id);


		request.setAttribute("students", students);
		request.setAttribute("subjects", subjects);
		request.setAttribute("gender", gender);
		request.setAttribute("count", count);
		request.setAttribute("subject_id", subject_id);

		return "scoreRegister.jsp";
//		return null;
	}
}