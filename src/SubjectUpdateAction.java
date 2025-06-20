import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.MyClass;
import dao.SubjectDAO;
import tool.Action;

public class SubjectUpdateAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "SubjectView.action";
		boolean result = true;
		MyClass myClass = new MyClass();
		myClass.setId(request.getParameter("classId"));
		myClass.setName(request.getParameter("name"));
		List<String> subList = new ArrayList<>();
		for (int num = 1 ; num < 6; num++) {
			String subId = request.getParameter("sub" + num);
			if (subList.contains(subId)) {
				request.setAttribute("message", "科目が被っています");
				result = false;
				break;
			} else {
				subList.add(subId);
			}
			if (num == 5) {
				SubjectDAO dao = new SubjectDAO();
				if (!dao.changeEnrolledSubject(myClass.getId(), subList)) {
					result = false;
					request.setAttribute("message", "登録できませんでした");
				}
			}
		}
		if (!result) {
			url = "SubjectEditor.action";
			request.setAttribute("id", myClass.getId());
			request.setAttribute("name", myClass.getName());
		}


		return url;
	}

}
