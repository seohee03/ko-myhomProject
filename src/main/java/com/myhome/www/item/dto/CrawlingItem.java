package com.myhome.www.item.dto;

public class CrawlingItem {

	private int itemNo;
	private String itemName;
	private String itemCode;
	private int price;
	private int categorieNo;
	private String imgUrl;
	private String thumbUrl;
	private int isThumb;
	
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
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		
		this.itemCode = itemCode ;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCategorieNo() {
		return categorieNo;
	}
	public void setCategorieNo(int categorieNo) {
		this.categorieNo = categorieNo;
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
	@Override
	public String toString() {
		return "CrawlingItem [itemNo=" + itemNo + ", itemName=" + itemName + ", itemCode=" + itemCode + ", price="
				+ price + ", categorieNo=" + categorieNo + ", imgUrl=" + imgUrl + ", thumbUrl=" + thumbUrl
				+ ", isThumb=" + isThumb + "]";
	}
	
	
}
