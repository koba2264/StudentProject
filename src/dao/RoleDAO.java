package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Role;

public class RoleDAO extends DAO {
	public List<Role> all() throws Exception {
		List<Role> roles = new ArrayList<>();
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement("SELECT * FROM ROLE;");
		ResultSet rs = ps.executeQuery();

		while(rs.next()) {
			Role role = new Role();
			role.setId(rs.getString("ID"));
			role.setRoleName(rs.getString("NAME"));
			role.setPermission(rs.getInt("PERM"));
			roles.add(role);
		}

		ps.close();
		con.close();
		return roles;
	}
}
