package jsp_hw.exam2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jsp_hw.jdbc1.DB;

public class BookDAO {
	private static Book getUserFrom(ResultSet resultSet) throws SQLException {
		Book bookData = new Book();
		bookData.setId(resultSet.getInt("id"));
		bookData.setTitle(resultSet.getString("title"));
		bookData.setAuthor(resultSet.getString("author"));
		bookData.setCategoryId(resultSet.getInt("categoryId"));
		bookData.setPrice(resultSet.getInt("price"));
		bookData.setPublisher(resultSet.getString("publisher"));
		bookData.setCategoryName(resultSet.getString("categoryName"));

		return bookData;
	}

	public static List<Book> findAll() throws Exception {
		String sql = "SELECT book.* ,category.categoryName " + "FROM book LEFT JOIN "
				+ "category ON book.categoryId=category.id";

		try (Connection connection = DB.getConnection("book");
				PreparedStatement statement = connection.prepareStatement(sql);
				ResultSet resultSet = statement.executeQuery()) {

			ArrayList<Book> resultList = new ArrayList<Book>();
			while (resultSet.next()) {
				resultList.add(getUserFrom(resultSet));
			}
			return resultList;
		}
	}

	public static List<Book> findByAuthor(String authorName) throws Exception {
		String sql = "SELECT book.* ,category.categoryName " + "FROM book LEFT JOIN "
				+ "category ON book.categoryId=category.id " + "WHERE book.author LIKE ?";

		try (Connection connection = DB.getConnection("book");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, authorName);
			try (ResultSet resultSet = statement.executeQuery()) {
				ArrayList<Book> resultList = new ArrayList<Book>();
				while (resultSet.next()) {
					resultList.add(getUserFrom(resultSet));
				}
				return resultList;
			}
		}
	}
}
