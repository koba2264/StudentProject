package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.MyClass;
import bean.School;

public class MyClassDAO extends DAO {
	public List<MyClass> allSearch() throws Exception {
		List<MyClass> myClasses = new ArrayList<>();
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement("SELECT CLASS.ID AS CLS_ID, CLASS.NAME AS CLS_NAME, SCHOOL.ID AS SCH_ID, SCHOOL.NAME AS SCH_NAME FROM CLASS INNER JOIN SCHOOL ON CLASS.SCHOOL_ID = SCHOOL.ID;;");
		ResultSet rs = ps.executeQuery();

		while(rs.next()) {
			MyClass myClass = new MyClass();
			School school = new School();
			myClass.setId(rs.getString("CLS_ID"));
		}

		return myClasses;
	}
}
