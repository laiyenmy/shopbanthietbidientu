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
import dao.ProductDAO;
import model.Cart;
import model.CartList;
import model.Product;

@WebServlet(urlPatterns = { "/add-to-cart" })
public class AddToCartController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		try {
			int user_id = Integer.parseInt(req.getParameter("userid"));
			String username = req.getParameter("name");
			if (username.length() != 0) {
				List<CartList> carts = new ArrayList<CartList>();
				CartList cart = new CartList();
				ProductDAO productDAO = new ProductDAO();
				CartListDAO cartListDAO = new CartListDAO();
				Product product = new Product();
				product = productDAO.getById(id);
				cart.setProduct_id(id);
				cart.setUser_id(user_id);
				cart.setSl(1);
				cart.setId(product.getId());
				cart.setName(product.getName());
				cart.setShort_description(product.getShort_description());
				cart.setPrice(product.getPrice());
				cart.setDiscount(product.getDiscount());
				cart.setQuantity(product.getQuantity());
				cart.setThumbnail(product.getThumbnail());
				cart.setDescription(product.getDescription());
				cart.setIs_featured(product.getIs_featured());
				cart.setStatus(product.getStatus());
				cart.setCategory_id(product.getCategory_id());
				cart.setCreate_at(product.getCreate_at());
				cart.setUpdate_at(product.getUpdate_at());

				CartDAO cartDAO = new CartDAO();
				Cart ca = new Cart();
				ca.setProduct_id(id);
				ca.setUser_id(user_id);
				ca.setQuantity(1);

				HttpSession session = req.getSession();
				List<CartList> cartlist = (ArrayList<CartList>) session.getAttribute("cartlistdata");
				if (cartlist == null) {
					carts.add(cart);
					session.setAttribute("cartlistdata", carts);
					cartDAO.insert(ca);
				} else {
					carts = cartlist;
					boolean exist = false;
					for (CartList c : cartlist) {
						if (c.getId() == id) {
							c.setSl(c.getSl() + 1);
							ca.setQuantity(ca.getQuantity() + 1);
							cartDAO.update(ca);
							exist = true;
						}
					}
					if (exist == false) {
						// insert
						carts.add(cart);
						cartDAO.insert(ca);
					}
					session.setAttribute("cartlistdata", carts);
				}
				resp.sendRedirect("/ShopOnline/index");
				// req.getRequestDispatcher("/views/client/index.jsp").forward(req, resp);
			} else {
				req.getRequestDispatcher("/views/admin/login.jsp").forward(req, resp);
			}
		} catch (Exception e) {
			req.getRequestDispatcher("/views/admin/login.jsp").forward(req, resp);
		}
	}
}
