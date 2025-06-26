

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.MyClass;
import bean.Student;
import bean.Subject;
import bean.User;
import dao.MyClassDAO;
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
		HttpSession session = ((HttpServletRequest)request).getSession();
		User user = (User)session.getAttribute("user");
		String class_id = request.getParameter("class_id");
		String student_id = request.getParameter("student_id");
		String subject_id = request.getParameter("subject_id");

		StudentDAO stuDAO = new StudentDAO();
		SubjectDAO subDAO = new SubjectDAO();
		ScoreDAO scoDAO = new ScoreDAO();
		MyClassDAO clsDAO = new MyClassDAO();
		List<String> clsIdList = new ArrayList<>();
		if (user.getRole().getId().equals("002")) {
			List<MyClass> clsList = clsDAO.classSearch(user);;
			for (MyClass cls : clsList) {
				clsIdList.add(cls.getId());
			}
		} else {
			clsIdList.add("131");
			clsIdList.add("231");
		}

		List<Student> students = stuDAO.search("", "", class_id);
		List<Subject> subjects = subDAO.ClassSearch(class_id);


		List<Integer> count = scoDAO.sizeSearch(student_id,subject_id);


		request.setAttribute("students", students);
		request.setAttribute("subjects", subjects);
		request.setAttribute("count", count);
		request.setAttribute("subject_id", subject_id);

		request.setAttribute("clsIdList", clsIdList);
		return "scoreRegister.jsp";
	}
}