package com.myhome.www.member.service;

public class LoginCommand {

	private String memberId;
	private String memberPw;
	private boolean rememberId;
	
	

	public LoginCommand() {
	}

	public LoginCommand(String memberId, String memberPw, boolean rememberId) {
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.rememberId = rememberId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberid(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void MemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public boolean isRememberId() {
		return rememberId;
	}

	public void setRememberId(boolean rememberId) {
		this.rememberId = rememberId;
	}
}
