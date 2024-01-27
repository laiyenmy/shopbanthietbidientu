package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import model.User;

@WebServlet(urlPatterns = {"/updateInfo"})
public class UpdateInfoController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(req.getParameter("id"));
		String ht = req.getParameter("hoten");
		String tk = req.getParameter("taikhoan");
		String mk = req.getParameter("matkhau");
		String email = req.getParameter("email");
		String sdt = req.getParameter("sdt");
		String dc = req.getParameter("dc");
		User user = new User(id, ht, tk, mk, email, sdt, dc, 2, 1);
		UserDAO userDAO = new UserDAO();
		userDAO.update(user);
		req.getRequestDispatcher("/views/admin/login.jsp").forward(req, resp);
	}

}
