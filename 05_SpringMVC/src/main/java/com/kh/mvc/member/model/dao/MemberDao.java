package com.kh.mvc.member.model.dao;

import org.springframework.stereotype.Repository;

import com.kh.mvc.member.model.vo.Member;

@Repository
public class MemberDao {

	public Member findMemberById(String userId) {
	
		
		return new Member();
	}
}
