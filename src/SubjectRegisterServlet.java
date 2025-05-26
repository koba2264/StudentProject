import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SubjectRegisterServlet")
public class SubjectRegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String classId = request.getParameter("classId");
        String subjectName = request.getParameter("subjectName");
        String studentId = request.getParameter("studentId");

        // データ保存処理（仮処理）
        request.setAttribute("classId", classId);
        request.setAttribute("subjectName", subjectName);
        request.setAttribute("studentId", studentId);

        RequestDispatcher dispatcher = request.getRequestDispatcher("subject_result.jsp");
        dispatcher.forward(request, response);
    }
}

