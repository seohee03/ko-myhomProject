package com.myhome.www.item.dto;

public class Categorie {
	
	private int categorieNo;
	private String categorieName;
	
//	public Categorie() {
//		// TODO Auto-generated constructor stub
//	}
//
//	public Categorie(String categorieName) {
//		this.categorieName = categorieName;
//	}

	public int getCategorieNo() {
		return categorieNo;
	}

	public void setCategorieNo(int categorieNo) {
		this.categorieNo = categorieNo;
	}

	public String getCategorieName() {
		return categorieName;
	}

	public void setCategorieName(String categorieName) {
		this.categorieName = categorieName;
	}

	@Override
	public String toString() {
		return "Categorie [categorieNo=" + categorieNo + ", categorieName=" + categorieName + "]";
	}
	
	
}
