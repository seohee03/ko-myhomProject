package com.myhome.www.item.service.impl;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.myhome.www.item.dto.CrawlingItem;
import com.myhome.www.item.dto.Item;
import com.myhome.www.item.dto.ItemImg;
import com.myhome.www.item.dto.Option1;
import com.myhome.www.item.dto.Option2;
import com.myhome.www.item.service.ItemCommand;
import com.myhome.www.item.service.ItemPage;
import com.myhome.www.item.service.ItemPageSize;
import com.myhome.www.item.service.ItemService;
import com.myhome.www.util.FileUtil;

@Service("itemService")
@Transactional
public class ItemServiceImpl implements ItemService{
	
	@Autowired
	private ItemDao itemDao;
	
	private static final String SAVE_PATH = "c:/upload";
	private static final String THUMBNAIL_PATH = SAVE_PATH + "/thumb";
	private static final String PREFIX_IMG_URL = "/upload/"; 	//원본이미지
	private static final String PREFIX_URL = "/upload/thumb/";  //썸네일이미지
	
	//상품 조회
	@Override
	public List<ItemCommand> selectItemForIndex() throws Exception {
		return itemDao.selectItemForIndex();
	}
	
	//상품 전체 리스트
	@Override
	public ItemPage getItemPage(int pageNum) throws Exception {
		//상품 등록된 아이템 리스트 수
		int total = itemDao.selectCount();
		//한페이지 당 아이템 3개씩 출력
		ItemPageSize itemPageSize = new ItemPageSize(20, (pageNum-1)*20);
		//limit sql문을 이용해 등록글 3개씩 가져온다
		List<ItemCommand> content = itemDao.selectItemList(itemPageSize);
		//총 등록글 수, 현재페이지, 한 페이지 당 등록글 수, 등록글을 넘겨준다 
		return new ItemPage(total, pageNum, 3, content);
	}
		
	//상품 업로드
	@Override
	public int insertItem(ItemCommand itemCommand) throws Exception{

		int thimgRs = 0; int imgRs = 0; int itemRs = 0;
		int option1Rs = 0; int option2Rs = 0;
		
		try {
			String originFilename = null; //0.jpg
			String extName = null; //.jpg
			Long size = 0L;
			String saveFileName = null; //저장할 파일이름 : 202053113519875.jpg
			
			UUID one = UUID.randomUUID();
			itemCommand.getItem().setItemCode(one.toString());
			
			Item item = new Item();
			item.setCategorieNo(itemCommand.getItem().getCategorieNo());
			item.setItemCode(itemCommand.getItem().getItemCode());
			item.setItemName(itemCommand.getItem().getItemName());
			item.setItemDetail(itemCommand.getItem().getItemDetail());
			item.setPrice(itemCommand.getItem().getPrice());
			item.setStock(itemCommand.getItem().getStock());
			item.setItemRegDateTime(LocalDateTime.now());
			itemRs = itemDao.insertItem(item);
		
			Option1 option1 = new Option1();
			option1.setItemNo(item.getItemNo());
			option1.setOption1Name(itemCommand.getOption1().getOption1Name());
			option1.setOption1Price(itemCommand.getOption1().getOption1Price());
			option1.setOption1Stock(itemCommand.getOption1().getOption1Stock());
			option1Rs = itemDao.insertOption1(option1);
				
			Option2 option2 = new Option2();
			option2.setOption1No(option1.getOption1No());
			option2.setOption2Name(itemCommand.getOption2().getOption2Name()); 
			option2.setOption2Price(itemCommand.getOption2().getOption2Price());
			option2.setOption2Stock(itemCommand.getOption2().getOption2Stock());
			option2Rs = itemDao.insertOption2(option2);
			
			for(int i=0; i<itemCommand.getFiles().length; i++ ) {
				
				if(itemCommand.getFiles()[i].getOriginalFilename()!=null && !itemCommand.getFiles()[i].getOriginalFilename().isEmpty()) {
					//파일 정보
					originFilename = itemCommand.getFiles()[i].getOriginalFilename();
					extName	= originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
					size = itemCommand.getFiles()[i].getSize();
					//파일 이름 설정
					saveFileName = genSaveFileName(extName);
	
					//파일 저장 메소드
					if(i==0) {
						writeThumbFile(itemCommand.getFiles()[i], saveFileName);
						ItemImg itemImg = new ItemImg();
						itemImg.setImgUrl(PREFIX_IMG_URL + saveFileName);
						itemImg.setThumbUrl(PREFIX_URL + saveFileName);
						itemImg.setIsThumb(1);
						itemImg.setItemNo(item.getItemNo());
						thimgRs = itemDao.insertItemImg(itemImg);
					}else {
						writeFile(itemCommand.getFiles()[i], saveFileName);
						ItemImg itemImg = new ItemImg();
						itemImg.setImgUrl(PREFIX_IMG_URL + saveFileName);
						itemImg.setIsThumb(0);
						itemImg.setItemNo(item.getItemNo());
						imgRs = itemDao.insertItemImg(itemImg);
					}
				}else {
					System.out.println("file이 없어 ㅋㅋ");
				}
			}
		}catch (IOException e) {
			System.out.println("상품 업로드 익셉션: " + e.getMessage());
			// 원래라면 RuntimeException 을 상속받은 예외가 처리되어야 하지만
			// 편의상 RuntimeException을 던진다.
			// throw new FileUploadException();	
			throw new RuntimeException(e);
		}
		return thimgRs + imgRs + itemRs + option1Rs + option2Rs;
	}

