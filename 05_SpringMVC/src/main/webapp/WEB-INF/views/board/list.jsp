<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 뷰(리스트) 페이지</title>
      <script src="<%= request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>
      
      <style>
         /*하이퍼링크 스타일*/
			a { text-decoration:none }
			td>a:link { color:white; } /*방문안한 페이지 글자색*/
			td>a:visited { color:wheat; } /*방문한 페이지 글자색*/
         /* 전체 영역 -------------------------------------------------*/
            /*---------------제일 바깥 영역 설정-----------------*/
            #box{ 
               background-color:rgb(243, 211, 174);
               width:100%;
               height:400px; 
               margin-top:130px;
               margin-bottom:100px;
               margin-left:-10px;
               padding:10px;
            }
         
            /*-------------------컨텐츠 영역---------------------*/
            #conbox{
                width:80%; 
                position:relative; 
                top:20px;
                margin:auto;
             }
         /*----------------------------------------------------------*/
      
         /* 페이지 TITLE-------------------------------------------- */
            #pageName{
 	           text-align: center;
    	       margin-top: 30px;
        	   color: rgb(241, 107, 27);
        	}
         /* --------------------------------------------------------- */
         
         
         /* 표(Table) 관련 스타일 ------------------------------------*/
            /*테이블 크기 지정*/
            table#tbl-board {
               width: 1500px;
               border-collapse: collapse; /* 테두리 셀 사이 간격*/
               clear: both;
            }
            
            /* th 테두리 및 텍스트 위치 설정 */
            table#tbl-board th {
               border-bottom: 1px solid;
               padding: 13px 0;
               text-align: center;
               background-color: wheat;
               font-family: GmarketSansLight;
               text-align:center;
            }
            
            /* "제목" 셀너비 늘리기 */
            #t1 {
               width: 400px;
            }
            
            /*td 테두리 및 텍스트 위치 설정*/
            table#tbl-board td {
               border-bottom: 1px solid;
               padding: 13px 0;
               text-align: center;
               background-color: none;
               font-family: GmarketSansLight;
               text-align:center;
               color: wheat;
            }
            
            #culturePoint {
               background-color: honeydew;
            }
            
            /*테이블 제목 스타일 지정*/
            #tbl-board th{
               color: black;
            }
         /* -------------------------------------------------------------*/
         
         /* 글쓰기 버튼 관련 스타일--------------------------------------*/
            /*글쓰기버튼*/
            #btn-add {
               float: right; text-align: center;
               width: 70px;   height: 30px;
               padding: 5px 5px;
               background-color: transparent;
               border:1px solid black;
               border-radius: 5px;
               color: black;
            }
            /*글쓰기 버튼에 마우스 올릴때*/
            #btn-add:hover { background-color:rgb(246, 189, 102); }
         /* -------------------------------------------------------------*/   
         
         /* 하단 페이지바 관련 스타일------------------------------------*/
            /*페이지바*/
            div#pageBar {
               margin-top: 20px;
               text-align: center;
            }
            /*페이지바 버튼 스타일 지정*/
            #pageBar button {
               font-size: 15px;
               width: 25px; height: 25px;
               margin: 0px 3px;
               background:none;
               border : none;
               color:white;
            }
            /*번호 선택 스타일*/
            #pageBar button:disabled{
               border-bottom:2px solid wheat;
               color:wheat;
            }
         /* -------------------------------------------------------------*/
   </style>
   </head>
   
<body>
  	<h2>게시판 </h2>
	<div id="board-list-container">
		<c:if test="${ loginMember != null }">
			<button type="button" id="btn-add"
				onclick="location.href='${ path }/board/write'">글쓰기</button>
		</c:if>
		<table id="tbl-board">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>첨부파일</th>
				<th>조회수</th>
			</tr>
			<c:if test="${ list == null }">
				<tr>
					<td colspan="6">
						조회된 게시글이 없습니다.
					</td>
				</tr>
			</c:if>
			<c:if test="${ list != null }">
				<c:forEach var="board" items="${ list }">
					<tr>
						<td><c:out value="${ board.no }"/></td>
						<td>
							<a href="${ path }/board/view?no=${board.no}">							
								<c:out value="${ board.title }"/>
							</a>
						</td>
						<td><c:out value="${ board.writerId }"/></td>
						<td><fmt:formatDate type="date" value="${ board.createDate }"/></td>
						<td>
							<c:if test="${ board.originalFileName != null }">
								<img src="${ path }/images/file.png" width="20" height="20"/>
							</c:if>
							<c:if test="${ board.originalFileName == null }">
								<span> - </span>
							</c:if>
						</td>
						<td><c:out value="${ board.readCount }"/></td>
					</tr>				
				</c:forEach>
			</c:if>
		</table>
		<div id="pageBar">
			<!-- 맨 처음으로 -->
			<button onclick="location.href='${ path }/board/list?page=1'">&lt;&lt;</button>
			
			<!-- 이전 페이지로 -->
			<button onclick="location.href='${ path }/board/list?page=${ pageInfo.prvePage }'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status">
				<c:if test="${ pageInfo.currentPage == status.current}">
					<button disabled><c:out value="${ status.current }"/></button>
				</c:if>
				<c:if test="${ pageInfo.currentPage != status.current}">
					<button onclick="location.href='${ path }/board/list?page=${ status.current }'">
						<c:out value="${ status.current }"/>
					</button>
				</c:if>
			</c:forEach>
			
			<!-- 다음 페이지로 -->
			<button onclick="location.href='${ path }/board/list?page=${ pageInfo.nextPage }'">&gt;</button>
			
			<!-- 맨 끝으로 -->
			<button onclick="location.href='${ path }/board/list?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
		</div>
	</div>
</body>
</html>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
