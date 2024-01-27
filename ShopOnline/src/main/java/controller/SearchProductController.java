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

import dao.CartDAO;
import dao.CartListDAO;
import dao.CategoryDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import model.Cart;
import model.CartList;
import model.Category;
import model.Order;
import model.Product;

@WebServlet(urlPatterns = {"/searchproduct"})
public class SearchProductController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		String name = req.getParameter("name");
		ProductDAO productDAO = new ProductDAO();
		List<Product> Products = new ArrayList<Product>();

		Products = productDAO.getProductsByName(name);
		
		session.setAttribute("Products", Products);
		req.getRequestDispatcher("/views/client/searchproduct.jsp").forward(req, resp);
	}
}
