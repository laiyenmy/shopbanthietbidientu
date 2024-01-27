package model;

import java.sql.Date;

public class Product {
	private int id;
	private String name;
	private String short_description;
	private long price;
	private long discount;
	private int quantity;
	private String thumbnail;
	private String description;
	private int is_featured;
	private int status;
	private int category_id;
	private Date create_at;
	private Date update_at;

	public Product() {
		super();
	}

	public Product(int id, String name, String short_description, long price, long discount, int quantity,
			String thumbnail, String description, int is_featured, int status, int category_id, Date create_at,
			Date update_at) {
		super();
		this.id = id;
		this.name = name;
		this.short_description = short_description;
		this.price = price;
		this.discount = discount;
		this.quantity = quantity;
		this.thumbnail = thumbnail;
		this.description = description;
		this.is_featured = is_featured;
		this.status = status;
		this.category_id = category_id;
		this.create_at = create_at;
		this.update_at = update_at;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getShort_description() {
		return short_description;
	}

	public void setShort_description(String short_description) {
		this.short_description = short_description;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public long getDiscount() {
		return discount;
	}

	public void setDiscount(long discount) {
		this.discount = discount;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getIs_featured() {
		return is_featured;
	}

	public void setIs_featured(int is_featured) {
		this.is_featured = is_featured;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public Date getCreate_at() {
		return create_at;
	}

	public void setCreate_at(Date create_at) {
		this.create_at = create_at;
	}

	public Date getUpdate_at() {
		return update_at;
	}

	public void setUpdate_at(Date update_at) {
		this.update_at = update_at;
	}
	
}
