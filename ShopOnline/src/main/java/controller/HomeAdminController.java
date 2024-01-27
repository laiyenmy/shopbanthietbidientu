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

import dao.CategoryDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import dao.UserDAO;
import model.Category;
import model.Order;
import model.Product;

@WebServlet(urlPatterns = {"/indexadmin"})
public class HomeAdminController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		CategoryDAO categoryDAO = new CategoryDAO();
		ProductDAO productDAO = new ProductDAO();
		List<Category> categories = new ArrayList<Category>();
		List<Product> products = new ArrayList<Product>();
		categories = categoryDAO.getAll();
		products = productDAO.getAll();
		session.setAttribute("listcategories", categories);
		req.setAttribute("listproducts", products);
		req.getRequestDispatcher("/views/admin/indexAdmin.jsp").forward(req, resp);
	}
}
