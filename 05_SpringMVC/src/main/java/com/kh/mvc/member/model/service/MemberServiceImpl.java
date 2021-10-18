package com.kh.mvc.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mvc.member.model.dao.MemberDao;
import com.kh.mvc.member.model.vo.Member;

// service 계층의 service class 파일에 @Service annotation 써주기
@Service //@Service("빈 ID를 지정")
public class MemberServiceImpl implements MemberService {
	// @Annotation을 붙이고서 Bean 등록이 필요한데, 기본적으로 component-scan이 되고 있기에 appliacation-context를 통해 주입받기만 하면 된다(new X)
	
	//[6] dao가 선언되어있지 않아서 선언! -> 이후에 create Method! MemberDao.java
	@Autowired
	private MemberDao dao;
	// private MemberDao dao = new MemberDao(); -> Bean 등록 안할시
	
	@Override
	public Member login(String id, String pwd) {
		
		//[6] userId를 넘겨받아 member로
		Member member = dao.findMemberById(id);
		
		return member;
	}
}
