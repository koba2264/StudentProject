package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Gender;

public class GenderDAO extends DAO {
//	性別テーブルのデータをすべて取得
	public List<Gender> all() throws Exception {
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement("SELECT * FROM GENDER;");
		ResultSet rs = ps.executeQuery();

		List<Gender> genders = new ArrayList<>();
		while (rs.next()) {
			Gender gender = new Gender();
			gender.setId(rs.getString("ID"));
			gender.setName(rs.getString("NAME"));
			genders.add(gender);
		}
		ps.close();
		con.close();

		return genders;
	}
}
