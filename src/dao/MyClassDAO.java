package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import bean.MyClass;

public class MyClassDAO extends DAO {
	public List<MyClass> allSearch() throws Exception {
		List<MyClass> myClasses = new ArrayList<>();
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement("");

		return myClasses;
	}
}
