package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Helper.SingletonConnection;

public class LikeDAO {
	private Connection connection;

	public LikeDAO() {
		this.connection = SingletonConnection.getConnection();
	}

	public boolean insertLike(long pid, int uid) {
		boolean f = false;

		try {
			String query = "INSERT INTO likes (pid,uid) VALUES(?,?)";

			if (connection == null) { // 🚀 Debugging Check
				System.out.println("ERROR: Connection is NULL in LikeDAO!");
				return false;
			}

			PreparedStatement p = connection.prepareStatement(query);

			p.setLong(1, pid);
			p.setInt(2, uid);
			p.executeUpdate();
			f = true;

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return f;
	}

	public long countLikeOnPost(long pid) {
		long count = 0;

		try {
			String query = "SELECT COUNT(*) FROM likes WHERE pid=?";

			if (connection == null) { // 🚀 Debugging Check
				System.out.println("ERROR: Connection is NULL in LikeDAO!");
				return count;
			}

			PreparedStatement p = connection.prepareStatement(query);

			p.setLong(1, pid);

			ResultSet set = p.executeQuery();

			if (set.next()) {
				count = set.getLong("count(*)");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return count;
	}

	public boolean isLikeByUser(long pid, int uid) {
		boolean f = false;

		try {
			String query = "SELECT * FROM likes WHERE pid=? AND uid=?";

			if (connection == null) { // 🚀 Debugging Check
				System.out.println("ERROR: Connection is NULL in LikeDAO!");
				return false;
			}

			PreparedStatement p = connection.prepareStatement(query);

			p.setLong(1, pid);
			p.setInt(2, uid);

			ResultSet set = p.executeQuery();
			if(set.next()) {
				f = true;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return f;
	}

	public boolean deleteLike(long pid, int uid) {
		boolean f = false;

		try {
			String query = "DELETE FROM likes WHERE pid=? AND uid=?";

			if (connection == null) { // 🚀 Debugging Check
				System.out.println("ERROR: Connection is NULL in LikeDAO!");
				return false;
			}

			PreparedStatement p = connection.prepareStatement(query);

			p.setLong(1, pid);
			p.setInt(2, uid);
			p.executeUpdate();
			f = true;
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return f;
	}
}
