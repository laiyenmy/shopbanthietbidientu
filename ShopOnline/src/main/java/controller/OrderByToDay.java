package controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrderDAO;
import model.Order;

@WebServlet(urlPatterns = {"/orderbytoday"})
public class OrderByToDay extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		Date date = new Date(System.currentTimeMillis());
		HttpSession session = req.getSession();
		OrderDAO orderDAO = new OrderDAO();
		List<Order> orders = new ArrayList<Order>();
		orders = orderDAO.getOrdersToDay(date);
		session.setAttribute("orders", orders);
		req.getRequestDispatcher("/views/admin/listOrder.jsp").forward(req, resp);
	}
}
