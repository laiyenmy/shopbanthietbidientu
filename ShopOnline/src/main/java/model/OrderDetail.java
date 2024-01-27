package model;

public class OrderDetail {
	
	private int id;
	private long price;
	private int quantity;
	private long total;
	private int product_id;
	private int order_id;
	private int status;
	
	public OrderDetail() {
		super();
	}

	public OrderDetail(int id, long price, int quantity, long total, int product_id, int order_id, int status) {
		super();
		this.id = id;
		this.price = price;
		this.quantity = quantity;
		this.total = total;
		this.product_id = product_id;
		this.order_id = order_id;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
}
