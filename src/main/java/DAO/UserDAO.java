package DAO;

import Entities.Post;
import Entities.User;
import Helper.SingletonConnection;
import java.sql.*;

public class UserDAO {

	private Connection connection;

	public UserDAO() {
		this.connection = SingletonConnection.getConnection();
	}

	public boolean insertIntoDB(User user) {
		boolean f = false;
		String query = "INSERT INTO userInfo(name, email, password, gender, dob, regi_time) VALUES(?, ?, ?, ?, ?, NOW())";

		try {
			if (connection == null) { // 🚀 Debugging Check
				System.out.println("ERROR: Connection is NULL in UserDAO!");
				return false;
			}

			PreparedStatement preparedStatement = connection.prepareStatement(query);

			// Set parameters
			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2, user.getEmail());
			preparedStatement.setString(3, user.getPassword());
			preparedStatement.setString(4, user.getGender());
			preparedStatement.setString(5, user.getDob());

			// Execute query
			int rowsAffected = preparedStatement.executeUpdate();
			if (rowsAffected > 0) {
				System.out.println("User Added Successfully!");
				f = true;
			}
		} catch (SQLException ex) {
			System.out.println("Database Error!");
			ex.printStackTrace();
		} catch (Exception ex) {
			System.out.println("Unexpected Error!");
			ex.printStackTrace();
		}
		return f;
	}

	public User getUserFromDB(String email, String password) {
		User user = null;

		try {
			String query = "SELECT * FROM userinfo WHERE email=? AND password=?";

			try {
				if (connection == null) { // 🚀 Debugging Check
					System.out.println("ERROR: Connection is NULL in UserDAO!");
					return user;
				}

				PreparedStatement pstm = connection.prepareStatement(query);

				pstm.setString(1, email);
				pstm.setString(2, password);
				ResultSet set = pstm.executeQuery();

				if (set.next()) {

					int id = set.getInt("id");
					String name = set.getString("name");
					String e_mail = set.getString("email");
					String pass = set.getString("password");
					String gender = set.getString("gender");
					String dob = set.getString("dob");
					Timestamp time = set.getTimestamp("regi_time");
					String profile = set.getString("profile");

					user = new User(id, name, e_mail, pass, gender, dob, time, profile);
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return user;
	}
	
	public boolean updateUser(User user) {
		boolean f = false;
		try {
			String query = "UPDATE userinfo SET name=?, email=?, password=?, gender=?, dob=?, profile=? WHERE id=?";
			PreparedStatement pstm = connection.prepareStatement(query);
			
			pstm.setString(1, user.getName());
			pstm.setString(2, user.getEmail());
			pstm.setString(3, user.getPassword());
			pstm.setString(4, user.getGender());
			pstm.setString(5, user.getDob());
			pstm.setString(6, user.getProfile());
			pstm.setInt(7, user.getId());
			
			pstm.executeUpdate();
			f = true;
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return f;
	}

	//Get user using their ID
	public User getUserByUserId(int userId) {
		User user = null;

		try {
			String query = "SELECT * FROM userinfo WHERE id=?";

			try {
				if (connection == null) { // 🚀 Debugging Check
					System.out.println("ERROR: Connection is NULL in UserDAO!");
					return user;
				}

				PreparedStatement pstm = connection.prepareStatement(query);

				pstm.setLong(1, userId);
				
				ResultSet set = pstm.executeQuery();

				if (set.next()) {

					int id = set.getInt("id");
					String name = set.getString("name");
					String email = set.getString("email");
					String gender = set.getString("gender");
					String dob = set.getString("dob");
					Timestamp regTime = set.getTimestamp("regi_time");
					String img = set.getString("profile");

					user = new User(id, name, email, gender, dob, regTime, img);

				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return user;
	}
}
