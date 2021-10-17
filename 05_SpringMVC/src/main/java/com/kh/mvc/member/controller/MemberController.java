package com.kh.mvc.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {

	
	/* 기본 틀
	@RequestMapping(value = "/login", method = {RequestMethod.POST})
	public String login() {
		
		return "home";
	}
	*/
	
	/* 1. HttpServletRequest 방식 */
	/* request 객체를 가져와서 이를 통해 parameter를 꺼내오는 방식
	@RequestMapping(value = "/login", method = {RequestMethod.POST})
	public String login(HttpServletRequest request) {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("uesrPwd");
		
		//log.info("{}, {}", userId, userPwd);
		return "home";
	}
	*/
	
	/* 2. @RequestParam 어노테이션 방식 */
	/* RequestParam이라는 어노테이션을 써서 함수가 호출될 때 매개변수로 받는 것이다.
	 - 스프링에서 더 간편하게 파라미터를 받아올 수 있는 방법 중 하나이다.
	 - (내부적으로는)Request 객체를 이용해서 데이터를 전송받는 방법이다.
	 - 파라미터 name 속성에 없는 값이 넘어올 경우, 에러발생하지만 @RequestParam(required = false)로 지정하면 null 값을 넘겨준다.
	 - defaultValue 속성을 사용하면 파라미터 name 속성에 값이 없을 경우 기본값을 지정할 수 있다.
	 - 단, 매개변수의 이름과 name값이 동일하게 설정된 경우 자동으로 주입된다.
	   (어노테이션을 사용하는 것이 아니기에 defaultValue, required 설정이 불가)
	 
	@RequestMapping(value = "/login", method = {RequestMethod.POST})
	public String login(@RequestParam("userId")String userId, 
						@RequestParam("userPwd")String userPwd) {
		
		
		//log.info("{}, {}", userId, userPwd);
		return "home";
	}
	*/
	
	/* 2-1. @RequestParam 어노테이션 방식(Id 혹은 Pwd에 default 값을 주고 싶을 때) */
	/* RequestParam이라는 어노테이션을 써서 함수가 호출될 때 매개변수로 받는 것이다.
	@RequestMapping(value = "/login", method = {RequestMethod.POST})
	public String login(@RequestParam("userId")String userId, 
						@RequestParam(value= "userPwd", defaultValue ="1234")String userPwd) {
		
		값이 입력되지 않을 때에는 빈칸으로 입력이 되기 때문에 특정 기본값을 넣어주고 싶다면,
		default value 값을 지정해서 넣어주면 된다!
		
		//log.info("{}, {}", userId, userPwd);
		return "home";
	}
	*/
	
	/* ★2-2. @RequestParam 어노테이션 방식(파라미터의 jsp 파일 'name' 속성과 메소드의 매개변수가 동일하다면 자동 주입!) */
	/*
	@RequestMapping(value = "/login", method = {RequestMethod.POST})
//		public String login(@RequestParam("userId")String userId, 
//							@RequestParam("userPwd")String userPwd) {
	public String login(String userId, String userPwd) {
		
		//log.info("{}, {}", userId, userPwd);
		return "home";
	}
	*/
	
	/* 2-3. @RequestParam 어노테이션 방식(실제 존재하지 않는 parameter(addr)를 받으려고 할때? -> 에러!(필수로 넘어와야함!)) */
	/*
	@RequestMapping(value = "/login", method = {RequestMethod.POST})
	public String login(@RequestParam("userId")String userId, 
						@RequestParam(value= "userPwd", defaultValue ="1234")String userPwd,
						@RequestParam(value="addr", defaultValue ="서울특별시") String addr) {
		
//		단, defaultValue로 받으면 받아진다!
//		defaultValue = false 로 지정해두면, 파라미터 name 값에 없는 값이 넘어오면 null로 들어간다 
		
		//log.info("{}, {}", userId, userPwd);
//		System.out.println(addr);
		return "home";
	}
	*/
	
	/* 3. @ModelAttribute 어노테이션 방식 --> class 생성해서 member/model/vo/member.java 만듬 -> 이후, lombok 불러! (@Data / @NoArgsConstructor / @AllArgsConstructor)*/
	/* 
	 - 파라미터가 많을 때, 2번의 방법은 일일이 객체를 다 써줘야하는 문제!
	 - 3번 방식은 객체(Member)를 생성해서 메소드 실행전에, member 객체를 기본생성자(lombok으로 부른)를 통해 생성해주고, 넘어오는 파라미터와 동일한 인스턴스 변수를 setter를 통해 주입을 해준다.
	 - 요청 파라미터가 많으면 객체 타입으로 넘겨받는 방법(커맨드객체 방법)을 사용한다. 
	 - '@ModelAttribute' 생략해도 사용 가능! -> 가독성을 위해 명시해주는 게 좋다!
	 
	 */
	@RequestMapping(value = "/login", method = {RequestMethod.POST})
	public String login(@ModelAttribute Member member) {
		
		//log.info("{}, {}", member.getUserId, member.getUserPwd);
		
		return "home";
	}

	
	
	
	
}

