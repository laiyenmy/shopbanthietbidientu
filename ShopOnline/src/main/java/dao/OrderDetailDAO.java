package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.OrderDetail;

public class OrderDetailDAO {
	
	
	//Lấy thông tin chi tiết hóa đơn
	public List<OrderDetail> getOrderDetailByOrderID(int order_id){
		List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
		Connection conn = DBConnect.getConnection();
		String sql = "select * from orderdetail where order_id = ?";
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, order_id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setId(rs.getInt("id"));
				orderDetail.setPrice(rs.getLong("price"));
				orderDetail.setQuantity(rs.getInt("quantity"));
				orderDetail.setTotal(rs.getLong("total"));
				orderDetail.setProduct_id(rs.getInt("product_id"));
				orderDetail.setId(rs.getInt("order_id"));
				orderDetail.setStatus(rs.getInt("status"));
				orderDetails.add(orderDetail);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orderDetails;
	}
	
	// Phương thức thêm mới hoán đơn 
		public boolean insert(OrderDetail orderDetail) {
			boolean check = false;
			Connection conn = DBConnect.getConnection();
			String sql = "insert into `orderdetail` (price, quantity, total, product_id, order_id, status) values (?, ?, ?, ?, ?, ?)";

			try {
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setLong(1, orderDetail.getPrice());
				ps.setInt(2, orderDetail.getQuantity());
				ps.setLong(3, orderDetail.getTotal());
				ps.setInt(4, orderDetail.getProduct_id());
				ps.setInt(5, orderDetail.getOrder_id());
				ps.setInt(6, orderDetail.getStatus());
				
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
}
