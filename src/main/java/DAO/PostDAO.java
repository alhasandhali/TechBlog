package DAO;

import java.sql.*;
import java.util.*;
import Entities.Category;
import Entities.Post;
import Entities.User;
import Helper.SingletonConnection;

public class PostDAO {
	private Connection connection;

	public PostDAO() {
		this.connection = SingletonConnection.getConnection();
	}

// Get all categories from Database
	public ArrayList<Category> getCategories() {
		ArrayList<Category> catList = new ArrayList<>();

		try {
			String query = "SELECT * FROM categories";
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(query);

			while (resultSet.next()) {
				int id = resultSet.getInt("id");
				String name = resultSet.getString("name");
				String des = resultSet.getString("description");

				Category cat = new Category(id, name, des);
				catList.add(cat);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return catList;
	}

	// Insert post into Database
	public boolean insertIntoDB(Post post) {
		boolean f = false;
		String query = "INSERT INTO post(title, content, image, status, c_time, cid, uid, tags) VALUES(?, ?, ?, ?, NOW(), ?, ?, ?)";

		try {
			if (connection == null) { // 🚀 Debugging Check
				System.out.println("ERROR: Connection is NULL in PostDAO!");
				return false;
			}

			PreparedStatement preparedStatement = connection.prepareStatement(query);

			// Set parameters
			preparedStatement.setString(1, post.getTitle());
			preparedStatement.setString(2, post.getContent());
			preparedStatement.setString(3, post.getImage());
			preparedStatement.setString(4, post.getStatus());
			preparedStatement.setInt(5, post.getCid());
			preparedStatement.setInt(6, post.getUid());
			preparedStatement.setString(7, post.getTags());

			// Execute query
			int rowsAffected = preparedStatement.executeUpdate();
			if (rowsAffected > 0) {
				System.out.println("Post Added Successfully!");
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

	// Get all post from Databases
	public ArrayList<Post> getPost() {
		ArrayList<Post> postList = new ArrayList<>();

		try {
			String query = "SELECT * FROM post ORDER BY id DESC";
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(query);

			while (resultSet.next()) {
				long id = resultSet.getLong("id");
				String title = resultSet.getString("title");
				String content = resultSet.getString("content");
				String img = resultSet.getString("image");
				long views = resultSet.getLong("views");
				String status = resultSet.getString("status");
				Timestamp create_time = resultSet.getTimestamp("c_time");
				Timestamp update_time = resultSet.getTimestamp("u_time");
				Timestamp post_time = resultSet.getTimestamp("p_time");
				int cid = resultSet.getInt("cid");
				int uid = resultSet.getInt("uid");
				String tags = resultSet.getString("tags");

				Post post = new Post(id, title, content, img, views, status, create_time, update_time, post_time, cid,
						uid, tags);
				postList.add(post);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return postList;
	}

//Get post by status and Category ID from Databases
	public ArrayList<Post> getPostCS(int catId) {
		ArrayList<Post> postList = new ArrayList<>();

		try {
			String query = "SELECT * FROM post WHERE cid=" + catId;
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(query);

			while (resultSet.next()) {
				long id = resultSet.getLong("id");
				String title = resultSet.getString("title");
				String content = resultSet.getString("content");
				String img = resultSet.getString("image");
				long views = resultSet.getLong("views");
				String status = resultSet.getString("status");
				Timestamp create_time = resultSet.getTimestamp("c_time");
				Timestamp update_time = resultSet.getTimestamp("u_time");
				Timestamp post_time = resultSet.getTimestamp("p_time");
				int uid = resultSet.getInt("uid");
				String tags = resultSet.getString("tags");

				Post post = new Post(id, title, content, img, views, status, create_time, update_time, post_time, uid,
						tags);
				postList.add(post);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return postList;
	}

	// Get post using their ID
	public Post getPostByPostId(long postId) {
		Post post = null;

		try {
			String query = "SELECT * FROM post WHERE id=?";

			try {
				if (connection == null) { // 🚀 Debugging Check
					System.out.println("ERROR: Connection is NULL in UserDAO!");
					return post;
				}

				PreparedStatement pstm = connection.prepareStatement(query);

				pstm.setLong(1, postId);

				ResultSet set = pstm.executeQuery();

				if (set.next()) {

					long id = set.getLong("id");
					String title = set.getString("title");
					String content = set.getString("content");
					String img = set.getString("image");
					long views = set.getLong("views");
					String status = set.getString("status");
					Timestamp cTime = set.getTimestamp("c_time");
					Timestamp uTime = set.getTimestamp("u_time");
					Timestamp pTime = set.getTimestamp("p_time");
					int cid = set.getInt("cid");
					int uid = set.getInt("uid");
					String tags = set.getString("tags");

					post = new Post(id, title, content, img, views, status, cTime, uTime, pTime, cid, uid, tags);

				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return post;
	}

	// Get category using their ID
	public Category getCatByCatId(int catId) {
		Category cat = null;

		try {
			String query = "SELECT * FROM categories WHERE id=?";

			try {
				if (connection == null) { // 🚀 Debugging Check
					System.out.println("ERROR: Connection is NULL in UserDAO!");
					return cat;
				}

				PreparedStatement pstm = connection.prepareStatement(query);

				pstm.setLong(1, catId);

				ResultSet set = pstm.executeQuery();

				if (set.next()) {

					int id = set.getInt("id");
					String name = set.getString("name");
					String description = set.getString("description");

					cat = new Category(id, name, description);

				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return cat;
	}
}
