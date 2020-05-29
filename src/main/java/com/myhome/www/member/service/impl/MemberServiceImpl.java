package com.myhome.www.member.service.impl;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myhome.www.member.dto.Member;
import com.myhome.www.member.service.MemberService;
import com.myhome.www.member.service.RegisterRequest;

@Service("memberService")
@Transactional
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private Environment env;

	@Override
	public int insertMember(RegisterRequest regReq) throws Exception {
		System.out.println("값 넘어오냐>>>>>>> 안넘어옴~~~  넘어와라 >>>>>> service:  " + regReq);
		
		Member member = new Member();
		member.setMemberId(regReq.getMemberId());
		member.setMemberName(regReq.getMemberName());
		member.setMemberPw(regReq.getMemberPw());;
		member.setKey(env.getProperty("key"));
		member.setRegdate(LocalDateTime.now());
		
		return memberDao.insertMember(member);
	}

	@Override
	public Member selectMemberByNo(int memberNo) throws Exception {
		return memberDao.selectMemberByNo(memberNo);
	}

	//아이디 중복체크
	@Override
	public int idCheck(RegisterRequest registerRequest) throws Exception {
		String memberId = registerRequest.getMemberId();
		return memberDao.idCheck(memberId);
	}

}
