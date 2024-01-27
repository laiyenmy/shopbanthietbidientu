package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.User;
import util.EncryptPassword;

public class UserDAO {

	//Kiểm tra đăng nhập và đăng ký
	public boolean login(String username, String password) {
		
		String pass = EncryptPassword.toSHA1(password);
		boolean check = false;
		Connection conn = DBConnect.getConnection();
		String sql = "select * from user where username=? and password=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				check = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return check;
	}
	//Lấy thông tin admin login
	public User getUser(String username, String password) {
		String pass = EncryptPassword.toSHA1(password);
		User user = null;
		Connection conn = DBConnect.getConnection();
		String sql = "select * from user where username=? and password=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setFullname(rs.getString("fullname"));
				user.setUsername(rs.getString("username"));
				user.setPassword(password);
				user.setEmail(rs.getString("email"));
				user.setPhonenumber(rs.getString("phonenumber"));
				user.setAddress(rs.getString("address"));
				user.setRole_id(rs.getInt("role_id"));
				user.setStatus(rs.getInt("status"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;		
	}
	
	//Thêm mới admin
	public boolean insert(User user) {
		String pass = EncryptPassword.toSHA1(user.getPassword());
		boolean check = false;
		Connection conn = DBConnect.getConnection();
		String sql = "insert into user(fullname, username, password, email, phonenumber, address, role_id, status) values(?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getFullname());
			ps.setString(2, user.getUsername());
			ps.setString(3, pass);
			ps.setString(4, user.getEmail());
			ps.setString(5, user.getPhonenumber());
			ps.setString(6, user.getAddress());
			ps.setInt(7, user.getRole_id());
			ps.setInt(8, user.getStatus());
			int row = ps.executeUpdate();
			if(row > 0) {
				check = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return check;
	}
	
	//Cập nhật thông tin admin
	public boolean update(User user) {
		String pass = EncryptPassword.toSHA1(user.getPassword());
		boolean check = false;
		Connection conn = DBConnect.getConnection();
		String sql = "update user set fullname = ?, username = ?, password = ?, email = ?, phonenumber = ?,"
				+ "address = ? where id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getFullname());
			ps.setString(2, user.getUsername());
			ps.setString(3, pass);
			ps.setString(4, user.getEmail());
			ps.setString(5, user.getPhonenumber());
			ps.setString(6, user.getAddress());
			ps.setInt(7, user.getId());
			int row = ps.executeUpdate();
			if(row > 0) {
				check = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return check;
	}
	
	//Lấy danh sách cá nhân theo role_id
	public List<User> getUserByRoleID(int role_id){
		List<User> users = new ArrayList<User>();
		Connection conn = DBConnect.getConnection();
		String sql = "select * from user where role_id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, role_id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setFullname(rs.getString("fullname"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setPhonenumber(rs.getString("phonenumber"));
				user.setAddress(rs.getString("address"));
				user.setRole_id(rs.getInt("role_id"));
				user.setStatus(rs.getInt("status"));
				users.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return users;
	}
	
}
