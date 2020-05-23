package jsp_hw.jdbc1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProfessorDAO {
	private static Professor getprofessorFrom(ResultSet resultSet) throws SQLException {
		Professor professor= new Professor();
		professor.setId(resultSet.getInt("id"));
		professor.setDepartmentId(resultSet.getInt("departmentId"));
		professor.setProfessorName(resultSet.getString("professorName"));
		professor.setDepartmentName(resultSet.getString("departmentName"));
        return professor;
    }

    public static Professor findById(int id) throws Exception {
        String sql = "SELECT professor.* ,department.departmentName "
        		+ "FROM professor LEFT JOIN department ON "
        		+ "professor.departmentId=department.id WHERE professor.id = ?";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next())
                    return getprofessorFrom(resultSet);
                else
                    return null;
            }
        }
    }

    public static List<Professor> findAll() throws Exception {
		String sql = "SELECT professor.* ,department.departmentName "
				+ "FROM professor LEFT JOIN department ON professor.departmentId=department.id";

		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql);
				ResultSet resultSet = statement.executeQuery()) {
			ArrayList<Professor> resultList = new ArrayList<Professor>();
			while (resultSet.next()) {
				resultList.add(getprofessorFrom(resultSet));
			}
			return resultList;
		}
	}

    public static void insert(Professor professor) throws Exception {
        String sql = "INSERT professor (id, professorName, departmentId)" +
                     " VALUES (?, ?, ?)";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, professor.getId());
            statement.setString(2, professor.getProfessorName());
            statement.setInt(3, professor.getDepartmentId());
            statement.executeUpdate();
        }
    }
}
