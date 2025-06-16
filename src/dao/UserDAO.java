package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.MyClass;
import bean.Role;
import bean.School;
import bean.Subject;
import bean.User;

public class UserDAO extends DAO {
//	ログイン処理
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

//	ユーザー取得
	public User search(String userId) throws Exception {
		User user = null;
		School school = new School();
		Role role = new Role();

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
				"SELECT USERS.ID AS USERS_ID,SCHOOL_ID,SCHOOL.NAME AS  SCHOOL_NAME,ROLE_ID,ROLE.NAME AS ROLE_NAME,USERS.NAME AS USERS_NAME FROM USERS INNER JOIN SCHOOL ON USERS.SCHOOL_ID =  SCHOOL.ID INNER JOIN ROLE ON USERS.ROLE_ID = ROLE.ID WHERE USERS.ID = ?");
		st.setString(1, userId);
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
			user.setSchool(school);
			user.setRole(role);
		}

		st.close();
		con.close();

		return user;
	}
//	サインアップ処理
	public boolean signup(User user) throws Exception {
		boolean result = false;
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement("INSERT INTO USERS(ID,SCHOOL_ID,ROLE_ID,NAME,PASSWORD) VALUES (?,?,?,?,?);");
		ps.setString(1, user.getUserId());
		ps.setString(2, user.getSchool().getId());
		ps.setString(3, user.getRole().getId());
		ps.setString(4, user.getStudentName());
		ps.setString(5, user.getPassword());

		if (ps.executeUpdate() > 0) {
			result = true;
		}

		ps.close();
		con.close();

		return result;
	}

//	idが存在するか確認
	public boolean checkId(String id) throws Exception {
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement("SELECT * FROM USERS WHERE ID = ?;");
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();

		return rs.next();
	}

//	ユーザーを全件取得
	public List<User> all() throws Exception {
		List<User> users = new ArrayList<>();
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement("SELECT USERS.ID AS USER_ID, USERS.NAME AS USER_NAME, SCH.ID AS SCH_ID, SCH.NAME AS SCH_NAME, ROLE.ID AS ROLE_ID, ROLE.NAME AS ROLE_NAME, ROLE.PERM AS ROLE_PERM  FROM USERS INNER JOIN SCHOOL AS SCH ON USERS.SCHOOL_ID = SCH.ID INNER JOIN ROLE ON USERS.ROLE_ID = ROLE.ID;");
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			User user = new User();
			user.setUserId(rs.getString("USER_ID"));
			user.setStudentName(rs.getString("USER_NAME"));
			School school = new School();
			school.setId(rs.getString("SCH_ID"));
			school.setName(rs.getString("SCH_NAME"));
			user.setSchool(school);
			Role role = new Role();
			role.setId(rs.getString("ROLE_ID"));
			role.setRoleName(rs.getString("ROLE_NAME"));
			role.setPermission(rs.getInt("ROLE_PERM"));
			user.setRole(role);
			MyClassDAO clsDao = new MyClassDAO();
			List<MyClass> classes =  clsDao.userSearch(user.getUserId());
			user.setClasses(classes);
			SubjectDAO subDao = new SubjectDAO();
			List<Subject> subjects = subDao.userSearch(user.getUserId());
			user.setSubjects(subjects);

			users.add(user);
		}

		ps.close();
		con.close();

		return users;
	}

//	ユーザーの削除
	public boolean delete(String id) throws Exception {
		boolean result = false;
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement("DELETE FROM USERS WHERE ID = ?;");
		ps.setString(1, id);
		int line = ps.executeUpdate();
		if (line > 0) {
			result = true;
		}
		ps.close();
		con.close();
		return result;
	}

//	ユーザー編集
	public boolean update(User user) throws Exception {
		boolean result = false;
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement("UPDATE USERS SET SCHOOL_ID  = ?, ROLE_ID  = ?, NAME = ?, UPDATE_AT = CURRENT_DATE WHERE ID = ?;");
		ps.setString(1, user.getSchool().getId());
		ps.setString(2, user.getRole().getId());
		ps.setString(3, user.getStudentName());
		ps.setString(4, user.getUserId());

		int line = ps.executeUpdate();
		if (line > 0) {
			result = true;
		}

		return result;
	}
}
