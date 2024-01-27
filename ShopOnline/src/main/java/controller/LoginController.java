package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.User;

@WebServlet(urlPatterns = {"/login"})
public class LoginController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		UserDAO userDAO = new UserDAO();
		User user = new User();
		if(userDAO.login(username, password)) {
			user = userDAO.getUser(username, password);
			HttpSession session = req.getSession();
			session.setAttribute("id", user.getId());
			session.setAttribute("fullname", user.getFullname());
			session.setAttribute("username", user.getUsername());
			session.setAttribute("password", user.getPassword());
			session.setAttribute("email", user.getEmail());
			session.setAttribute("phonenumber", user.getPhonenumber());
			session.setAttribute("address", user.getAddress());
			session.setAttribute("role_id", user.getRole_id());
			session.setAttribute("status", user.getStatus());
			if(user.getRole_id() == 1) {
				resp.sendRedirect("/ShopOnline/indexadmin");
				//resp.sendRedirect("/ShopOnline/list-category");
			}
			else if(user.getRole_id() == 2){
				resp.sendRedirect("/ShopOnline/index");
			}
		}
		else {
			req.setAttribute("loginError", "Sai tên đăng nhập hoặc mật khẩu");
			req.getRequestDispatcher("/views/admin/login.jsp").forward(req, resp);
		}
	}
}
