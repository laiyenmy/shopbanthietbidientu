package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Cart;

public class CartDAO {
		// Lấy danh sách giỏ hàng theo mã người dùng
		public List<Cart> getCartListByUserId(int user_id){
			List<Cart> cartlist = new ArrayList<Cart>();
			Connection conn = DBConnect.getConnection();
			String sql = "select * from cart where user_id = ?";
			try {
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setInt(1, user_id);
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					Cart cl = new Cart();
					cl.setId(rs.getInt("id"));
					cl.setProduct_id(rs.getInt("product_id"));
					cl.setUser_id(rs.getInt("user_id"));
					cl.setQuantity(rs.getInt("quantity"));
					
					cartlist.add(cl);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return cartlist;
		}
		// Thêm giỏ hàng
		public boolean insert(Cart cart) {
			boolean check = false;
			Connection conn = DBConnect.getConnection();
			String sql = "insert into cart (product_id, user_id, quantity) values(?,?,?)";
			try {
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setInt(1, cart.getProduct_id());
				ps.setInt(2, cart.getUser_id());
				ps.setInt(3, cart.getQuantity());

				int row = ps.executeUpdate();
				if(row > 0) {
					return true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return check;
		}
		
		// Cập nhật giỏ hàng theo tên người dùng
		public boolean update(Cart cart) {
			boolean check = false;
			Connection conn = DBConnect.getConnection();
			String sql = "update cartlist set quantity = ? where product_id = ? AND user_id = ?";
			try {
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setInt(1, cart.getQuantity());
				ps.setInt(2, cart.getProduct_id());
				ps.setInt(3, cart.getUser_id());
				int row = ps.executeUpdate();
				if(row > 0) {
					return true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return check;
		}
		
		// Xóa giỏi hàng theo tên người dùng
		public void delete(int user_id) {
			Connection conn = DBConnect.getConnection();
			String sql = "delete from cart where user_id = ?";
			try {
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setInt(1, user_id);
				ps.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
}
