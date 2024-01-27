package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Order;

public class OrderDAO {

	// Phương thức lấy toàn bộ hóa đơn
	public List<Order> getAll() {
		List<Order> orders = new ArrayList<Order>();
		Connection conn = DBConnect.getConnection();
		String sql = "select * from `order`";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Order order = new Order();
				order.setId(rs.getInt("id"));
				order.setFullname(rs.getString("fullname"));
				order.setEmail(rs.getString("email"));
				order.setPhonenumber(rs.getString("phonenumber"));
				order.setAddress(rs.getString("address"));
				order.setNote(rs.getString("note"));
				order.setOrderdate(rs.getDate("orderdate"));
				order.setStatus(rs.getInt("status"));
				order.setTotal(rs.getLong("total"));
				order.setUser_id(rs.getInt("user_id"));
				orders.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orders;
	}

	// Phương thức thêm mới hoán đơn
	public boolean insert(Order order) {
		boolean check = false;
		Connection conn = DBConnect.getConnection();
		String sql = "insert into `order` (fullname, email, phonenumber, address, note, orderdate, status, total, user_id) values(?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, order.getFullname());
			ps.setString(2, order.getEmail());
			ps.setString(3, order.getPhonenumber());
			ps.setString(4, order.getAddress());
			ps.setString(5, order.getNote());
			ps.setDate(6, order.getOrderdate());
			ps.setInt(7, order.getStatus());
			ps.setLong(8, order.getTotal());
			ps.setInt(9, order.getUser_id());
			int row = ps.executeUpdate();
			if (row > 0) {
				check = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return check;
	}

	// Phương thức lấy hóa đơn theo userid
	public List<Order> getByUserId(int user_id) {
		List<Order> orderlist = new ArrayList<Order>();
		Connection conn = DBConnect.getConnection();
		String sql = "select * from `order` where user_id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, user_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Order order = new Order();
				order.setId(rs.getInt("id"));
				order.setFullname(rs.getString("fullname"));
				order.setEmail(rs.getString("email"));
				order.setPhonenumber(rs.getString("phonenumber"));
				order.setAddress(rs.getString("address"));
				order.setNote(rs.getString("note"));
				order.setOrderdate(rs.getDate("orderdate"));
				order.setStatus(rs.getInt("status"));
				order.setTotal(rs.getLong("total"));
				order.setUser_id(rs.getInt("user_id"));
				orderlist.add(order);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderlist;
	}

	// Phương thức cập nhật hóa đơn
	public boolean update(Order order) {
		boolean check = false;
		Connection conn = DBConnect.getConnection();
		String sql = "update order set fullname = ?, email = ?, pphonenumber = ?, address = ?,"
				+ "note = ?, orderdate = ?, status = ?, total = ?, user_id = ? where id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, order.getFullname());
			ps.setString(2, order.getEmail());
			ps.setString(3, order.getPhonenumber());
			ps.setString(4, order.getAddress());
			ps.setString(5, order.getNote());
			ps.setDate(6, order.getOrderdate());
			ps.setInt(7, order.getStatus());
			ps.setDouble(8, order.getTotal());
			ps.setInt(9, order.getUser_id());
			ps.setInt(10, order.getId());
			int row = ps.executeUpdate();
			if (row > 0) {
				check = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return check;

	}

	// Phương thức xóa hóa đơn
	public void delete(int id) {
		Connection conn = DBConnect.getConnection();
		String sql = "delete from order where id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// Phương thức cập nhật hóa đơn
	public boolean updateStatus(int sta, int id) {
		boolean check = false;
		Connection conn = DBConnect.getConnection();
		String sql = "update `order` set status = ? where id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, sta);
			ps.setInt(2, id);
			int row = ps.executeUpdate();
			if (row > 0) {
				check = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return check;

	}

	// Phương hóa đơn theo thời gian đặt
	public Order getOrder(Date date) {
		Order order = null;
		Connection conn = DBConnect.getConnection();
		String sql = "select * from `order` where orderdate = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setDate(1, date);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				order = new Order();
				order.setId(rs.getInt("id"));
				order.setFullname(rs.getString("fullname"));
				order.setEmail(rs.getString("email"));
				order.setPhonenumber(rs.getString("phonenumber"));
				order.setAddress(rs.getString("address"));
				order.setNote(rs.getString("note"));
				order.setOrderdate(rs.getDate("orderdate"));
				order.setStatus(rs.getInt("status"));
				order.setTotal(rs.getLong("total"));
				order.setUser_id(rs.getInt("user_id"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return order;
	}

	// Phương thức lấy hóa đơn ngày hôm nay
	public List<Order> getOrdersToDay(Date date) {
		List<Order> orderlist = new ArrayList<Order>();
		Connection conn = DBConnect.getConnection();
		String sql = "select * from `order` where orderdate = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setDate(1, date);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Order order = new Order();
				order.setId(rs.getInt("id"));
				order.setFullname(rs.getString("fullname"));
				order.setEmail(rs.getString("email"));
				order.setPhonenumber(rs.getString("phonenumber"));
				order.setAddress(rs.getString("address"));
				order.setNote(rs.getString("note"));
				order.setOrderdate(rs.getDate("orderdate"));
				order.setStatus(rs.getInt("status"));
				order.setTotal(rs.getLong("total"));
				order.setUser_id(rs.getInt("user_id"));
				orderlist.add(order);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderlist;
	}
	
	// Phương thức lấy hóa đơn theo tuần
		public List<Order> getOrdersLastWeek(Date start) {
			List<Order> orderlist = new ArrayList<Order>();
			Connection conn = DBConnect.getConnection();
			String sql = "select * from `order` where orderdate > ?";
			try {
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setDate(1, start); 
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					Order order = new Order();
					order.setId(rs.getInt("id"));
					order.setFullname(rs.getString("fullname"));
					order.setEmail(rs.getString("email"));
					order.setPhonenumber(rs.getString("phonenumber"));
					order.setAddress(rs.getString("address"));
					order.setNote(rs.getString("note"));
					order.setOrderdate(rs.getDate("orderdate"));
					order.setStatus(rs.getInt("status"));
					order.setTotal(rs.getLong("total"));
					order.setUser_id(rs.getInt("user_id"));
					orderlist.add(order);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
			return orderlist;
		}
}
