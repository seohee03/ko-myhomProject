package com.myhome.www.store.dto;

public class Cart {
	
	private int cartNo;
	private int memberNo;
	private int amount;
	private int itemNo;
	private int price;
	
	public Cart() {}
	public Cart(int amount, int itemNo, int price) {
		this.amount = amount;
		this.itemNo = itemNo;
		this.price = price;
	}
	
	public Cart(int cartNo, int memberNo, int amount, int itemNo, int price) {
		super();
		this.cartNo = cartNo;
		this.memberNo = memberNo;
		this.amount = amount;
		this.itemNo = itemNo;
		this.price = price;
	}
	public int getCartNo() {
		return cartNo;
	}


	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public int getAmount() {
		return amount;
	}


	public void setAmount(int amount) {
		this.amount = amount;
	}


	public int getItemNo() {
		return itemNo;
	}


	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}
}
