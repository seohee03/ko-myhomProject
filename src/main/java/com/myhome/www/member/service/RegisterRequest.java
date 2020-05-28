package com.myhome.www.member.service;

public class RegisterRequest {

	private String memberId;
	private String memberPw;
	private String confirmPassword;
	private String memberName;
	//private boolean agree;
	
	public RegisterRequest() {
	}

	public RegisterRequest(String memberId, String memberPw, String confirmPassword, String memberName) {
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.confirmPassword = confirmPassword;
		this.memberName = memberName;

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

	public void setPassword(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setName(String memberName) {
		this.memberName = memberName;
	}


	public boolean isPasswordEqualToConfirmPassword() {
		return memberPw.equals(confirmPassword);
	}
}

