package com.myhome.www.item.dto;

public class ItemImg {
	
	private int imgNo;
	private String imgUrl;
	private String thumbUrl;
	private int isThumb;
	private int itemNo;
	
//	public ItemImg() {
//		// TODO Auto-generated constructor stub
//	}

	public int getImgNo() {
		return imgNo;
	}
	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getThumbUrl() {
		return thumbUrl;
	}
	public void setThumbUrl(String thumbUrl) {
		this.thumbUrl = thumbUrl;
	}
	public int getIsThumb() {
		return isThumb;
	}
	public void setIsThumb(int isThumb) {
		this.isThumb = isThumb;
	}
	public int getItemNo() {
		return itemNo;
	}
	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}
	@Override
	public String toString() {
		return "ItemImg [imgNo=" + imgNo + ", imgUrl=" + imgUrl + ", thumbUrl=" + thumbUrl + ", isThumb=" + isThumb
				+ ", itemNo=" + itemNo + "]";
	}
	
}
