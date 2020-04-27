package jsp_hw.jdbc1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO2 {
	public static List<User> findAll() throws Exception {
		String sql = "SELECT user.* ,department.departmentName FROM user LEFT JOIN department ON user.departmentId=department.id";

		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql);
				ResultSet resultSet = statement.executeQuery()) {
			ArrayList<User> resultList = new ArrayList<User>();
			while (resultSet.next()) {
				User userData = new User();
				userData.setId(resultSet.getInt("id"));
				userData.setUserid(resultSet.getString("userid"));
				userData.setPassword(resultSet.getString("password"));
				userData.setName(resultSet.getString("name"));
				userData.setEmail(resultSet.getString("email"));
				userData.setDepartmentId(resultSet.getInt("departmentId"));
				userData.setDepartmentName(resultSet.getString("departmentName"));
				userData.setEnabled(resultSet.getBoolean("enabled"));
				userData.setUserType(resultSet.getString("userType"));

				resultList.add(userData);
			}
			return resultList;
		}
	}

	public static List<User> findByName(String name) throws Exception {
		String sql = "SELECT user.* ,department.departmentName "
				+ "FROM user LEFT JOIN department ON user.departmentId=department.id "
				+ "WHERE user.name LIKE ?";

		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)) {
				statement.setString(1, name+"%");
			try (ResultSet resultSet = statement.executeQuery()) {
				ArrayList<User> resultList = new ArrayList<User>();
				while (resultSet.next()) {
					User userData = new User();
					userData.setId(resultSet.getInt("id"));
					userData.setUserid(resultSet.getString("userid"));
					userData.setPassword(resultSet.getString("password"));
					userData.setName(resultSet.getString("name"));
					userData.setEmail(resultSet.getString("email"));
					userData.setDepartmentId(resultSet.getInt("departmentId"));
					userData.setDepartmentName(resultSet.getString("departmentName"));
					userData.setEnabled(resultSet.getBoolean("enabled"));
					userData.setUserType(resultSet.getString("userType"));

					resultList.add(userData);
				}
				return resultList;
			}
		}

	}

}
