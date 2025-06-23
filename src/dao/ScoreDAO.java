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
			subject.setName("SUBJECT_NAME");
			score.setStudentId(rs.getString("STUDENT_ID"));
			score.setSubject(subject);
			score.setCount(rs.getInt("COUNT"));
			score.setClassId(rs.getString("CLASS_ID"));
			score.setScore(rs.getInt("SCORE"));
			scores.add(score);
		}
		st.close();
		con.close();
		return scores;
	}

	// 学籍番号から得点の一覧を取得
	public List<Score> stuSearch(String studentId) throws Exception {
		List<Score> scores = new ArrayList<>();
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement("SELECT SUBJECT_ID,COUNT,SCORE FROM SCORE WHERE STUDENT_ID = ? order by count;");
		ps.setString(1, studentId);
		ResultSet rs = ps.executeQuery();

		while(rs.next()) {
			Score score = new Score();
			Subject subject = new Subject();
			score.setStudentId(studentId);
			subject.setId(rs.getString("SUBJECT_ID"));
			score.setSubject(subject);
			score.setCount(rs.getInt("COUNT"));
			score.setScore(rs.getInt("SCORE"));
			scores.add(score);
		}
		ps.close();
		con.close();

		return scores;
	}

	// 登録
	public void insert(String student_id,String subject_id,Integer count,String class_id,Integer score,String gender_id) throws Exception{
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement("INSERT INTO SCORE(STUDENT_ID,SUBJECT_ID,COUNT,CLASS_ID,SCORE,GENDER_ID) VALUES(?,?,?,?,?,?); ");
		ps.setString(1,student_id);
		ps.setString(2,subject_id);
		ps.setInt(3,count);
		ps.setString(4,class_id);
		ps.setInt(5,score);
		ps.setString(6,gender_id);
		int line = ps.executeUpdate();
		ps.close();
		con.close();

	}

	public int sizeSearch(String student_id, String subject_id) throws Exception {
		int count = 0;
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement("SELECT * FROM SCORE where student_id = ? and subject_id = ?;");
		ps.setString(1, student_id);
		ps.setString(2, subject_id);
		ResultSet rs = ps.executeQuery();


		while(rs.next()) {
			count++;
		}

		ps.close();
		con.close();
		return count;
	}
}
