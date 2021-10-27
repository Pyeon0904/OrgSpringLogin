package com.org.springTiles.Tiles.notice.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class DetailController {
	
	@RequestMapping("/")
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletRequest response) {
		
		ModelAndView mv = new ModelAndView("notice.detail");
		
		return mv;
	}
}
