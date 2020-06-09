package com.myhome.www.controller;
import java.awt.image.BufferedImage;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.myhome.www.item.dto.CrawlingItem;
import com.myhome.www.item.service.ItemService;
import com.myhome.www.item.service.impl.ItemServiceImpl;

public class CrawlingParser {
	
	//ItemService itemService = new ItemServiceImpl();
	
	@Autowired
	private ItemService itemService;
	
	
	private static final String SAVE_PATH = "c:/upload/";
	private static final String THUMBNAIL_PATH = SAVE_PATH + "/thumb/";
	private static final String PREFIX_IMG_URL = "/upload/"; 	//원본이미지
	private static final String PREFIX_URL = "/upload/thumb/";  //썸네일이미지
	

	public void naver_top_news() throws Exception {
		//categorie_no = 1
//		String url = "https://www.decoview.co.kr/product/list.html?cate_no=12";
		String url = "https://www.decoview.co.kr/category/%EC%87%BC%ED%8C%8C%EC%B9%A8%EB%8C%80/1331/";
		Document doc = Jsoup.connect(url).get();
		Elements a = doc.select("section");
		Elements contentUl = null;
		String str = "";
		//List<CrawlingItem> cralingItem = null;
		for (Element el : a) {
			if("mst_basic_products".equals(el.attr("id"))) {
				contentUl = el.select("ul");
			}
		}
		Elements contentLi = contentUl.select("li");
		for (Element li : contentLi) {
			String imgUrl = li.getElementsByClass("thumbnail").select("img").attr("src");
			if(!"".equals(imgUrl)) {
				imgUrl = "https:"+imgUrl;
				URL imgPath = new URL(imgUrl);
				BufferedImage jpg = ImageIO.read(imgPath);
				
				String saveFileName = genSaveFileName();
				File file = new File(SAVE_PATH + saveFileName);
				File thumbFile = new File(THUMBNAIL_PATH + saveFileName);
				ImageIO.write(jpg, "jpg", file);
				ImageIO.write(jpg, "jpg", thumbFile);
				
				//상품명
				String nameStr = li.getElementsByClass("product_title").text();
				//가격
				String price1 = li.getElementsByClass("custom_price").text();
				String price2 = price1.replace(",", "");
				String priceStr = price2.replace("원", "");
				
				//뽑히나 확인
				//str += imgUrl + " : " + nameStr + " : " + priceStr;
				//str += "\r\n";
				
				//객체에 담아서 디비에 저장할꺼임
				CrawlingItem c = new CrawlingItem();
				c.setItemName(nameStr);
				UUID one = UUID.randomUUID();
				c.setItemCode(one.toString());
				c.setPrice(Integer.parseInt(priceStr));
				c.setCategorieNo(1);
				c.setImgUrl(PREFIX_IMG_URL + saveFileName);
				c.setThumbUrl(PREFIX_URL + saveFileName);
				c.setIsThumb(1);
				System.out.println(c);
				System.out.println(itemService);
				itemService.insertCrawlingItem(c);
				//cralingItem.add(c);
			}
		}

		//BufferedWriter br = new BufferedWriter( new OutputStreamWriter(new
		//FileOutputStream("d:\\seohee\\crawl.txt"))); br.write(str); br.close();
		
		//categorie_no = 2
//		String url = "https://www.decoview.co.kr/product/list.html?cate_no=4";
//		Document doc = Jsoup.connect(url).get();
//		Elements a = doc.select("section");
//		Elements contentUl = null;
//		String str = "";
//		//List<CrawlingItem> cralingItem = null;
//		for (Element el : a) {
//			if("mst_basic_products".equals(el.attr("id"))) {
//				contentUl = el.select("ul");
//			}
//		}
//		Elements contentLi = contentUl.select("li");
//		for (Element li : contentLi) {
//			String imgUrl = li.getElementsByClass("thumbnail").select("img").attr("src");
//			if(!"".equals(imgUrl)) {
//				imgUrl = "https:"+imgUrl;
//				URL imgPath = new URL(imgUrl);
//				BufferedImage jpg = ImageIO.read(imgPath);
//				
//				String saveFileName = genSaveFileName();
//				File file = new File(SAVE_PATH + saveFileName);
//				File thumbFile = new File(THUMBNAIL_PATH + saveFileName);
//				ImageIO.write(jpg, "jpg", file);
//				ImageIO.write(jpg, "jpg", thumbFile);
//				
//				//상품명
//				String nameStr = li.getElementsByClass("product_title").text();
//				//가격
//				String price1 = li.getElementsByClass("custom_price").text();
//				String price2 = price1.replace(",", "");
//				String priceStr = price2.replace("원", "");
//				
//				//뽑히나 확인
//				//str += imgUrl + " : " + nameStr + " : " + priceStr;
//				//str += "\r\n";
//				
//				//객체에 담아서 디비에 저장할꺼임
//				CrawlingItem c = new CrawlingItem();
//				c.setItemName(nameStr);
//				UUID one = UUID.randomUUID();
//				c.setItemCode(one.toString());
//				c.setPrice(Integer.parseInt(priceStr));
//				c.setCategorieNo(2);
//				c.setImgUrl(PREFIX_IMG_URL + saveFileName);
//				c.setThumbUrl(PREFIX_URL + saveFileName);
//				c.setIsThumb(1);
//				System.out.println(c);
//				System.out.println(itemService);
//				itemService.insertCrawlingItem(c);
//				//cralingItem.add(c);
//			}
//		}
		
		//categorie_no = 3
		//String url = "https://www.decoview.co.kr/product/list.html?cate_no=7";
//		String url = "https://www.decoview.co.kr/product/list.html?cate_no=122";
//		Document doc = Jsoup.connect(url).get();
//		Elements a = doc.select("section");
//		Elements contentUl = null;
//		String str = "";
//		//List<CrawlingItem> cralingItem = null;
//		for (Element el : a) {
//			if("mst_basic_products".equals(el.attr("id"))) {
//				contentUl = el.select("ul");
//			}
//		}
//		Elements contentLi = contentUl.select("li");
//		for (Element li : contentLi) {
//			String imgUrl = li.getElementsByClass("thumbnail").select("img").attr("src");
//			if(!"".equals(imgUrl)) {
//				imgUrl = "https:"+imgUrl;
//				URL imgPath = new URL(imgUrl);
//				BufferedImage jpg = ImageIO.read(imgPath);
//				
//				String saveFileName = genSaveFileName();
//				File file = new File(SAVE_PATH + saveFileName);
//				File thumbFile = new File(THUMBNAIL_PATH + saveFileName);
//				ImageIO.write(jpg, "jpg", file);
//				ImageIO.write(jpg, "jpg", thumbFile);
//				
//				//상품명
//				String nameStr = li.getElementsByClass("product_title").text();
//				//가격
//				String price1 = li.getElementsByClass("custom_price").text();
//				String price2 = price1.replace(",", "");
//				String priceStr = price2.replace("원", "");
//				
//				//뽑히나 확인
//				//str += imgUrl + " : " + nameStr + " : " + priceStr;
//				//str += "\r\n";
//				
//				//객체에 담아서 디비에 저장할꺼임
//				CrawlingItem c = new CrawlingItem();
//				c.setItemName(nameStr);
//				UUID one = UUID.randomUUID();
//				c.setItemCode(one.toString());
//				c.setPrice(Integer.parseInt(priceStr));
//				c.setCategorieNo(3);
//				c.setImgUrl(PREFIX_IMG_URL + saveFileName);
//				c.setThumbUrl(PREFIX_URL + saveFileName);
//				c.setIsThumb(1);
//				System.out.println(c);
//				System.out.println(itemService);
//				itemService.insertCrawlingItem(c);
//				//cralingItem.add(c);
//			}
//		}
		
		//categorie_no = 4
//		String url = "https://www.decoview.co.kr/product/list.html?cate_no=1362";
//		String url = "https://www.decoview.co.kr/category/%EC%9B%94%EB%8D%B0%EC%BD%94%EC%9E%A5%EC%8B%9D/1366/";
//		Document doc = Jsoup.connect(url).get();
//		Elements a = doc.select("section");
//		Elements contentUl = null;
//		//List<CrawlingItem> cralingItem = null;
//		for (Element el : a) {
//			if("mst_basic_products".equals(el.attr("id"))) {
//				contentUl = el.select("ul");
//			}
//		}
//		Elements contentLi = contentUl.select("li");
//		for (Element li : contentLi) {
//			String imgUrl = li.getElementsByClass("thumbnail").select("img").attr("src");
//			if(!"".equals(imgUrl)) {
//				imgUrl = "https:"+imgUrl;
//				URL imgPath = new URL(imgUrl);
//				BufferedImage jpg = ImageIO.read(imgPath);
//				
//				String saveFileName = genSaveFileName();
//				File file = new File(SAVE_PATH + saveFileName);
//				File thumbFile = new File(THUMBNAIL_PATH + saveFileName);
//				ImageIO.write(jpg, "jpg", file);
//				ImageIO.write(jpg, "jpg", thumbFile);
//				
//				//상품명
//				String nameStr = li.getElementsByClass("product_title").text();
//				//가격
//				String price1 = li.getElementsByClass("custom_price").text();
//				String price2 = price1.replace(",", "");
//				String priceStr = price2.replace("원", "");
//				
//				//뽑히나 확인
//				//str += imgUrl + " : " + nameStr + " : " + priceStr;
//				//str += "\r\n";
//				
//				//객체에 담아서 디비에 저장할꺼임
//				CrawlingItem c = new CrawlingItem();
//				c.setItemName(nameStr);
//				UUID one = UUID.randomUUID();
//				c.setItemCode(one.toString());
//				c.setPrice(Integer.parseInt(priceStr));
//				c.setCategorieNo(4);
//				c.setImgUrl(PREFIX_IMG_URL + saveFileName);
//				c.setThumbUrl(PREFIX_URL + saveFileName);
//				c.setIsThumb(1);
//				System.out.println(c);
//				System.out.println(itemService);
//				itemService.insertCrawlingItem(c);
//				//cralingItem.add(c);
//			}
//		}
		
		//categorie_no = 5
//		String url5 = "https://www.decoview.co.kr/category/%EC%A3%BC%EB%B0%A9%EA%B0%80%EC%A0%84/1477/";
//		Document doc5 = Jsoup.connect(url5).get();
//		Elements a5 = doc5.select("section");
//		Elements contentUl5 = null;
//		//List<CrawlingItem> cralingItem = null;
//		for (Element el : a5) {
//			if("mst_basic_products".equals(el.attr("id"))) {
//				contentUl5 = el.select("ul");
//			}
//		}
//		Elements contentLi5 = contentUl5.select("li");
//		for (Element li : contentLi5) {
//			String imgUrl = li.getElementsByClass("thumbnail").select("img").attr("src");
//			if(!"".equals(imgUrl)) {
//				imgUrl = "https:"+imgUrl;
//				URL imgPath = new URL(imgUrl);
//				BufferedImage jpg = ImageIO.read(imgPath);
//				
//				String saveFileName = genSaveFileName();
//				File file = new File(SAVE_PATH + saveFileName);
//				File thumbFile = new File(THUMBNAIL_PATH + saveFileName);
//				ImageIO.write(jpg, "jpg", file);
//				ImageIO.write(jpg, "jpg", thumbFile);
//				
//				//상품명
//				String nameStr = li.getElementsByClass("product_title").text();
//				//가격
//				String price1 = li.getElementsByClass("custom_price").text();
//				String price2 = price1.replace(",", "");
//				String priceStr = price2.replace("원", "");
//				
//				//뽑히나 확인
//				//str += imgUrl + " : " + nameStr + " : " + priceStr;
//				//str += "\r\n";
//				
//				//객체에 담아서 디비에 저장할꺼임
//				CrawlingItem c = new CrawlingItem();
//				c.setItemName(nameStr);
//				UUID one = UUID.randomUUID();
//				c.setItemCode(one.toString());
//				c.setPrice(Integer.parseInt(priceStr));
//				c.setCategorieNo(5);
//				c.setImgUrl(PREFIX_IMG_URL + saveFileName);
//				c.setThumbUrl(PREFIX_URL + saveFileName);
//				c.setIsThumb(1);
//				System.out.println(c);
//				System.out.println(itemService);
//				itemService.insertCrawlingItem(c);
//				//cralingItem.add(c);
//			}
//		}
		
//		//categorie_no = 6
//		String url6 = "https://www.decoview.co.kr/product/list.html?cate_no=1476";
//		Document doc6 = Jsoup.connect(url6).get();
//		Elements a6 = doc6.select("section");
//		Elements contentUl6 = null;
//		//List<CrawlingItem> cralingItem = null;
//		for (Element el : a6) {
//			if("mst_basic_products".equals(el.attr("id"))) {
//				contentUl6 = el.select("ul");
//			}
//		}
//		Elements contentLi6 = contentUl6.select("li");
//		for (Element li : contentLi6) {
//			String imgUrl = li.getElementsByClass("thumbnail").select("img").attr("src");
//			if(!"".equals(imgUrl)) {
//				imgUrl = "https:"+imgUrl;
//				URL imgPath = new URL(imgUrl);
//				BufferedImage jpg = ImageIO.read(imgPath);
//				
//				String saveFileName = genSaveFileName();
//				File file = new File(SAVE_PATH + saveFileName);
//				File thumbFile = new File(THUMBNAIL_PATH + saveFileName);
//				ImageIO.write(jpg, "jpg", file);
//				ImageIO.write(jpg, "jpg", thumbFile);
//				
//				//상품명
//				String nameStr = li.getElementsByClass("product_title").text();
//				//가격
//				String price1 = li.getElementsByClass("custom_price").text();
//				String price2 = price1.replace(",", "");
//				String priceStr = price2.replace("원", "");
//				
//				//뽑히나 확인
//				//str += imgUrl + " : " + nameStr + " : " + priceStr;
//				//str += "\r\n";
//				
//				//객체에 담아서 디비에 저장할꺼임
//				CrawlingItem c = new CrawlingItem();
//				c.setItemName(nameStr);
//				UUID one = UUID.randomUUID();
//				c.setItemCode(one.toString());
//				c.setPrice(Integer.parseInt(priceStr));
//				c.setCategorieNo(6);
//				c.setImgUrl(PREFIX_IMG_URL + saveFileName);
//				c.setThumbUrl(PREFIX_URL + saveFileName);
//				c.setIsThumb(1);
//				System.out.println(c);
//				System.out.println(itemService);
//				itemService.insertCrawlingItem(c);
//				//cralingItem.add(c);
//			}
//		}
		
		//categorie_no = 7
//		String url7 = "https://www.decoview.co.kr/category/%EC%BB%B5%EC%9E%94%ED%8B%B0%EC%BD%94%EC%8A%A4%ED%84%B0/1219/";
//		Document doc7 = Jsoup.connect(url7).get();
//		Elements a7 = doc7.select("section");
//		Elements contentUl7 = null;
//		//List<CrawlingItem> cralingItem = null;
//		for (Element el : a7) {
//			if("mst_basic_products".equals(el.attr("id"))) {
//				contentUl7 = el.select("ul");
//			}
//		}
//		Elements contentLi7 = contentUl7.select("li");
//		for (Element li : contentLi7) {
//			String imgUrl = li.getElementsByClass("thumbnail").select("img").attr("src");
//			if(!"".equals(imgUrl)) {
//				imgUrl = "https:"+imgUrl;
//				URL imgPath = new URL(imgUrl);
//				BufferedImage jpg = ImageIO.read(imgPath);
//				
//				String saveFileName = genSaveFileName();
//				File file = new File(SAVE_PATH + saveFileName);
//				File thumbFile = new File(THUMBNAIL_PATH + saveFileName);
//				ImageIO.write(jpg, "jpg", file);
//				ImageIO.write(jpg, "jpg", thumbFile);
//				
//				//상품명
//				String nameStr = li.getElementsByClass("product_title").text();
//				//가격
//				String price1 = li.getElementsByClass("custom_price").text();
//				String price2 = price1.replace(",", "");
//				String priceStr = price2.replace("원", "");
//				
//				//뽑히나 확인
//				//str += imgUrl + " : " + nameStr + " : " + priceStr;
//				//str += "\r\n";
//				
//				//객체에 담아서 디비에 저장할꺼임
//				CrawlingItem c = new CrawlingItem();
//				c.setItemName(nameStr);
//				UUID one = UUID.randomUUID();
//				c.setItemCode(one.toString());
//				c.setPrice(Integer.parseInt(priceStr));
//				c.setCategorieNo(7);
//				c.setImgUrl(PREFIX_IMG_URL + saveFileName);
//				c.setThumbUrl(PREFIX_URL + saveFileName);
//				c.setIsThumb(1);
//				System.out.println(c);
//				System.out.println(itemService);
//				itemService.insertCrawlingItem(c);
//				//cralingItem.add(c);
//			}
//		}

	}
	
	private static String genSaveFileName() {
		String fileName = "";
		
		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		
		return fileName+".jpg";
	}

	
}
