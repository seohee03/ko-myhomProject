package com.myhome.www.article.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.myhome.www.article.dto.Article;
import com.myhome.www.article.service.ArticleService;
import com.myhome.www.util.FileUtil;

@Service("articleService")
@Transactional
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	private ArticleDao articleDao;

//	@Autowired
//	private ArticleMapper ArticleMapper;
	
	// 리눅스 기준으로 파일 경로를 작성 ( 루트 경로인 /으로 시작한다. )
	// upload 폴더를 생성해 놓아야 한다.
	private static final String SAVE_PATH = "c:/upload";
	private static final String THUMBNAIL_PATH = SAVE_PATH +"/thumb";
	private static final String PREFIX_IMG_URL = "/upload/";
	private static final String PREFIX_THUMB_URL = "/upload/thumb/";

	@Override
	public List<Article> selectArticleList(Article article) throws Exception {
		return articleDao.selectArticleList(article);
	}

	@Override
	public int insertArticle(Article article) throws Exception {
		article.setArticleNo(article.getArticleNo());
		return articleDao.insertArticle(article);
	}

	@Override
	public Article selectArticleByNo(int articleNo) throws Exception {
		articleDao.increaseReadCount(articleNo);
		return articleDao.selectArticleByNo(articleNo);
	}

	@Override
	public int updateArticle(Article article) throws Exception {
		return articleDao.updateArticle(article);
	}

	@Override
	public int deleteArticle(Article article) throws Exception {
		System.out.println("============================");
		System.out.println("============================");
		System.out.println("============================");
		System.out.println("============================");
		int articleNo = article.getArticleNo();
		return articleDao.deleteArticle(articleNo);
	}

	public void increaseReadCount(Article article) throws Exception {
		articleDao.increaseReadCount(article.getReadCount());
	}

	@Override
	public int selectLastArticleNo() throws Exception {
		List<Integer> res = articleDao.selectLastArticleNo();
		for (int i : res) {
			System.out.println("=========>" + i);
		}
		if (res.isEmpty()) {
			System.out.println("암껏두 안나옴");
			return 0;
		}
		return res.get(0);

	}

	@Override
	public List<Article> selectSearchArticleList(String keyword) throws Exception {

		return articleDao.selectSearchArticleList(keyword);
	}

	// 검색 타입과 키워드로 게시글 조회
	@Override
	public List<Article> selectSearchTypeArticleList(String searchType, String keyword) throws Exception {

		return articleDao.selectSearchTypeArticleList(searchType, keyword);
	}

	// 전체 글 갯수 조회
	@Override
	public int selectAllCount() throws Exception {
		return articleDao.selectAllCount();
	}

	@Override
	public List<Article> selectArticleByWriterId(String writerId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Article store(Article article) {
		String url = "";
		int result = 0;
		try {
			String originFilename = null;
			String extName = null;
			String saveFileName = null;
			System.out.println('1');
			if (article.getMultipartFile().getOriginalFilename() != null
					&& !article.getMultipartFile().getOriginalFilename().isEmpty()) {
				originFilename = article.getMultipartFile().getOriginalFilename();
				extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
				saveFileName = genSaveFileName(extName);

				writeFile(article.getMultipartFile(), saveFileName);
				article.setArticleImgUrl(PREFIX_IMG_URL + saveFileName);
				article.setArticleThumbUrl(PREFIX_THUMB_URL + saveFileName);
//				Date date = article.getRegdate();
//				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//				article.setRegdate(sdf.format(article.getRegdate()));
				System.out.println(article);
				result = articleDao.insertArticle(article);
				url = PREFIX_THUMB_URL + saveFileName;
			} else {
				System.out.println("file이 없어 ㅋㅋ");
			}
		} catch (Exception e) {
			System.out.println("파일 업로드 익셉션: " + e.getMessage());
			// 원래라면 RuntimeException 을 상속받은 예외가 처리되어야 하지만
			// 편의상 RuntimeException을 던진다.
			// throw new FileUploadException();
			throw new RuntimeException(e);
		}
		return article;
	}

	// 현재 시간을 기준으로 파일 이름 생성
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

	// 파일을 실제로 write 하는 메서드
	private void writeFile(MultipartFile multipartFile, String saveFileName) throws IOException {
		String filePath = SAVE_PATH + "/" + saveFileName;
		String thumbfilePath = THUMBNAIL_PATH + "/" + saveFileName;

//						byte[] data = multipartFile.getBytes();
//						FileOutputStream fos = new FileOutputStream(filePath);
//						fos.write(data);
//						fos.close();

		File file = new File(filePath);
		multipartFile.transferTo(file);

		// Image Crop & Resize...
		try {
			FileUtil.imageResize(filePath, thumbfilePath, "jpg");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
