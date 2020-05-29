package com.myhome.www.item.dto;


public class Option1 {
	
	private int option1No;
	private int itemNo;
	private String option1Name;
	private int option1Price;
	private int option1Stock;
	
//	public Option1() {
//		// TODO Auto-generated constructor stub
//	}
//
//	public Option1(int itemNo, String option1Name, int option1Price, int option1Stock) {
//		this.itemNo = itemNo;
//		this.option1Name = option1Name;
//		this.option1Price = option1Price;
//		this.option1Stock = option1Stock;
//	}

	public int getOption1No() {
		return option1No;
	}

	public void setOption1No(int option1No) {
		this.option1No = option1No;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public String getOption1Name() {
		return option1Name;
	}

	public void setOption1Name(String option1Name) {
		this.option1Name = option1Name;
	}

	public int getOption1Price() {
		return option1Price;
	}

	public void setOption1Price(int option1Price) {
		this.option1Price = option1Price;
	}

	public int getOption1Stock() {
		return option1Stock;
	}

	public void setOption1Stock(int option1Stock) {
		this.option1Stock = option1Stock;
	}

	@Override
	public String toString() {
		return "Option1 [option1No=" + option1No + ", itemNo=" + itemNo + ", option1Name=" + option1Name
				+ ", option1Price=" + option1Price + ", option1Stock=" + option1Stock + "]";
	}

	
	
}
