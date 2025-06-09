import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Gender;
import bean.MyClass;
import bean.Student;
import dao.StudentDAO;
import tool.Action;

public class StudentInsertAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Student student = new Student();
		student.setId(request.getParameter("studentId"));
		student.setName(request.getParameter("studentName"));
//		ドロップダウンのクラスの処理
		String[] getClass = request.getParameter("class").split(":");
		MyClass myClass = new MyClass();
		myClass.setName(getClass[1]);
		myClass.setId(getClass[0]);
		student.setMyClass(myClass);
//		ドロップダウンの性別の処理
		String[] getGender = request.getParameter("gender").split(":");
		Gender gender = new Gender();
		gender.setId(getGender[0]);
		gender.setName(getGender[1]);
		student.setGender(gender);
		student.setEnrollmentYear(Integer.parseInt(request.getParameter("enrollmentYear")));

		StudentDAO dao = new StudentDAO();
		dao.insert(student);

		request.setAttribute("student", student);
		return "student_result.jsp";
	}

}
