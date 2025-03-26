package Helper;

import java.sql.*;

public class SingletonConnection {
	private static final String DB_HOST = "localhost";
	private static final String DB_NAME = "techblog";
	private static final String DB_USERNAME = "root";
	private static final String DB_PASSWORD = "*ShoShi#321";
	private static final String DB_URL = "jdbc:mysql://" + DB_HOST + "/" + DB_NAME;

	private static Connection connection;

	// Static block ensures connection is created once
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL Driver
			connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
			System.out.println("Connected Successfully!");
		} catch (ClassNotFoundException e) {
			System.out.println("MySQL JDBC Driver Not Found!");
			e.printStackTrace();
		} catch (SQLException ex) {
			System.out.println("Database Connection Failed!");
			ex.printStackTrace();
		}
	}

	public static Connection getConnection() {
		if (connection == null) {
			System.out.println("Connection is NULL! Check your database setup.");
		}
		return connection;
	}
}
