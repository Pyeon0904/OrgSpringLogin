package com.org.SpringBoard.board.model.vo;

import java.sql.Date;

public class BoardVO {
	private int BNO;			// 게시글 번호
	
	private String TITLE;		// 게시글 제목
	
	private String CONTENT;		// 게시글 내용
	
	private String Writer;		// 게시글 작성자
	
	private Date REGDATE;		// 게시글 작성일자 util.Date
	
	private int VIEWCNT;		// 게시글 조회수
}
