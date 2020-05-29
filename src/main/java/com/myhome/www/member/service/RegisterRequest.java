package com.myhome.www.member.service;

public class RegisterRequest {

	private String memberId;
	private String memberName;
	private String memberPw;
	private String confirmPassword;
	
	//private boolean agree;
	
	public RegisterRequest() {
	}

	public RegisterRequest(String memberId, String memberName, String memberPw, String confirmPassword) {
		super();
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberPw = memberPw;
		this.confirmPassword = confirmPassword;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	@Override
	public String toString() {
		return "RegisterRequest [memberId=" + memberId + ", memberName=" + memberName + ", memberPw=" + memberPw
				+ ", confirmPassword=" + confirmPassword + "]";
	}

	


	
	
}

