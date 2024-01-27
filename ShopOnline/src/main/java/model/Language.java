package model;


import java.util.HashMap;
import java.util.Map;

public class Language {
	public Map<String, String> englishLanguage(){
		Map<String, String> map = new HashMap<String, String>();
		map.put("User.Note", "Note");
		map.put("User.Text", "Any personal information is not provided to outside parties. Thank you!");
		map.put("User.ProInfo", "Profile Information");
		map.put("User.FullName", "FullName");
		map.put("User.UserName", "UserName");
		map.put("User.Password", "Password");
		map.put("User.Email", "Email");
		map.put("User.PhoneNumber", "PhoneNumber");
		map.put("User.Address", "Address");
		map.put("User.Position", "Position");
		map.put("User.Status", "Status");
		return map;
	}
	
	public Map<String, String> vietnamLanguage(){
		Map<String, String> map = new HashMap<String, String>();
		map.put("User.Note", "Chú ý");
		map.put("User.Text", "Mọi thông tin cá nhân không được cung cấp ra bên ngoài. Xin cảm ơn!");
		map.put("User.ProInfo", "Thông Tin Hồ Sơ");
		map.put("User.FullName", "Họ Tên");
		map.put("User.UserName", "Tài Khoản");
		map.put("User.Password", "Mật Khẩu");
		map.put("User.Email", "Email");
		map.put("User.PhoneNumber", "Số Điện Thoại");
		map.put("User.Address", "Địa Chỉ");
		map.put("User.Position", "Chức Vụ");
		map.put("User.Status", "Trạng Thái");
		return map;
	}

}
