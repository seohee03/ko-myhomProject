package com.myhome.www.store.dto;

public class CartCommand {
	
	private int cartNo;
    private int memberNo;
    private String memberId;
    private int itemNo;
    private String itemName;
    private int amount;
    private int price;
    private int option1No;
    private int option2No;
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
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getItemNo() {
		return itemNo;
	}
	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getOption1No() {
		return option1No;
	}
	public void setOption1No(int option1No) {
		this.option1No = option1No;
	}
	public int getOption2No() {
		return option2No;
	}
	public void setOption2No(int option2No) {
		this.option2No = option2No;
	}
    
    

    
}
