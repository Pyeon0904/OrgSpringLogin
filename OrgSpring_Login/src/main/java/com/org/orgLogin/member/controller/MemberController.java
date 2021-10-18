package com.org.orgLogin.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.org.orgLogin.member.model.service.MemberService;
import com.org.orgLogin.member.model.service.MemberServiceImpl;
import com.org.orgLogin.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {
	
	private MemberService service;
	
	@RequestMapping(value = "/login", method = {RequestMethod.POST})
	public String login(@RequestParam("userId") String userId,
						@RequestParam("userPwd") String userPwd) {
		
		Member loginMember = service.login(userId, userPwd);
		
		log.info("{}, {}", userId, userPwd);
		
		System.out.println(loginMember);
		
		return "index";
	}
}
