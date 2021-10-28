package com.kh.mvc.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class boardController {
	
//	[ 게시판 '리스트(boardView)' 페이지 연결]
	@GetMapping("/board/boardView")
	public String boardView() {
		
		log.info("게시판 리스트 조회페이지 요청");
		
		return "/board/boardView";
	}
	
	
//  [ 게시판 '글쓰기(boardWrite)' 페이지 연결]
	@GetMapping("/board/boardWrite")
	public String boardWrite() {
		
		log.info("게시판 글쓰기 페이지 요청");

		return "/board/boardWrite";
	}
}