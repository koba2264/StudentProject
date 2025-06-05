

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Gender;
import bean.MyClass;
import dao.GenderDAO;
import dao.MyClassDAO;
import tool.Action;

/**
 * Servlet implementation class StudentRegisterAction
 */
public class StudentRegisterAction extends Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		GenderDAO genDao = new GenderDAO();
		MyClassDAO clsDao = new MyClassDAO();
		List<Gender> genders = genDao.all();
		List<MyClass> classes = clsDao.classSearch();
		request.setAttribute("genders", genders);
		request.setAttribute("classes", classes);
		return "studentRegister.jsp";
	}
}
