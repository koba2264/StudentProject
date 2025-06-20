package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.School;

public class SchoolDAO extends DAO {
	public List<School> all() throws Exception {
		List<School> schools = new ArrayList<>();
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement("SELECT * FROM SCHOOL;");
		ResultSet rs = ps.executeQuery();

		while(rs.next()) {
			School school = new School();
			school.setId(rs.getString("ID"));
			school.setName(rs.getString("NAME"));
			schools.add(school);
		}

		ps.close();
		con.close();
		return schools;
	}

}
