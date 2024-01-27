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

@WebServlet(urlPatterns = {"/index"})
public class HomeController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		CategoryDAO categoryDAO = new CategoryDAO();
		ProductDAO productDAO = new ProductDAO();
		CartListDAO cartListDAO = new CartListDAO();
		OrderDAO orderDAO = new OrderDAO();
		CartDAO cartDAO = new CartDAO();
		List<Category> categories = new ArrayList<Category>();
		List<Product> newProducts = new ArrayList<Product>();
		List<CartList> cartlistdata = new ArrayList<CartList>();
		List<Cart> cartdata = new ArrayList<Cart>();
		List<Order> orderlist = new ArrayList<Order>();
		categories = categoryDAO.getAll();
		newProducts = productDAO.getNewProducts();
		if((Integer)session.getAttribute("id") == null) {
			cartlistdata = null;
			cartdata = null;
			orderlist = null;
		}
		else {
			cartlistdata = cartListDAO.getCartListByUserId((Integer)session.getAttribute("id"));
			cartdata = cartDAO.getCartListByUserId((Integer)session.getAttribute("id"));
			orderlist = orderDAO.getByUserId((Integer)session.getAttribute("id"));
		}
		session.setAttribute("categories", categories);
		session.setAttribute("newProducts", newProducts);
		session.setAttribute("cartlistdata", cartlistdata);
		session.setAttribute("cartdata", cartdata);
		session.setAttribute("orderlist", orderlist);
		req.getRequestDispatcher("/views/client/index.jsp").forward(req, resp);
	}
}
