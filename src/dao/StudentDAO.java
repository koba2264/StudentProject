package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Gender;
import bean.MyClass;
import bean.School;
import bean.Student;
import bean.Subject;

// 学生情報の保存
public class StudentDAO extends DAO {
	public boolean insert(Student student) throws Exception {
		boolean result = false;
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement("INSERT INTO STUDENTS(ID,NAME,ENT_YEAR ,CLASS_ID ,IS_ATTEND, GENDER_ID) VALUES (?,?,?,?,?,?);");
		ps.setString(1, student.getId());
		ps.setString(2, student.getName());
		ps.setInt(3, student.getEnrollmentYear());
		ps.setString(4, student.getMyClass().getId());
		ps.setBoolean(5, student.getIsAttend());
		ps.setString(6, student.getGender().getId());
		int line = ps.executeUpdate();
		if (line == 1) {
			result = true;
		}
		ps.close();
		con.close();

		return result;
	}

	//	学生検索 (学籍番号,学生氏名,クラスIDで検索をかけられる)
	public List<Student> search(String id, String name, String classId) throws Exception {
		List<Student> students = new ArrayList<>();
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement(
				"SELECT STU.ID AS STU_ID, STU.NAME AS STU_NAME, ENT_YEAR, IS_ATTEND,GEN.ID AS GEN_ID, GEN.NAME AS GEN_NAME, CLS_NAME, CLS_ID, SCH_NAME, SCH_ID FROM STUDENTS AS STU INNER JOIN GENDER AS GEN ON STU.GENDER_ID = GEN.ID INNER JOIN (SELECT CLASS.ID AS CLS_ID, CLASS.NAME AS CLS_NAME, SCHOOL.ID AS SCH_ID, SCHOOL.NAME AS SCH_NAME  FROM CLASS INNER JOIN SCHOOL ON CLASS.SCHOOL_ID  = SCHOOL.ID) AS CLS ON CLS.CLS_ID = STU.CLASS_ID WHERE STU.ID LIKE ? AND STU.NAME LIKE ? AND CLS_ID LIKE ?;");
		ps.setString(1, "%" + id + "%");
		ps.setString(2, "%" + name + "%");
		ps.setString(3, "%" + classId + "%");
		ResultSet rs = ps.executeQuery();
		SubjectDAO subDao = new SubjectDAO();

		while(rs.next()) {
			Student student = new Student();
			Gender gender = new Gender();
			MyClass myClass = new MyClass();
			School school = new School();
			student.setId(rs.getString("STU_ID"));
			student.setName(rs.getString("STU_NAME"));
			gender.setId(rs.getString("GEN_ID"));
			gender.setName(rs.getString("GEN_NAME"));
			student.setGender(gender);
			student.setEnrollmentYear(rs.getInt("ENT_YEAR"));
			student.setAttend(rs.getBoolean("IS_ATTEND"));
			myClass.setId(rs.getString("CLS_ID"));
			myClass.setName(rs.getString("CLS_NAME"));
			school.setId(rs.getString("SCH_ID"));
			school.setName(rs.getString("SCH_NAME"));
			myClass.setSchool(school);
			List<Subject> subjects = subDao.ClassSearch(myClass.getId());
			myClass.setSubjects(subjects);
			student.setMyClass(myClass);



			students.add(student);
		}
		ps.close();
		con.close();

		return students;
	}
}
