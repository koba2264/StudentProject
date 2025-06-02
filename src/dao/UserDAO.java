package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.User;

public class UserDAO extends DAO {
	public User login(String userId,String password) throws Exception {
		User user = new User();

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
				"SELECT NAME FROM USERS WHERE ID = ? and PASSWORD = ?");
		st.setString(1, userId);
		st.setString(2, password);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			user.setStudentName(rs.getString("name"));
		}

		st.close();
		con.close();

		return user;
	}

}
