package com.org.orgLogin.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.orgLogin.member.model.dao.MemberDao;
import com.org.orgLogin.member.model.vo.Member;


@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao dao;
	
	@Override
	public Member login(String Id, String Pwd) {
		
		Member member = dao.findMemberById(Id);
		
		return member;
	}
}
