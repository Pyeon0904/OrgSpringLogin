package com.kh.mvc.member.model.service;

import com.kh.mvc.member.model.vo.Member;

public interface MemberService {
	// 인터페이스에는 구현해야할 메소드만 모아놓을 수 있는 장점!
	Member login(String id, String pwd);
	
	
}
