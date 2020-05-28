package com.myhome.www.item.dto;

public class Item {
	private int itemNo;
	private String itemCode;
	private String itemName;
	private String itemDetail;
	private int price;
	private int stock;

//	public Item() {
//	}
//	
//	public Item(String itemName, String itemDetail, int price, int stock) {
//
//		this.itemName = itemName;
//		this.itemDetail = itemDetail;
//		this.price = price;
//		this.stock = stock;
//	}
	
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
}
