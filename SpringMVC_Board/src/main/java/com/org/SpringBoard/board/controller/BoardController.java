package com.org.SpringBoard.board.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.org.SpringBoard.board.model.service.boardServiceImpl;
import com.org.SpringBoard.board.model.vo.BoardVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	// 의존관계 주입 => BoardServiceImpl 생성
	// IoC 의존관계 역전
	@Inject
	boardServiceImpl boardService;

//	@Autowired
//	private boardService service;
	
//	[01. 게시글 등록]
	@RequestMapping("list.do")
	public ModelAndView list()throws Exception{
		List<BoardVO> list = boardService.listAll();
		
		// ModelAndView - 모델뷰
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/list"); // 뷰를 list.jsp로 설정
		mav.addObject("list", list); // 데이터를 저장
		return mav; //list.jsp로 List가 전달된다.
	}
	
//	[02_01. 게시글 작성화면]
	@RequestMapping(value="writer.do", method = RequestMethod.GET)
	public String Write() {
		
		return "board/write"; // write.jsp로 이동
	}
	
//	[02_02. 게시글 작성처리]
	@RequestMapping(value="insert.do", method = RequestMethod.POST)
	public String insert(@ModelAttribute BoardVO vo) throws Exception {
		
		boardService.create(vo);
		return "redirect:list.do"; // write.jsp로 이동
	}
	
//	[03. 게시글 상세내용 조회, 게시글 조회수 증가처리]
//	@RequestParam : get/post 방식으로 전달된 변수 1개
//	HttpSession 세션객체
	@RequestMapping(value = "view.do", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam int BNO, HttpSession sesion) throws Exception{
		
		// 조회수 증가 처리
		boardService.increaseViewcnt(BNO, session);
		
		// 모델(데이터) + 뷰(화면)를 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		
		// 뷰의 이름
		mav.setViewName("board/view");
		
		// 뷰에 전달할 데이터
		mav.addObject("dto", boardService.read(BNO));
		return mav;
	}
	
//	[04. 게시글 수정]
	// Form 에서 입력한 내용들은 @ModelAttribute BoardVO vo로 전달됨
	@RequestMapping(value = "update.do", method = RequestMethod.POST)
	public String update(@ModelAttribute BoardVO vo) throws Exception{
		boardService.update(vo);
		
		return "redirect:list.do";
		
	}
	
//	[05. 게시글 삭제]
	@RequestMapping("delete.do")
	public String delete(@RequestParam int BNO) throws Exception{
		boardService.delete(BNO);
		
		return "redirect:list.do";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
