package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Product;

public class ProductDAO {
	// Phương thức lấy toàn bộ sản phẩm
	public List<Product> getAll() {
		List<Product> products = new ArrayList<Product>();
		Connection conn = DBConnect.getConnection();
		String sql = "select * from product";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setShort_description(rs.getString("short_description"));
				product.setPrice(rs.getLong("price"));
				product.setDiscount(rs.getLong("discount"));
				product.setQuantity(rs.getInt("quantity"));
				product.setThumbnail(rs.getString("thumbnail"));
				product.setDescription(rs.getString("description"));
				product.setIs_featured(rs.getInt("is_featured"));
				product.setStatus(rs.getInt("status"));
				product.setCategory_id(rs.getInt("category_id"));
				product.setCreate_at(rs.getDate("create_at"));
				product.setUpdate_at(rs.getDate("update_at"));
				products.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return products;
	}

	// Phương thức lấy ra những sản phẩm mới
	public List<Product> getNewProducts() {
		List<Product> products = new ArrayList<Product>();
		Connection conn = DBConnect.getConnection();
		String sql = "select * from product order by create_at desc limit 9";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setShort_description(rs.getString("short_description"));
				product.setPrice(rs.getLong("price"));
				product.setDiscount(rs.getLong("discount"));
				product.setQuantity(rs.getInt("quantity"));
				product.setThumbnail(rs.getString("thumbnail"));
				product.setDescription(rs.getString("description"));
				product.setIs_featured(rs.getInt("is_featured"));
				product.setStatus(rs.getInt("status"));
				product.setCategory_id(rs.getInt("category_id"));
				product.setCreate_at(rs.getDate("create_at"));
				product.setUpdate_at(rs.getDate("update_at"));
				products.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return products;
	}

	// Phương thức thêm mới loại sản phầm
	public boolean insert(Product product) {
		boolean check = false;
		Connection conn = DBConnect.getConnection();
		String sql = "insert into product values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, product.getId());
			ps.setString(2, product.getName());
			ps.setString(3, product.getShort_description());
			ps.setLong(4, product.getPrice());
			ps.setLong(5, product.getDiscount());
			ps.setInt(6, product.getQuantity());
			ps.setString(7, product.getThumbnail());
			ps.setString(8, product.getDescription());
			ps.setInt(9, product.getIs_featured());
			ps.setInt(10, product.getStatus());
			ps.setInt(11, product.getCategory_id());
			ps.setDate(12, product.getCreate_at());
			ps.setDate(13, product.getUpdate_at());
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

	// Phương thức lấy loại sản phầm theo id
	public Product getById(int id) {
		Product product = null;
		Connection conn = DBConnect.getConnection();
		String sql = "select * from product where id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setShort_description(rs.getString("short_description"));
				product.setPrice(rs.getLong("price"));
				product.setDiscount(rs.getLong("discount"));
				product.setQuantity(rs.getInt("quantity"));
				product.setThumbnail(rs.getString("thumbnail"));
				product.setDescription(rs.getString("description"));
				product.setIs_featured(rs.getInt("is_featured"));
				product.setStatus(rs.getInt("status"));
				product.setCategory_id(rs.getInt("category_id"));
				product.setCreate_at(rs.getDate("create_at"));
				product.setUpdate_at(rs.getDate("update_at"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return product;
	}

	// Phương thức cập nhật sản phẩm
	public boolean update(Product product) {
		boolean check = false;
		Connection conn = DBConnect.getConnection();
		String sql = "update product set name = ?, short_description = ?, price = ?, discount = ?,"
				+ "quantity = ?, thumbnaib = ?, description = ?, is_featured = ?, status = ?,"
				+ "category_id = ?, create_at = ?, update_at = ? where id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, product.getName());
			ps.setString(2, product.getShort_description());
			ps.setLong(3, product.getPrice());
			ps.setLong(4, product.getDiscount());
			ps.setInt(5, product.getQuantity());
			ps.setString(6, product.getThumbnail());
			ps.setString(7, product.getDescription());
			ps.setInt(8, product.getIs_featured());
			ps.setInt(9, product.getStatus());
			ps.setInt(10, product.getCategory_id());
			ps.setDate(11, product.getCreate_at());
			ps.setDate(12, product.getUpdate_at());
			ps.setInt(13, product.getId());
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

	// Phương thức xóa sản phẩm
	public void delete(int id) {
		Connection conn = DBConnect.getConnection();
		String sql = "delete from product where id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// Phương thức lấy sản phẩm theo danh mục
	public List<Product> getProductByCategory(int idCategory) {
		List<Product> products = new ArrayList<Product>();
		Connection conn = DBConnect.getConnection();
		String sql = "select * from product where category_id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, idCategory);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setShort_description(rs.getString("short_description"));
				product.setPrice(rs.getLong("price"));
				product.setDiscount(rs.getLong("discount"));
				product.setQuantity(rs.getInt("quantity"));
				product.setThumbnail(rs.getString("thumbnail"));
				product.setDescription(rs.getString("description"));
				product.setIs_featured(rs.getInt("is_featured"));
				product.setStatus(rs.getInt("status"));
				product.setCategory_id(rs.getInt("category_id"));
				product.setCreate_at(rs.getDate("create_at"));
				product.setUpdate_at(rs.getDate("update_at"));
				products.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return products;
	}

	public boolean updateQuantity(int quantity, int productid) {
		boolean check = false;
		Connection conn = DBConnect.getConnection();
		String sql = "update product set quantity = ? where id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, quantity);
			ps.setInt(2, productid);
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

	// Phương thức lấy ra những sản phẩm mới
	public List<Product> getProductsByName(String name) {
		List<Product> products = new ArrayList<Product>();
		Connection conn = DBConnect.getConnection();
		String sql = "select * from product where name like ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,"%" + name + "%");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setShort_description(rs.getString("short_description"));
				product.setPrice(rs.getLong("price"));
				product.setDiscount(rs.getLong("discount"));
				product.setQuantity(rs.getInt("quantity"));
				product.setThumbnail(rs.getString("thumbnail"));
				product.setDescription(rs.getString("description"));
				product.setIs_featured(rs.getInt("is_featured"));
				product.setStatus(rs.getInt("status"));
				product.setCategory_id(rs.getInt("category_id"));
				product.setCreate_at(rs.getDate("create_at"));
				product.setUpdate_at(rs.getDate("update_at"));
				products.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return products;
	}
}
