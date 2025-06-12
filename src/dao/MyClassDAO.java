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
		Connection con = getConnection();

		PreparedStatement ps = con.prepareStatement("SELECT CLASS.ID AS CLS_ID, CLASS.NAME AS CLS_NAME, SCHOOL.ID AS SCH_ID, SCHOOL.NAME AS SCH_NAME FROM CLASS INNER JOIN SCHOOL ON CLASS.SCHOOL_ID = SCHOOL.ID;");
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

	public List<MyClass> classSearch() throws Exception {
		List<MyClass> myClasses = new ArrayList<>();
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement("SELECT * FROM CLASS;");
		ResultSet rs = ps.executeQuery();

		while(rs.next()) {
			MyClass myClass = new MyClass();
			myClass.setId(rs.getString("ID"));
			myClass.setName(rs.getString("NAME"));
			myClasses.add(myClass);
		}

		ps.close();
		con.close();

		return myClasses;
	}

//	受け持ちクラスの取得
	public List<MyClass> userSearch(String userId) throws Exception {
		List<MyClass> myClasses = new ArrayList<>();
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement("SELECT ID, NAME FROM CLASS INNER JOIN CLASS_USER ON CLASS.ID = CLASS_USER.CLASS_ID WHERE USER_ID = ?;");
		ResultSet rs = ps.executeQuery();

		while(rs.next()) {
			MyClass myClass = new MyClass();
			myClass.setId(rs.getString("ID"));
			myClass.setName(rs.getString("NAME"));
		}

		ps.close();
		con.close();

		return myClasses;
	}
}
