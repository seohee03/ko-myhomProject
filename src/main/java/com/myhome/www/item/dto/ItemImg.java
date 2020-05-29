package com.myhome.www.item.dto;

public class ItemImg {
	
	private int imgNo;
	private int itemNo;
	private String imgName;
	
//	public ItemImg() {
//		// TODO Auto-generated constructor stub
//	}
//
//	public ItemImg(int itemNo, String imgName) {
//		this.itemNo = itemNo;
//		this.imgName = imgName;
//	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	@Override
	public String toString() {
		return "ItemImg [imgNo=" + imgNo + ", itemNo=" + itemNo + ", imgName=" + imgName + "]";
	}
	
}
