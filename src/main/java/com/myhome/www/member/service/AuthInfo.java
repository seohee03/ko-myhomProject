package com.myhome.www.member.service;

public class AuthInfo {
	
	private int memberNo;
	private String memberId;
	private String memberName;
	private String power;

	public AuthInfo(int memberNo, String memberId, String memberName, String power) {
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberName = memberName;
		this.power = power;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public String getPower() {
		return power;
	}
	
}
