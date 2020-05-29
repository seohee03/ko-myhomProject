package com.myhome.www.article.dto;

import java.time.LocalDateTime;
import java.util.Date;

public class Article {

	private int articleNo;
	private String writerId;
	private String writerName;
	private String articleTitle;
	private String articleContent;
	private LocalDateTime regdate;
	private LocalDateTime moddate;
	private int readCount;
	
	public Article() {
	}
	
//	public Article(String writerId, String articleTitle, 
//			String articleContent) {
//		this.writerId = writerId;
//		this.articleTitle = articleTitle;
//		this.articleContent = articleContent;
//	}
	
	public Article(int articleNo, String writerId, String writerName, String articleTitle, 
			String articleContent, LocalDateTime regdate, LocalDateTime moddate, int readCount) {
		this.articleNo = articleNo;
		this.writerId = writerId;
		this.writerName = writerName;
		this.articleTitle = articleTitle;
		this.articleContent = articleContent;
		this.regdate = regdate;
		this.moddate = moddate;
		this.readCount = readCount;
	}

	public String getArticleContent() {
		return articleContent;
	}

	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}

	public int getArticleNo() {
		return articleNo;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}

	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}

	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}

	public void setRegdate(LocalDateTime regdate) {
		this.regdate = regdate;
	}

	public void setModdate(LocalDateTime moddate) {
		this.moddate = moddate;
	}

	public void setReadcount(int readCount) {
		this.readCount = readCount;
	}

	public String getArticleTitle() {
		return articleTitle;
	}

	public LocalDateTime getRegdate() {
		return regdate;
	}

	public LocalDateTime getModdate() {
		return moddate;
	}

	public int getReadCount() {
		return readCount;
	}

	@Override
	public String toString() {
		return "Article [articleNo=" + articleNo + ", writerId=" + writerId + ", writerName=" + writerName + ", articleTitle="
				+ articleTitle + ", articleContent=" + articleContent + ", regdate=" + regdate + ", moddate=" + moddate
				+ ", readCount=" + readCount + "]";
	}
}
