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

//	受け持ち科目の取得
	public List<Subject> userSearch(String userId) throws Exception{
		Subject subject = null;
		List<Subject> subject_list = new ArrayList<>();
		Connection con = getConnection();
		PreparedStatement st = con.prepareStatement("SELECT ID, NAME FROM SUBJECT INNER JOIN SUBJECT_USER ON SUBJECT.ID = SUBJECT_USER.SUBJECT_ID WHERE SUBJECT_USER.USER_ID = ?");
		st.setString(1, userId);
		ResultSet rs = st.executeQuery();
		while(rs.next()){
			subject = new Subject();
			subject.setId(rs.getString("ID"));
			subject.setSubjectName(rs.getString("NAME"));
			subject_list.add(subject);
		}

		st.close();
		con.close();

		return subject_list;
	}

//	idが使用済みか確認
	public boolean checkId(String id) throws Exception{
		boolean result = false;
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement("SELECT * FROM SUBJECT WHERE ID = ?;");
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();

		if (!rs.next()) {
			result = true;
		}

		ps.close();
		con.close();

		return result;
	}

//	科目の追加
	public boolean insert(Subject subject) throws Exception {
		boolean result = false;
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement("INSERT INTO SUBJECT VALUES (?,?);");
		ps.setString(1, subject.getId());
		ps.setString(2, subject.getName());
		if (ps.executeUpdate() > 0) {
			result = true;
		}

		ps.close();
		con.close();

		return result;
	}

//	受講済みの科目Id
	public List<String> getEnrolledSubjectId(String classId) throws Exception {
		List<String> subjectIdList = new ArrayList<>();
		Connection con = getConnection();
		PreparedStatement st = con.prepareStatement("SELECT SUB.ID AS SUB_ID FROM (SELECT * FROM CLASS_SUBJECT  WHERE CLASS_ID = ?) AS CS INNER JOIN SUBJECT AS SUB ON CS.SUBJECT_ID = SUB.ID;");
		st.setString(1, classId);
		ResultSet rs = st.executeQuery();
		while(rs.next()){
			subjectIdList.add(rs.getString("SUB_ID"));
		}
		st.close();
		con.close();

		return subjectIdList;
	}

	public boolean changeEnrolledSubject(String classId, List<String> subList) throws Exception {
		boolean result = false;
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement("DELETE FROM CLASS_SUBJECT WHERE CLASS_ID = ?;");
		ps.setString(1, classId);
		ps.executeUpdate();

		ps.close();
		con.close();
		int count = 0;
		for (String subId : subList) {
			if (insertEnrolledSubject(classId, subId)) {
				count++;
			}
}

		if (count == 5) {
			result = true;
		}

		return result;


	}

//	受講科目の追加
	public boolean insertEnrolledSubject(String classId, String subId) throws Exception {
		boolean result = false;
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement("INSERT INTO CLASS_SUBJECT VALUES(?,?);");
		ps.setString(1, classId);
		ps.setString(2, subId);
		int line = ps.executeUpdate();
		if (line > 0) {
			result = true;
		}

		ps.close();
		con.close();

		return result;


	}
}
