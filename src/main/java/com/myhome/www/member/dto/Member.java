package com.myhome.www.member.dto;

import java.time.LocalDateTime;

public class Member {

	private int memberNo;			//회원 번호
	private String memberId;		//회원 아이디
	private String memberName;		//회원 이름	
	private String memberPw;		//회원 비밀번호
	private LocalDateTime regdate;	//가입날짜
	private String power;			//권한
	private boolean agree;			//동의여부(사용안함)
	private String key;				//비밀번호 복호화 키
	private int startIndex;
	private int cntPerPage;

//	public Member(String memberId, String name, String memberPw, LocalDateTime regdate) {
//		this.memberId = memberId;
//		this.name = name;
//		this.memberPw = memberPw;
//		this.regdate = regdate;
//	}

	
	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public LocalDateTime getRegdate() {
		return regdate;
	}

	public String getPower() {
		return power;
	}

	public void setPower(String power) {
		this.power = power;
	}
	
	

//	public void changePassword(String oldPassword, String newPassword) {
//		if (!memberPw.equals(oldPassword))
//			throw new WrongIdPasswordException();
//		this.memberPw = newPassword;
//	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public void setRegdate(LocalDateTime regdate) {
		this.regdate = regdate;
	}

	public boolean isAgree() {
		return agree;
	}

	public void setAgree(boolean agree) {
		this.agree = agree;
	}

	public boolean matchPassword(String memberPw) {
		return this.memberPw.equals(memberPw);
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	
}
