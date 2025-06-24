

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.MyClass;
import bean.Score;
import bean.Student;
import bean.Subject;
import bean.User;
import dao.MyClassDAO;
import dao.StudentDAO;
import dao.SubjectDAO;
import tool.Action;

/**
 * Servlet implementation class ScoreAction
 */

public class ScoreAction extends Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO 自動生成されたメソッド・スタブ
		HttpSession session = ((HttpServletRequest)request).getSession();
		User user = (User)session.getAttribute("user");
		String class_id = request.getParameter("class_id");
		if (class_id == null){
			class_id = "131";
		}
		Score null_score = null;
		StudentDAO stDAO = new StudentDAO();
		SubjectDAO subDAO = new SubjectDAO();
		MyClassDAO mcDAO = new MyClassDAO();
		Map<String, List<List<Score>>> scores = new HashMap<>();
		List<Subject> subjects = subDAO.ClassSearch(class_id);
		List<Student> students = stDAO.search("", "", class_id);
		List<MyClass> myclasses = mcDAO.classSearch(user);
		for(Student student : students){
			List<List<Score>> sco = new ArrayList<>();
			for(Subject subject : subjects){
				List<Score> ScoreList = student.getScores().get(subject.getId());
				for(Score score : ScoreList){
					score.getSubject().setName(subject.getName());;
				}
				if(ScoreList.size() == 0){
					while (ScoreList.size() < 2) {
						null_score = new Score();
						null_score.setSubject(subject);
						null_score.setCount(ScoreList.size() + 1);
						ScoreList.add(null_score);
					}
				} else if(ScoreList.size() == 1){
					null_score = new Score();
					null_score.setSubject(subject);
					null_score.setCount(ScoreList.size());
					if(ScoreList.get(0).getCount() == 2){
						ScoreList.add(0,null_score);
					}else{
						ScoreList.add(null_score);
					}
				}
				sco.add(ScoreList);
			scores.put(student.getId(), sco);
			}
		}

		request.setAttribute("students", students);
		request.setAttribute("subjects", subjects);
		request.setAttribute("scores", scores);
		request.setAttribute("myclasses", myclasses);

		return "score.jsp";

	}
}