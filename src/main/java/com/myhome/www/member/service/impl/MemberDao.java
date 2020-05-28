package com.myhome.www.member.service.impl;

import org.apache.ibatis.annotations.Param;

import com.myhome.www.member.dto.Member;

public interface MemberDao {
	
	//회원 아이디로 조회
	Member selecetByMemberId(@Param("key") String key,@Param("memberId") String memberId) throws Exception;
	//회원 등록
	int insertMember(Member member) throws Exception;
	//회원 번호로 조회
	Member selectMemberByNo(int memberNo) throws Exception;

	//아이디 중복 체크
	int idCheck(String memberId) throws Exception;
}
