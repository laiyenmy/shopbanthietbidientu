package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import model.Category;

@WebServlet(urlPatterns = {"/updateCategory"})
public class UpdateCategoryController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(req.getParameter("id"));
		CategoryDAO categoryDAO = new CategoryDAO();
		Category category = categoryDAO.getById(id);
		req.setAttribute("category", category);
		req.getRequestDispatcher("/views/admin/updateCategory.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		Category category = new Category(id, name);
		CategoryDAO categoryDAO = new CategoryDAO();
		categoryDAO.update(category);
		resp.sendRedirect("/ShopOnline/list-category");
	}
}
