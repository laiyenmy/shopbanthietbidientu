package model;

public class Cart extends Product {
	
	private int id;
	private int product_id;
	private int user_id;
	private int quantity;
	
	
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Cart(int id, int product_id, int user_id, int quantity) {
		super();
		this.id = id;
		this.product_id = product_id;
		this.user_id = user_id;
		this.quantity = quantity;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getProduct_id() {
		return product_id;
	}


	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}


	public int getUser_id() {
		return user_id;
	}


	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}
