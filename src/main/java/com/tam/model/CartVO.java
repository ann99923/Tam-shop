package com.tam.model;


import java.util.List;


import lombok.Data;

@Data
public class CartVO {
	
	private int cartNum;		// 장바구니 번호
	private int prodNum;		// 상품번호
	private String id;			// 회원아이디
	private int cartCount;		// 수량
	
	
	//product	
	private String prodName;
	private int price;
	private int totalPrice;
	
	//이미지
	private String img1;
	
	//가격 합계
	public void initSaleTotal() {
		this.totalPrice = this.price*this.cartCount;
		
	}
}
