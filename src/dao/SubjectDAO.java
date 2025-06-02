package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Subject;

/**
 * Servlet implementation class Score
 */

public class SubjectDAO extends DAO {
	public List<Subject> search() throws Exception{
		Subject subject = null;
		List<Subject> subject_list = new ArrayList<>();
		Connection con = getConnection();
		PreparedStatement st = con.prepareStatement("SELECT ID,NAME FROM SUBJECT");
		ResultSet rs = st.executeQuery();
		while(rs.next()){
			subject = new Subject();
			subject.setId(rs.getString("id"));
			subject.setSubjectName(rs.getString("name"));
			subject_list.add(subject);
		}

		return subject_list;

	}
}
