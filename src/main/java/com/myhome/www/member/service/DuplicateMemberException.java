package com.myhome.www.member.service;

public class DuplicateMemberException extends RuntimeException {

	public DuplicateMemberException(String message) {
		super(message);
	}

}
