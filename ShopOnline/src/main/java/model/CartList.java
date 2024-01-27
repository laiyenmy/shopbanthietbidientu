package model;

import java.sql.Date;

public class CartList extends Product {

		private int product_id;
		private int user_id;
		private int sl;
		
		public CartList() {
			super();
		}
		
		public CartList(int product_id, int user_id, int sl) {
			super();
			this.product_id = product_id;
			this.user_id = user_id;
			this.sl = sl;
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

		public int getSl() {
			return sl;
		}

		public void setSl(int sl) {
			this.sl = sl;
		}

}
