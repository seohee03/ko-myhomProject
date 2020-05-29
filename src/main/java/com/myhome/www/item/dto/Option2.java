package com.myhome.www.item.dto;


public class Option2 {
	
	private int option2No;
	private int option1No;
	private String option2Name;
	private int option2Price;
	private int option2Stock;
	
//	public Option2() {
//		// TODO Auto-generated constructor stub
//	}
//
//	public Option2(int option1No, String option2Name, int option2Price, int option2Stock) {
//		this.option1No = option1No;
//		this.option2Name = option2Name;
//		this.option2Price = option2Price;
//		this.option2Stock = option2Stock;
//	}

	public int getOption2No() {
		return option2No;
	}

	public void setOption2No(int option2No) {
		this.option2No = option2No;
	}

	public int getOption1No() {
		return option1No;
	}

	public void setOption1No(int option1No) {
		this.option1No = option1No;
	}

	public String getOption2Name() {
		return option2Name;
	}

	public void setOption2Name(String option2Name) {
		this.option2Name = option2Name;
	}

	public int getOption2Price() {
		return option2Price;
	}

	public void setOption2Price(int option2Price) {
		this.option2Price = option2Price;
	}

	public int getOption2Stock() {
		return option2Stock;
	}

	public void setOption2Stock(int option2Stock) {
		this.option2Stock = option2Stock;
	}

	@Override
	public String toString() {
		return "Option2 [option2No=" + option2No + ", option1No=" + option1No + ", option2Name=" + option2Name
				+ ", option2Price=" + option2Price + ", option2Stock=" + option2Stock + "]";
	}
	
	
}
