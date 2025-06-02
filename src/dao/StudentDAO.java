package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import bean.Student;

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

		return result;
	}

	public List<Student> search() throws Exception {
		List<Student> students = new ArrayList<>();
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement("");

		return students;
	}
}
