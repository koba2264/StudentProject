package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Score;
import bean.Subject;

/**
 * Servlet implementation class ScoreDAO
 */
public class ScoreDAO extends DAO {
	public List<Score> search(String class_id) throws Exception {
		List<Score> scores = new ArrayList<>();
		Score score = null;
		Subject subject = null;
		Connection con = getConnection();
		PreparedStatement st = con.prepareStatement("SELECT STUDENT_ID,SUBJECT_ID,SUBJECT.NAME AS SUBJECT_NAME,COUNT,CLASS_ID,SCORE FROM SCORE INNER JOIN SUBJECT ON SCORE.SUBJECT_ID = SUBJECT.ID WHERE CLASS_ID = ?;");
		st.setString(1, class_id);
		ResultSet rs = st.executeQuery();

		while(rs.next()){
			score = new Score();
			subject = new Subject();
			subject.setId(rs.getString("SUBJECT_ID"));
			subject.setSubjectName("SUBJECT_NAME");
			score.setStudentId(rs.getString("STUDENT_ID"));
			score.setSubject(subject);
			score.setCount(rs.getInt("COUNT"));
			score.setClassId(rs.getString("CLASS_ID"));
			score.setScore(rs.getInt("SCORE"));
			scores.add(score);
		}
		return scores;

	}
}
