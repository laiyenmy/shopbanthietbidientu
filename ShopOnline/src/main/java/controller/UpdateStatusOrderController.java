package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.ProductDAO;
import model.OrderDetail;
import model.Product;

@WebServlet(urlPatterns = {"/updateStatus"})
public class UpdateStatusOrderController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(req.getParameter("id"));
		int userid = Integer.parseInt(req.getParameter("userid"));
		
		CartDAO cartDAO = new CartDAO();
		cartDAO.delete(userid);
		
		List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
		OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
		orderDetails = orderDetailDAO.getOrderDetailByOrderID(id);
		for(int i = 0; i < orderDetails.size(); i++) {
			int productid = orderDetails.get(i).getProduct_id();
			ProductDAO productDAO = new ProductDAO();
			Product product = productDAO.getById(productid);
			
			int quantity = product.getQuantity() - orderDetails.get(i).getQuantity();
			
			
			productDAO.updateQuantity(quantity, productid);
		}
	
		OrderDAO orderDAO = new OrderDAO();
		orderDAO.updateStatus(2, id);
		resp.sendRedirect("/ShopOnline/list-order");
	}
}
