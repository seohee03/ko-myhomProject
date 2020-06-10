package com.myhome.www.article.dto;

import java.time.LocalDateTime;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Article {

	private int articleNo;						//글번호
	private String writerId;					//작성자 id
	private String writerName;					//작성자 이름
	private String articleTitle;				//글제목
	private String articleContent;				//글내용
	private LocalDateTime regdate;						//작성일
	private LocalDateTime moddate;						//수정일
	private String articleImgUrl;				//이미지저장 경로
	private String articleThumbUrl;				//썸네일이미지 저장 경로
	private MultipartFile multipartFile;		//업로드 파일
	private int readCount;						//조회수
	private int startIndex;						//페이지 시작 글
	private int cntPerPage;						//페이지 수
	
	@Override
	public String toString() {
		return "Article [articleNo=" + articleNo + ", writerId=" + writerId + ", writerName=" + writerName
				+ ", articleTitle=" + articleTitle + ", articleContent=" + articleContent + ", regdate=" + regdate
				+ ", moddate=" + moddate + ", articleImgUrl=" + articleImgUrl + ", articleThumbUrl=" + articleThumbUrl
				+ ", multipartFile=" + multipartFile + ", readCount=" + readCount + ", startIndex=" + startIndex
				+ ", cntPerPage=" + cntPerPage + "]";
	}

}
