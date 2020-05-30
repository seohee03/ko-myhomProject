package com.myhome.www.item.dto;

import java.time.LocalDateTime;

public class Item {
	private int itemNo;						//상품번호
	private String itemCode;				//상품코드
	private String itemName;				//상품명
	private String itemDetail;				//상품 설명
	private int price;						//가격
	private int stock;						//재고
	private LocalDateTime itemRegDateTime;	//등록일
	private int categorieNo;				//카테고리 번호
	
//	public Item() {
//	}
//	
//	public Item(String itemName, String itemDetail, 
//			int price, int stock, int categorieNo) {
//		this.itemName = itemName;
//		this.itemDetail = itemDetail;
//		this.price = price;
//		this.stock = stock;
//		this.categorieNo = categorieNo;
//	}
	
	public void setItemRegDateTime(LocalDateTime itemRegDateTime) {
		this.itemRegDateTime = itemRegDateTime;
	}
	public LocalDateTime getItemRegDateTime() {
		return itemRegDateTime;
	}
	
	public int getItemNo() {
		return itemNo;
	}
	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String one) {
		this.itemCode = one;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemDetail() {
		return itemDetail;
	}
	public void setItemDetail(String itemDetail) {
		this.itemDetail = itemDetail;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getCategorieNo() {
		return categorieNo;
	}

	public void setCategorieNo(int categorieNo) {
		this.categorieNo = categorieNo;
	}
	@Override
	public String toString() {
		return "Item [itemNo=" + itemNo + ", itemCode=" + itemCode + ", itemName=" + itemName + ", itemDetail="
				+ itemDetail + ", price=" + price + ", stock=" + stock + ", itemRegDateTime=" + itemRegDateTime
				+ ", categorieNo=" + categorieNo + "]";
	}
	
}
