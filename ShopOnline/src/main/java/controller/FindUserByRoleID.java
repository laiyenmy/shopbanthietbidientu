package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.User;

@WebServlet(urlPatterns = {"/list-user"})
public class FindUserByRoleID extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		int role_id = Integer.parseInt(req.getParameter("role_id"));
		UserDAO userDAO = new UserDAO();
		List<User> listuser = new ArrayList<User>();
		listuser = userDAO.getUserByRoleID(role_id);
		session.setAttribute("listuser", listuser);
		session.setAttribute("role_id", role_id);
		req.getRequestDispatcher("/views/admin/listUser.jsp").forward(req, resp);
	}
}
