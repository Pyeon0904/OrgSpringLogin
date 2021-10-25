package com.org.security.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class boardController {
	
//	[ 게시판 뷰 구현(페이지연결) ]
	@GetMapping("/board/boardView")
	public String boardView() {
		
		log.info("게시판 뷰 페이지 요청");
		return "/board/boardView";
	}
	
}
