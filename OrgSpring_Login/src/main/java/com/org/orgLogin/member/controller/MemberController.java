package com.org.orgLogin.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.org.orgLogin.member.model.service.MemberService;
import com.org.orgLogin.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMember")
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
	/*
	@RequestMapping(value = "/login", method = {RequestMethod.POST})
	public String login(@ModelAttribute Member member) {
		
		//log.info("{}, {}", member.getUserId, member.getUserPwd);
		
		return "home";
	}
	*/
	
	/*4. @PathVariable 패스 파라미터로 요청 받기 */
	/* 
	 - URL Path상에 있는 특정 값을 가져오기 위해 사용하는 방법 
	 - @PathVariable 어노테이션을 사용한다.
	 - Restful API 사용할 때, URL상으로 어떤 값을 가져오는 경우 많이 사용한다!
	 - path 상에 {}로 묶는다면, 그 파라미터를 값으로 받겠다는 것이다!
	 - path 상의 {}안의 변수명과 자료형 다음 변수명이 동일하다면 boardId를 Id로 줄여쓰는 것 가능!
	 - @어노테이션 자체를 생략하는 것은 불가능!(RequestParam과 구분이 안됨!) -> 변수명 줄이기만 가능!
	 (@PathVariable 어노테이션의 괄호 부분은 생략이 되지만 어노테이션 자체는 생략이 되지 않는다)
	 */
	/*
	@RequestMapping("board/{id}")
	public String getBoard(@PathVariable("id") int boardId) {
//#2	public String getBoard(@PathVariable int Id) {
			
		
		//log.info("Board ID : {}", boardId);
		//#2 log.info("Board ID : {}", Id);
		
		return "home";
	}
	*/
	
	@Autowired
	private MemberService service;
	
	// 로그인 처리
	/*
	@RequestMapping(value = "/login", method = {RequestMethod.POST})
	public String login(@RequestParam("userId")String userId, 
						@RequestParam("userPwd") String userPwd) {
		
		log.info("{}, {}", userId, userPwd);
		
		// '서비스 객체' 하나 만들고 login 시켜달라고 요청! -> Member loginMember로 받아!
		Member loginMember = service.login(userId, userPwd);
		// login에서 create method 해주기! -> MemberService에 생성됨!
		
		
		System.out.println(loginMember);
		
		return "home";
	}
	*/
	
//	[ 로그인 구현 1 ]
//	1. HttpSession과 Model 객체 사용
//	- Model이라는 객체는 controller에서 데이터를 뷰로 전달하고자 할 때 사용하는 객체이다.
//		(처리되는 비즈니스 모델을 view에 전달해줄 때, Model 객체에 담아서 Dispatcher Servlet에 전달해 View resolver를 경유해 view에 Model 객체를 전달해준다.)
//		(전달하고자 하는 데이터를 맵형태(key, value)로 담을 수 있다.)
//		데이터를 담을 때는 setAttribute()가 아닌 addAttribute()를 사용한다.
//	- Model 객체의 scope는 request이다.
	@GetMapping("/member/login")
	public String loginView() {
		
		log.info("로그인 페이지 요청");
		
		return "/member/login";
	}
	
	@RequestMapping(value = "/member/login", method = {RequestMethod.POST})
	public String login(HttpSession session, Model model, 
			@RequestParam("userId") String userId, @RequestParam("userPwd") String userPwd){
		
		log.info("{}, {}", userId, userPwd);
		
		Member loginMember = service.login(userId, userPwd);
		// Id, Pwd 받아서 로그인된 멤버가 있다면 return 시켜주고 없다면 null을 리턴!

		// [로그인 controller 로직 구현 1]
		if(loginMember != null) { // 로그인 O
			session.setAttribute("loginMember", loginMember);
			
			return "/member/login";
			
			
//			 return "home";
//			 	- "forwarding 방식"으로 여기서 리턴한 view 명칭이 viewResolver에 의해
//			 	  prefix, subfix가 붙어 "WEB-INF/views/home.jsp"로 요청을 넘긴다.
//			 	  
//			 
//			 return "redirect:/";
//			 	- "redirect 방식"으로 여기서 리턴한 경로로 브라우저에서 다시 요청하도록 반환한다.	 
//				(즉, 로그인이 성공했을 때, redirect 방식을 통해 다시 home 경로로 돌아오도록 요청!)
//			
		}
		else { // 로그인 X
			model.addAttribute("msg", "아이디나 패스워드가 일치하지 않습니다.");
			model.addAttribute("location", "/member/login");
			
			
			return "common/msg"; // prefix가 views 까지 때문에!
		}
	}	
	
