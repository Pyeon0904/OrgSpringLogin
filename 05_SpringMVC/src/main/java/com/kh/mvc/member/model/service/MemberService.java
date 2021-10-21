package com.kh.mvc.member.model.service;

import com.kh.mvc.member.model.vo.Member;

public interface MemberService {
	// 인터페이스에는 구현해야할 메소드만 모아놓을 수 있는 장점!
	Member login(String id, String pwd);

	int save(Member member);
	// 위처럼 interface에 작성이 되면, 실제 구현체인 serviceImpl에서 빨간줄(에러)가 날것이다.
	// 그렇게 되면 serviceImpl에 가서 ctrl+1로 create!
	
}
