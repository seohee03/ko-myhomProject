package com.myhome.www.member.service.impl;

import java.time.LocalDateTime;
import java.util.List;

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

	//회원 등록
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

	//번호로 회원 조회
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
	
	//회원 리스트 조회
	@Override
	public List<Member> selectMemberList(Member member) throws Exception {
		System.out.println(">>>>서비스 진입");
		return memberDao.selectMemberList(member);
	}

	//회원 수정
	@Override
	public int updateMember(Member member) throws Exception {
		System.out.println(">>>>서비스 진입");
		return memberDao.updateMember(member);
	}
	
	/****************************************************************/
	//회원 삭제
	@Override
	public int deleteMember(int memberNo) throws Exception {
		System.out.println(">>>>서비스 진입");
		System.out.println("memberNo"+memberNo);
		return memberDao.deleteMember(memberNo);
	}
	//전체 회원 조회
		@Override
		public int selectAllCount() throws Exception {
			return memberDao.selectAllCount();
		}
	}
