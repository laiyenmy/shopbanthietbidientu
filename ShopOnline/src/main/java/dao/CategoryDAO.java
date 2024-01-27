package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Category;

public class CategoryDAO {
	//Phương thức lấy toàn bộ danh mục sản phẩm
	public List<Category> getAll(){
		List<Category> categories = new ArrayList<Category>();
		Connection conn = DBConnect.getConnection();
		String sql = "SELECT * FROM category";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Category category = new Category();
				category.setId(rs.getInt("id"));
				category.setName(rs.getString("name"));
				categories.add(category);			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return categories;
	}
	// Phương thức thêm mới loại sản phẩm
	public boolean insert(Category category) {
		boolean check = false;
		Connection conn = DBConnect.getConnection();
		String sql = "insert into category values(?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, category.getId());
			ps.setString(2, category.getName());
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
	//Phương thức lấy loại sản phẩm theo id
	public Category getById(int id) {
		Category category = null;
		Connection conn = DBConnect.getConnection();
		String sql = "select * from category where id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				category =  new Category();
				category.setId(rs.getInt("id"));
				category.setName(rs.getString("name"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return category;
	}
	// Phương thức cập nhật loại sản phẩm
		public boolean update(Category category) {
			boolean check = false;
			Connection conn = DBConnect.getConnection();
			String sql = "update category set name = ? where id = ?";
			try {
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, category.getName());
				ps.setInt(2, category.getId());
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
	// Phương thức xóa loại sản phẩm
		public void delete(int id) {
			Connection conn = DBConnect.getConnection();
			String sql = "delete from category where id = ?";
			try {
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setInt(1, id);
				ps.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
}