	//수정 폼(아이템 번호로 각 항목마다 전에 등록했던 상품 내용 출력) 
	public ItemCommand selectItemByItemNo(int itemNo) throws Exception {
		return itemDao.selectItemByItemNo(itemNo);
	}
		
	@Override
	public int updateItem(ItemCommand itemCommand) throws Exception{

		int thimgRs = 0; int imgRs = 0; int itemRs = 0;
		int option1Rs = 0; int option2Rs = 0;
		
		try {
			String originFilename = null; //0.jpg
			String extName = null; //.jpg
			Long size = 0L;
			String saveFileName = null; //저장할 파일이름 : 202053113519875.jpg	
			
			//아이템 수정
			Item item = new Item();
			item.setItemNo(itemCommand.getItem().getItemNo());
			item.setCategorieNo(itemCommand.getItem().getCategorieNo());
			item.setItemName(itemCommand.getItem().getItemName());
			item.setItemDetail(itemCommand.getItem().getItemDetail());
			item.setPrice(itemCommand.getItem().getPrice());
			item.setStock(itemCommand.getItem().getStock());
			itemRs = itemDao.updateItem(item);
			//옵션1 수정
			Option1 option1 = new Option1();
			option1.setItemNo(itemCommand.getItem().getItemNo());
			option1.setOption1Name(itemCommand.getOption1().getOption1Name());
			option1.setOption1Price(itemCommand.getOption1().getOption1Price());
			option1.setOption1Stock(itemCommand.getOption1().getOption1Stock());
			option1Rs = itemDao.updateOption1(option1);
			//옵션2 수정
			Option2 option2 = new Option2();
			int option1No = itemDao.selectOption1ByItemNo(itemCommand.getItem().getItemNo()).getOption1No();
			option2.setOption1No(option1No);
			option2.setOption2Name(itemCommand.getOption2().getOption2Name()); 
			option2.setOption2Price(itemCommand.getOption2().getOption2Price());
			option2.setOption2Stock(itemCommand.getOption2().getOption2Stock());
			option2Rs = itemDao.updateOption2(option2);
			
			//이미지 삭제
			itemDao.deleteImg(item.getItemNo());
	
			for(int i=0; i<itemCommand.getFiles().length; i++ ) {
				
				if(itemCommand.getFiles()[i].getOriginalFilename()!=null && !itemCommand.getFiles()[i].getOriginalFilename().isEmpty()) {
					//파일 정보
					originFilename = itemCommand.getFiles()[i].getOriginalFilename();
					extName	= originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
					size = itemCommand.getFiles()[i].getSize();
					//파일 이름 설정
					saveFileName = genSaveFileName(extName);
	
					//파일 저장 메소드
					if(i==0) {
						writeThumbFile(itemCommand.getFiles()[i], saveFileName);
						ItemImg itemImg = new ItemImg();
						itemImg.setImgUrl(PREFIX_IMG_URL + saveFileName);
						itemImg.setThumbUrl(PREFIX_URL + saveFileName);
						itemImg.setIsThumb(1);
						itemImg.setItemNo(item.getItemNo());
						thimgRs = itemDao.insertItemImg(itemImg);
					}else {
						writeFile(itemCommand.getFiles()[i], saveFileName);
						ItemImg itemImg = new ItemImg();
						itemImg.setImgUrl(PREFIX_IMG_URL + saveFileName);
						itemImg.setIsThumb(0);
						itemImg.setItemNo(item.getItemNo());
						imgRs = itemDao.insertItemImg(itemImg);
					}
				}else {
					System.out.println("file이 없어 ㅋㅋ");
				}
			}
		}catch (IOException e) {
			System.out.println("상품 업로드 익셉션: " + e.getMessage());
			throw new RuntimeException(e);
		}
		return thimgRs + imgRs + itemRs + option1Rs + option2Rs;
	}

