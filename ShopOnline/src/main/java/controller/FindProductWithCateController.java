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

import dao.ProductDAO;
import model.Product;

@WebServlet(urlPatterns = {"/list-product"})
public class FindProductWithCateController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(req.getParameter("id"));
		String category = req.getParameter("category");
		HttpSession sessionproduct = req.getSession();
		List<Product> listproduct = new ArrayList<Product>();
		ProductDAO productDAO = new ProductDAO();
		listproduct = productDAO.getProductByCategory(id);
		sessionproduct.setAttribute("listproduct", listproduct);
		sessionproduct.setAttribute("category", category);
		req.getRequestDispatcher("/views/admin/listProduct.jsp").forward(req, resp);	
		
	}
}
