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

		st.close();
		con.close();

		return subject_list;

	}

//	受講科目の取得
	public List<Subject> ClassSearch(String classId) throws Exception{
		Subject subject = null;
		List<Subject> subject_list = new ArrayList<>();
		Connection con = getConnection();
		PreparedStatement st = con.prepareStatement("SELECT SUB.ID AS SUB_ID, SUB.NAME AS SUB_NAME FROM (SELECT * FROM CLASS_SUBJECT  WHERE CLASS_ID = ?) AS CS INNER JOIN SUBJECT AS SUB ON CS.SUBJECT_ID = SUB.ID;");
		st.setString(1, classId);
		ResultSet rs = st.executeQuery();
		while(rs.next()){
			subject = new Subject();
			subject.setId(rs.getString("id"));
			subject.setSubjectName(rs.getString("name"));
			subject_list.add(subject);
		}

		st.close();
		con.close();

		return subject_list;
	}

}