//	[ 로그아웃 구현 2 ] - SessionStatus 이용
	@RequestMapping("/logout")
	public String logout(SessionStatus status) {
		
		log.info("status.isComplete() : " + status.isComplete());
		
		status.setComplete();
		
		log.info("status.isComplete() : " + status.isComplete());
		
		return "redirect:/";
	}
	/*
//	[ 로그아웃 구현1 ] - (HttpSession_기존 서블릿 방식) 
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	*/
	
	
	/* ----------------------------------------------------- */
	
	/* [로그인 구현 2] @SessionAttributes와 ModelAndView 객체 사용
	 	@SessionAttributes()
	 	- @SessionAttributes("키값")은 Model 객체에 Attribute로 해당 키값으로 담기는 
	 	  데이터를 request scope에서 session scope까지로 확장시켜준다
	 	- (기존 1번방법)으로 session을 정리할 수 없고 SessionStatus 객체를 통해 session scope까지 범위가 확장된 데이터를 정리할 수 있다.
	 	  (session.invalidate(); - X, status.setComplete(); - O)
	 	  
	 	ModelAndView
	 	- ModelAndView 객체는 컨트롤러에서 데이터를 뷰로 전달하는 기능과 forward할 뷰에 정보를 담는 객체이다.
	 	- addAttribute()가 아닌 "addObject() 메소드"를 통해서 데이터를 담을 수 있다.
	 */
	
	/*
	@RequestMapping(value = "member/login", method = {RequestMethod.POST})
	public ModelAndView login(ModelAndView model,
			@RequestParam("userId") String userId, @RequestParam("userPwd") String userPwd) {
		
		log.info("{}, {}", userId, userPwd);
		
		Member loginMember = service.login(userId, userPwd);
		
		if(loginMember != null) { // 로그인 O
			model.addObject("loginMember", loginMember);
			model.setViewName("redirect:/");
		}
		else { // 로그인 X
			model.addObject("msg", "아이디나 패스워드가 일치하지 않습니다.");
			model.addObject("location", "/");
			model.setViewName("common/msg");
				// 우리가 찾아야할 Jsp의 경로도 요청할 수 있지만, 
				// model.setViewName("redirect:/");라는 접두어를 붙여서 브라우저가 다시 요청할 수 있게끔 처리도 가능!
		}
		return model;
	}

//	[ 로그아웃 구현 2 ] - SessionStatus 이용
	@RequestMapping("/logout")
	public String logout(SessionStatus status) {
		
		log.info("status.isComplete() : " + status.isComplete());
		
		status.setComplete();
		
		log.info("status.isComplete() : " + status.isComplete());
		
		return "redirect:/";
	}
	*/
	
//[ 회원가입 구현 ] 
	@GetMapping("/member/enrollCheck")
	   public String enroll2() {
		 log.info("이용약관");
	      
	      return "member/enrollCheck"; 
	}
	
	//@RequestMapping(value = "/member/enroll", method = {RequestMethod.GET})
	@GetMapping("/member/enroll")
	public String enrollView() {
		
		log.info("회원가입 페이지 요청");
		return "member/enroll";
	}
	
	//@RequestMapping(value = "/member/enroll", method = {RequestMethod.POST})
	@PostMapping("/member/enroll")
	public ModelAndView enroll(ModelAndView model, @ModelAttribute Member member) {
		
		System.out.println(member);
		
		// save라는 메소드에 member 전달 -> 결과로는, 정수형 값을 보낼 것이다
		//service.save(member);
		int result = service.save(member);
		
		System.out.println(member);
		
		// [회원가입 성공 여부(OX)에 따른 로직]
		if(result > 0) { // 회원가입 O(table에 1개의 행이 들어갔다는 것)
			model.addObject("msg", "회원가입이 정상적으로 완료됐습니다.");
			model.addObject("location", "/"); // 완료되고서 홈으로
		}
		else { // 회원가입 X
			model.addObject("msg", "회원가입이 실패했습니다.");
			model.addObject("location", "/member/enroll"); // 실패로 다시
		}
		
		model.setViewName("common/msg");
		return model;
	}
	
//	[Id 중복체크 로직]
	@GetMapping("/member/idCheck")
	public ResponseEntity<Map<String, Object>> idCheck(@RequestParam("id") String userId) {
		log.info("User ID : {}", userId);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("validate", service.validate(userId));
		
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}
	
	@GetMapping(value = "/member/findPwd")
	public String findPassword() {
		return "member/findPwd";
	}
	
	@GetMapping(value = "/member/findId")
	public String findId() {
		return "member/findId";
	}
	
	@GetMapping(value = "/member/checkEmail")
	public String checkEmail() {
		return "member/checkEmail";
	}
	
	
	
//	[ 본인인증(EMAIL) ]
		@RequestMapping(value = "/member/checkEmail", method = {RequestMethod.POST})
		public ModelAndView checkEmail(ModelAndView model, @RequestParam("userEmail")String userEmail) {
			
			Member confirmMember = service.validateEmail(userEmail);
			
			if(confirmMember!= null) {
				model.addObject("confirmMember", confirmMember);
				model.addObject("msg", "인증 성공했습니다.");
				model.addObject("location", "/member/findId");
			}else {
				model.addObject("msg", "인증 실패했습니다. 이메일을 다시 확인해주세요.");
				model.addObject("location", "/member/checkEmail");
			}
			model.setViewName("common/msg");
			
			return model;
		}
		
}

