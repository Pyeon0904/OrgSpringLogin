package com.org.security;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {
	
//	[ 로그인 구현 ]
	@GetMapping(value="/loginPage")
	public String loginPage() throws Exception{
		
		log.info("로그인 페이지 요청");

		return "loginPage";
	}
	
//	[ 회원가입 구현 ]
	@GetMapping("/member/enroll")
	public String enrollView() {
		
		log.info("회원가입 페이지 요청");
		return "/member/enroll";
	}
	
}