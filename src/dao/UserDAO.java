package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.Role;
import bean.School;
import bean.User;

public class UserDAO extends DAO {
	public User login(String userId,String password) throws Exception {
		User user = null;
		School school = new School();
		Role role = new Role();

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
				"SELECT USERS.ID AS USERS_ID,SCHOOL_ID,SCHOOL.NAME AS  SCHOOL_NAME,ROLE_ID,ROLE.NAME AS ROLE_NAME,USERS.NAME AS  USERS_NAME,PASSWORD FROM USERS INNER JOIN SCHOOL ON USERS.SCHOOL_ID =  SCHOOL.ID INNER JOIN ROLE ON USERS.ROLE_ID = ROLE.ID WHERE USERS.ID = ? AND USERS.PASSWORD = ?");
		st.setString(1, userId);
		st.setString(2, password);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			user = new User();
			// 学校のbeanに保存
			school.setId(rs.getString("school_id"));
			school.setName(rs.getString("school_name"));
			// 権限のbeanに保存
			role.setId(rs.getString("role_id"));
			role.setRoleName(rs.getString("role_name"));
			// usersのbeanに保存
			user.setUserId(rs.getString("users_id"));
			user.setStudentName(rs.getString("users_name"));
			user.setPassword(rs.getString("password"));
			user.setSchool(school);
			user.setRole(role);
		}

		st.close();
		con.close();

		return user;
	}

}
