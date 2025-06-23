

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.MyClass;
import bean.Student;
import dao.MyClassDAO;
import dao.StudentDAO;
import tool.Action;

/**
 * Servlet implementation class StudentViewAction
 */
public class StudentViewAction extends Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		StudentDAO studao = new StudentDAO();
		MyClassDAO clsdao = new MyClassDAO();

//		検索条件の取得
//		学籍番号
		String Id = request.getParameter("studentId");
//		名前
		String name = request.getParameter("studentName");
//		クラス
		String classId = request.getParameter("classId");


//		学生情報をDBから取得
		List<Student> students = studao.search(Id == null ? "" : Id, name == null ? "" : name, classId == null ? "" : classId);
//		検索画面のドロップダウンで使用するクラスデータを取得
		List<MyClass> classes = clsdao.allSearch();
		request.setAttribute("students", students);
		request.setAttribute("classes", classes);
		return "studentView.jsp";
	}
}
