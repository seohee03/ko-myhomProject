package com.myhome.www.member.service;

public interface LoginService {

	AuthInfo authenticate(String memberId, String memberPw) throws Exception;
}
