package com.myhome.www.member.service;

import com.myhome.www.member.dto.Member;

public interface MemberService {

	//회원 가입
	int insertMember(RegisterRequest regReq) throws Exception;
	//회원 번호로 조회
	Member selectMemberByNo(int memberNo) throws Exception;
	
	//아이디 중복 체크
	int idCheck(RegisterRequest registerRequest) throws Exception;
}
