package com.org.tiles.Tiles;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class tilesController {
	
//	[Tiles 페이지 연결]
	@RequestMapping(value = "/tiles/tiles-layout", method = {RequestMethod.GET})
	public String tilesView() {
		
		log.info("Tiles 페이지 연결");
		return "/tiles/tiles-layout";
	}
//	[Tiles 페이지 연결]
	@RequestMapping(value = "/tiles/footerTemplate", method = {RequestMethod.GET})
	public String footerView() {
		
		log.info("Tiles 페이지 연결");
		return "/tiles/footerTemplate";
	}
//	[Tiles 페이지 연결]
	@RequestMapping(value = "/tiles/headerTemplate", method = {RequestMethod.GET})
	public String headerView() {
		
		log.info("Tiles 페이지 연결");
		return "/tiles/headerTemplate";
	}
//	[Tiles 페이지 연결]
	@RequestMapping(value = "/tiles/sidebarTemplate", method = {RequestMethod.GET})
	public String sidebarView() {
		
		log.info("Tiles 페이지 연결");
		return "/tiles/sidebarTemplate";
	}
	
//	[board 페이지 연결]
	@RequestMapping(value = "/board/board", method = {RequestMethod.GET})
	public String boardView() {
		
		log.info("board 페이지 연결");
		return "/board/board";
	}
}
