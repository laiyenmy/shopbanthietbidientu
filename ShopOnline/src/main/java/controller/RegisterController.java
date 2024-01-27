package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import model.User;

@WebServlet(urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		int id = 1;
		String fullname = req.getParameter("fullname");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		String phonenumber = req.getParameter("phonenumber");
		String address = req.getParameter("address");;
		int role_id = 2;
		int status = 1;
		UserDAO userDAO = new UserDAO();
		if(userDAO.login(username, password)) {
			req.setAttribute("registerError", "Đã tồn tại tên đăng nhập");
			req.getRequestDispatcher("/views/admin/register.jsp").forward(req, resp);
		}
		else {
			req.setAttribute("registerSuccess", "Đăng ký thành công");
			User user = new User(id, fullname, username, password, email, phonenumber, address, role_id, status);
			userDAO.insert(user);
			req.getRequestDispatcher("/views/admin/login.jsp").forward(req, resp);
		}
	}
}
