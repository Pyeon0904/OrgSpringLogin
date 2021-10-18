package com.org.orgLogin.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {
	
	@RequestMapping(value = "/login", method = {RequestMethod.POST})
	Public String login(@ModelAttribute Member member) {
		
		return "/login";
	}
}
