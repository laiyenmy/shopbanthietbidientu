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

import dao.OrderDetailDAO;
import model.OrderDetail;

@WebServlet(urlPatterns = {"/orderDetail"})
public class OrderDetailController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		int order_id =Integer.parseInt(req.getParameter("id"));
		
		List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
		OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
		orderDetails = orderDetailDAO.getOrderDetailByOrderID(order_id);
		session.setAttribute("orderDetails", orderDetails);
		req.getRequestDispatcher("/views/client/orderdetail.jsp").forward(req, resp);
	}
}
