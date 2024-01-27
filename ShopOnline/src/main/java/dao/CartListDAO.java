package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.CartList;

public class CartListDAO {
	
	// Lấy danh sách giỏ hàng theo mã người dùng
	public List<CartList> getCartListByUserId(int user_id){
		List<CartList> cartlist = new ArrayList<CartList>();
		Connection conn = DBConnect.getConnection();
		String sql = "select * from cartlist where user_id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, user_id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				CartList cl = new CartList();
				cl.setProduct_id(rs.getInt("product_id"));
				cl.setUser_id(rs.getInt("user_id"));
				cl.setSl(rs.getInt("quantity"));
				cl.setId(rs.getInt("id"));
				cl.setName(rs.getString("name"));
				cl.setShort_description(rs.getString("short_description"));
				cl.setPrice(rs.getLong("price"));
				cl.setDiscount(rs.getLong("discount"));
				cl.setQuantity(rs.getInt("sl"));
				cl.setThumbnail(rs.getString("thumbnail"));
				cl.setDescription(rs.getString("description"));
				cl.setIs_featured(rs.getInt("is_featured"));
				cl.setStatus(rs.getInt("status"));
				cl.setCategory_id(rs.getInt("category_id"));
				cl.setCreate_at(rs.getDate("create_at"));
				cl.setUpdate_at(rs.getDate("update_at"));
				cartlist.add(cl);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cartlist;
	}
	
}
