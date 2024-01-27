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
import dao.OrderDetailDAO;
import model.CartList;
import model.Order;
import model.OrderDetail;

@WebServlet(urlPatterns = {"/insert-order"})
public class InsertOrderController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		List<CartList> cartlist = (ArrayList<CartList>) session.getAttribute("cartlistdata");
		int soluong = 0;
		long tongtien = 0;
		if (cartlist != null) {
			for (int i = 0; i < cartlist.size(); i++) {
				soluong = soluong + cartlist.get(i).getSl();
				tongtien = tongtien + (cartlist.get(i).getPrice() * cartlist.get(i).getSl()
				- cartlist.get(i).getDiscount() * cartlist.get(i).getSl());
			}
		
		}
		String fullname = (String)session.getAttribute("fullname");
		String email = (String)session.getAttribute("email");
		String phonenumber = (String)session.getAttribute("phonenumber");
		String address = (String)session.getAttribute("address");
		String node = "const";
		Date orderdate = new Date(System.currentTimeMillis());
		int status = 1;
		long sum = tongtien;
		int user_id = (Integer)session.getAttribute("id");
		
		Order order = new Order(1, fullname, email, phonenumber, address, node, orderdate, status, sum, user_id);
		OrderDAO orderDAO = new OrderDAO();
		orderDAO.insert(order);
		
		Order or = orderDAO.getOrder(orderdate);
		int orid = or.getId();
		
		
		if (cartlist != null) {
			for (int i = 0; i < cartlist.size(); i++) {
				long price = cartlist.get(i).getPrice() - cartlist.get(i).getDiscount();
				int quantity = cartlist.get(i).getSl();
				long total = price*quantity;
				int product_id = cartlist.get(i).getProduct_id();
				int order_id = orid;
				int sta = 2;
				OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
				OrderDetail orderDetail = new OrderDetail(1, price, quantity, total, product_id, order_id, sta);
				orderDetailDAO.insert(orderDetail);
			}
		
		}
		resp.sendRedirect("/ShopOnline/order");
	}
}
