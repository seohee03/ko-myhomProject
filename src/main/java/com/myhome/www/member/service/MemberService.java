package com.myhome.www.member.service;

import java.util.List;

import com.myhome.www.member.dto.Member;

public interface MemberService {

	//회원 가입
	int insertMember(RegisterRequest regReq) throws Exception;
	//회원 번호로 조회
	Member selectMemberByNo(int memberNo) throws Exception;
	//회원 출력
	List<Member> selectMemberList(Member memeber) throws Exception;
	//회원 수정
	int updateMember(Member member) throws Exception;
	//회원 삭제
	int deleteMember(int memberNo) throws Exception;
	//아이디 중복 체크
	int idCheck(RegisterRequest registerRequest) throws Exception;
	//전체 회원수 조회
	int selectAllCount() throws Exception;
}
