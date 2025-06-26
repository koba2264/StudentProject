import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;

public class StuUpAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String classId = request.getParameter("classId");
		request.setAttribute("name", name);
		request.setAttribute("id", id);
		request.setAttribute("classId", classId);
		System.out.println(1);
		return "stuEditor.jsp";
	}

}
