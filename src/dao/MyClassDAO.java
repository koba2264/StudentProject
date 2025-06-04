package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.MyClass;
import bean.School;
import bean.Subject;

public class MyClassDAO extends DAO {
	public List<MyClass> allSearch() throws Exception {
		List<MyClass> myClasses = new ArrayList<>();
		System.out.println(11);
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement("SELECT CLASS.ID AS CLS_ID, CLASS.NAME AS CLS_NAME, SCHOOL.ID AS SCH_ID, SCHOOL.NAME AS SCH_NAME FROM CLASS INNER JOIN SCHOOL ON CLASS.SCHOOL_ID = SCHOOL.ID;");
		System.out.println(10);
		ResultSet rs = ps.executeQuery();

		SubjectDAO subdao = new SubjectDAO();
		while(rs.next()) {
			MyClass myClass = new MyClass();
			School school = new School();
			myClass.setId(rs.getString("CLS_ID"));
			myClass.setName(rs.getString("CLS_NAME"));
			school.setId(rs.getString("SCH_ID"));
			school.setName(rs.getString("SCH_NAME"));
			myClass.setSchool(school);
			List<Subject> subjects = subdao.ClassSearch(myClass.getId());
			myClass.setSubjects(subjects);
			myClasses.add(myClass);
		}
		ps.close();
		con.close();
		return myClasses;
	}
}
