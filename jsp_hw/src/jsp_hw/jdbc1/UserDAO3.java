package jsp_hw.jdbc1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO3 {
	private static User getUserFrom(ResultSet resultSet) throws SQLException {
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
		return userData;
	}

	public static List<User> findAll() throws Exception {
		String sql = "SELECT user.* ,department.departmentName "
				+ "FROM user LEFT JOIN department ON user.departmentId=department.id";

		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql);
				ResultSet resultSet = statement.executeQuery()) {
			ArrayList<User> resultList = new ArrayList<User>();
			while (resultSet.next()) {
				resultList.add(getUserFrom(resultSet));
			}
			return resultList;
		}
	}

	public static List<User> findByName(String name) throws Exception {
		String sql = "SELECT user.* ,department.departmentName "
				+ "FROM user LEFT JOIN department ON user.departmentId=department.id " + "WHERE user.name LIKE ?";

		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, name + "%");
			try (ResultSet resultSet = statement.executeQuery()) {
				ArrayList<User> resultList = new ArrayList<User>();
				while (resultSet.next()) {
					resultList.add(getUserFrom(resultSet));
				}
				return resultList;
			}
		}
	}

	public static User findById(int id) throws Exception {
		String sql = "SELECT user.* ,department.departmentName "
				+ "FROM user LEFT JOIN department ON user.departmentId=department.id " + "WHERE user.id = ?";

		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, id);
			try (ResultSet resultSet = statement.executeQuery()) {
				return resultSet.next() ? getUserFrom(resultSet) : null;
			}
		}
	}
}
