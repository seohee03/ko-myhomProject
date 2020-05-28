package com.myhome.www.member.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myhome.www.member.dto.Member;
import com.myhome.www.member.service.AuthInfo;
import com.myhome.www.member.service.LoginService;
import com.myhome.www.member.service.WrongIdPasswordException;


@Service("loginService")
@Transactional
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private Environment env;

	@Override
	public AuthInfo authenticate(String memberId, String memberPw) throws Exception{
		Member member = memberDao.selecetByMemberId(env.getProperty("key"), memberId);
		
		if (member == null) {
			throw new WrongIdPasswordException();
		}
		if (!member.matchPassword(memberPw)) {
			throw new WrongIdPasswordException();
		}
		
		AuthInfo authInfo = new AuthInfo(member.getMemberNo(), member.getMemberId(), member.getMemberName(), member.getPower());
		
		return authInfo;
	}

}