	//상품 삭제
	@Override
	public int itemDelete(ItemCommand itemCommand) throws Exception {
		int optionRs = 0;
		int itemNo = itemCommand.getItem().getItemNo();
		//아이템 삭제
		int itemRs = itemDao.deleteItem(itemNo);
		if(itemCommand.getOption1() != null && itemCommand.getOption2() != null) {
			//옵션1, 옵션2 삭제
			optionRs = itemDao.deleteOption(itemNo);
		}
		//이미지 삭제
		int itemImgRs = itemDao.deleteImg(itemNo);
		return itemRs + optionRs + itemImgRs;
	}
	
	//thumb외에 img 저장하는 메소드
		private void writeFile(MultipartFile multipartFile, String saveFileName) throws IllegalStateException, IOException{
			String filePath = SAVE_PATH + "/" + saveFileName; // c:/upload/202053113519875.jpg
			String thumbfilePath = THUMBNAIL_PATH + "/" + saveFileName; //  c:/upload/thumb/202053113519875.jpg
			
			File file = new File(filePath);
			multipartFile.transferTo(file);
			
			//Image Crop & Resize...
	        try {
				FileUtil.imageResize(filePath, thumbfilePath, "jpg");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//thumb 저장하는 메서드
		private void writeThumbFile(MultipartFile multipartFile, String saveFileName) throws IOException{
			String filePath = SAVE_PATH + "/" + saveFileName;
			String thumbfilePath = THUMBNAIL_PATH + "/" + saveFileName;
				
			File file = new File(filePath);
			multipartFile.transferTo(file);
				
			//Image Crop & Resize...
		    try {
				FileUtil.imageResize(filePath, thumbfilePath, "jpg");
		    } catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		private String genSaveFileName(String extName) {
			String fileName = "";
			
			Calendar calendar = Calendar.getInstance();
			fileName += calendar.get(Calendar.YEAR);
			fileName += calendar.get(Calendar.MONTH);
			fileName += calendar.get(Calendar.DATE);
			fileName += calendar.get(Calendar.HOUR);
			fileName += calendar.get(Calendar.MINUTE);
			fileName += calendar.get(Calendar.SECOND);
			fileName += calendar.get(Calendar.MILLISECOND);
			fileName += extName;
			
			return fileName;
		}

	

	
	
	//키워드로 상품 조회
	@Override
	public List<ItemCommand> selectSearchItemList(String keyword) throws Exception {
		return itemDao.selectSearchItemList(keyword);
	}

	//카테고리번호로 상품 개수 조회
	@Override
	public int selectCountByCategorieNo(int categorieNo) throws Exception {
		return itemDao.selectCountByCategorieNo(categorieNo);
	}

	//카테고리 번호별 상품 조회
	@Override
	public List<ItemCommand> selectItemByCategoryNo(Item item) throws Exception{
		return itemDao.selectItemByCategoryNo(item);
	}

	//크롤링으로 상품 등록
	@Override
	public void insertCrawlingItem(CrawlingItem crawlingItem) throws Exception {
		
		Item item = new Item();
		item.setCategorieNo(crawlingItem.getCategorieNo());
		item.setItemCode(crawlingItem.getItemCode());
		item.setItemName(crawlingItem.getItemName());
		item.setItemDetail("a");
		item.setStock(0);
		item.setPrice(crawlingItem.getPrice());
		item.setItemRegDateTime(LocalDateTime.now());
		itemDao.insertItem(item);
		
		ItemImg itemImg = new ItemImg();
		itemImg.setImgUrl(crawlingItem.getImgUrl());
		itemImg.setThumbUrl(crawlingItem.getThumbUrl());
		itemImg.setIsThumb(crawlingItem.getIsThumb());
		itemImg.setItemNo(item.getItemNo());
		itemDao.insertItemImg(itemImg);
	}

	//아이템 이미지 리스트
	@Override
	public List<ItemImg> selectItemImgByItemNo(int itemNo) throws Exception {
		return itemDao.selectItemImgByItemNo(itemNo);
	}

	
	
	
}
