package com.myhome.www.item.service;

public class ItemPageSize {
	
	private int size;
	private int startRow;
	
	public ItemPageSize(int size, int startRow) {
		super();
		this.size = size;
		this.startRow = startRow;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	
	
}
