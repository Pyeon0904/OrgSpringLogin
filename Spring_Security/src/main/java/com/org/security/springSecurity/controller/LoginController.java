package com.org.security.springSecurity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {

//	[로그인 구현]
	@RequestMapping("/loginPage")
	public String loginPage() {
		
		log.info("로그인 페이지 호출");
		
		return "/login";
	}
	
}
