package com.myhome.www.item.service;

import com.myhome.www.item.dto.Categorie;
import com.myhome.www.item.dto.Item;
import com.myhome.www.item.dto.ItemImg;
import com.myhome.www.item.dto.Option1;
import com.myhome.www.item.dto.Option2;

public class ItemCommand {
	
	private Item item;
	private Option1 option1;
	private Option2 option2;
	private Categorie categorie;
	private ItemImg itemImg;
	
	public ItemCommand() {
		// TODO Auto-generated constructor stub
	}
	
	public ItemCommand(Item item, Option1 option1, Option2 option2, Categorie categorie, ItemImg itemImg) {
		this.item = item;
		this.option1 = option1;
		this.option2 = option2;
		this.categorie = categorie;
		this.itemImg = itemImg;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public Option1 getOption1() {
		return option1;
	}

	public void setOption1(Option1 option1) {
		this.option1 = option1;
	}

	public Option2 getOption2() {
		return option2;
	}

	public void setOption2(Option2 option2) {
		this.option2 = option2;
	}

	public Categorie getCategorie() {
		return categorie;
	}

	public void setCategorie(Categorie categorie) {
		this.categorie = categorie;
	}

	public ItemImg getItemImg() {
		return itemImg;
	}

	public void setItemImg(ItemImg itemImg) {
		this.itemImg = itemImg;
	}

	@Override
	public String toString() {
		return "ItemCommand [item=" + item + ", option1=" + option1 + ", option2=" + option2 + ", categorie="
				+ categorie + ", itemImg=" + itemImg + "]";
	}
	
}
