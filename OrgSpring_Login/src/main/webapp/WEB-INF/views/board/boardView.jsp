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
               height:1000px; 
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
               color : white;
               font-family:GmarketSansLight;
               text-align:center;
               font-size: 20pt;
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
               background: #2a1b0a;
               border:1px solid white;
               border-radius: 5px;
               color: white;
            }
            /*글쓰기 버튼에 마우스 올릴때*/
            #btn-add:hover { border: 3px solid wheat;
            }
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
   <div id="box">
      <section id="section">
         <div id="conbox">
            <h1 id="pageName" align="center">후기 전체보기</h1>
            
         
       <!-- 검색 폼 시작--------------------- -->
         <form id="searchForm" name="form1" method="GET" action="${path}/board/boardSearch">
            <div align="right" class="row m-4">
            
               <p style="margin-bottom:10px;">조회기간을 선택해주세요 
                  <input type="text" id="datepicker1" name="startdate" style="padding-top: 5px; padding-bottom: 6px;"><img src="${path}/resources/images/calendar-icon.png" id="startDt" style="margin-left:-24px; margin-bottom:-7px;">~
                  <input type="text" id="datepicker2" name="enddate" style="padding-top: 5px; padding-bottom: 6px;"><img src="${path}/resources/images/calendar-icon.png" id="endDt" style="margin-left:-24px; margin-bottom:-7px;">
               </p>

               <select name="type" class="form-control" id="type" required>
                  <option value="" selected disabled hidden>::검색 유형::</option>
                  <option value="1">글제목</option>
                  <option value="2">작성자</option>
                  <option value="3">글내용</option>
                  <option value="4">전체</option>
               </select> 
               
               <input type="text" name="keyword" class="form-control" id="keyword"
                  placeholder="검색어를 입력하세요" style="padding: 3px 20px 6px 20px" value=${ keyword }>
               <button type="submit" class="btn btn-warning" id="search">검색</button>

            </div>
         </form>
         <!-- 검색 폼 끝---------------------- -->
         <br><br>
         <form id="boardForm" name="boardForm">
            <input type="hidden" id="function_name" name="function_name" value="getBoardList" />
            <input type="hidden" id="current_page_no" name="current_page_no" value="1" />
            
         
            <table width="100%" class="table01">
               <colgroup>
                  <col width="10%" />
                  <col width="30%" />
                  <col width="15%" />
                  <col width="20%" />
                  <col width="8%" />
               </colgroup>
               <thead>      
                  <tr>
                     <th>글번호</th>
                     <th>제목</th>
                     <th>작성자</th>
                     <th>작성일</th>
                     <th>조회수</th>
                  </tr>
               <c:if test="${ list == null }">
                  <tr>
                     <td colspan="6">조회된 게시글이 없습니다.</td>
                  </tr>
               </c:if>   
               </thead>
               <tbody id="tbody">
                  <c:if test="${ list != null }">
                         <c:forEach var="board" items="${ list }">
                            <tr>
                               <c:if test="${ board.sort == 1 }">
                               		<td class="notice"><c:out value="공지"/></td>
                               </c:if>
                               <c:if test="${ board.sort == 0 }">
                               		<td><c:out value="${ board.qna_no }"/></td> <!-- 브라우저 자체에 값을 찍어줄 땐 c:out 사용 -->
                               </c:if>
               
                               <%-- 비밀글이면 --%>
                               <c:if test="${ board.pass != null }"> 
                                 <%-- 비밀글 && admin 계정이면 --%>
                                  <c:if test="${loginMember.status eq 'A' }">
                                        <%-- 답글이면 --%>
                                        <c:if test="${ board.groupord > 0 }">
                                              <td id="title"><a href="${ path }/board/boardDetail?qna_no=${ board.qna_no }" class="titlea"><img src="${path}/resources/images/reicon.png" name="re" id="profile" alt="My Image" style="margin:0 4px 0 0; padding-left:${board.dept * 20 }px;"/><c:out value="${ board.title }"/><img src="${path}/resources/images/lock.gif" name="lock" alt="비밀글" style="margin:0 5px;"/></a></td>
                                        </c:if>
                                        <%-- 원글이면 --%>
                                        <c:if test="${ board.groupord == 0 }">
                                              <td id="title"><a href="${ path }/board/boardDetail?qna_no=${ board.qna_no }" class="titlea"><c:out value="${ board.title }"/><img src="${path}/resources/images/lock.gif" name="lock" alt="비밀글" style="margin:0 5px;"/></a></td>
                                        </c:if>
                                   </c:if>
                                 <%-- 비밀글 && admin 계정이 아니면 --%>
                                   <c:if test="${loginMember.status ne 'A' }">
                                        <%-- 답글이면 --%>
                                        <c:if test="${ board.groupord > 0 }">
                                              <td id="title"><a href="${ path }/board/password?qna_no=${ board.qna_no }" class="titlea"><img src="${path}/resources/images/reicon.png" name="re" id="profile" alt="My Image" style="margin:0 4px 0 0; padding-left:${board.dept * 20 }px;"/><c:out value="${ board.title }"/><img src="${path}/resources/images/lock.gif" name="lock" alt="비밀글" style="margin:0 5px;"/></a></td>
                                        </c:if>
                                        <%-- 원글이면 --%>
                                        <c:if test="${ board.groupord == 0 }">
                                              <td id="title"><a href="${ path }/board/password?qna_no=${ board.qna_no }" class="titlea"><c:out value="${ board.title }"/><img src="${path}/resources/images/lock.gif" name="lock" alt="비밀글" style="margin:0 5px;"/></a></td>
                                        </c:if>
                                   </c:if>
                              </c:if>
                                 
                                <%-- 비밀글 아니면 --%> 
                                <c:if test="${ board.pass == null }"> 
                                        <%-- 답글이면 --%>
                                        <c:if test="${ board.groupord > 0 }">
                                              <td id="title"><a href="${ path }/board/boardDetail?qna_no=${ board.qna_no }" class="titlea"><img src="${path}/resources/images/reicon.png" name="re" id="profile" alt="My Image" style="margin:0 4px 0 0; padding-left:${board.dept * 20 }px;"/><c:out value="${ board.title }"/></a></td>
                                        </c:if>
                                        <%-- 원글 && 질문글이면 --%>
                                        <c:if test="${ board.groupord == 0 && board.sort == 0}">
                                           <td id="title"><a href="${ path }/board/boardDetail?qna_no=${ board.qna_no }" class="titlea"><c:out value="${ board.title }"/></a></td>
                                        </c:if>
                                        <%-- 원글 && 공지글이면 --%>
                                        <c:if test="${ board.groupord == 0 && board.sort == 1}">
                                           <td id="title" class="notice"><a href="${ path }/board/boardDetail?qna_no=${ board.qna_no }" class="titlea"><b><c:out value="${ board.title }" /></b></a></td>
                                        </c:if>
                                  </c:if>
                             
                               <c:if test="${ board.sort == 1 }">
                               		<td class="notice"><c:out value="${ board.writer }"/></td>
                               		<td class="notice"><fmt:formatDate type="both" value="${ board.createDate }"/></td>
                               		<td class="notice"><c:out value="${ board.readCount }"/></td>
                               </c:if>
                               <c:if test="${ board.sort == 0 }">
                               		<td><c:out value="${ board.writer }"/></td>
                               		<td><fmt:formatDate type="both" value="${ board.createDate }"/></td>
                               		<td><c:out value="${ board.readCount }"/></td>
                               </c:if>
                            </tr>
                         </c:forEach>
                     </c:if>
               </tbody>   
            </table>
         </form>         
         <div class="btn_right mt15">
            <c:if test="${ loginMember != null }">
               <button type="button" class="button_base b01_simple_rollover" onclick="location.href='${path}/board/boardWrite'">글쓰기</button>
            </c:if>
         </div>
      </div>
            <div id="pageBar" style="align:center;">
		         <!-- 맨 처음으로 -->
		         <button onclick="location.href='${ path }/board/boardList?page=1'">&lt;&lt;</button>
		         
		         <!-- 이전 페이지로 -->
		         <button onclick="location.href='${ path }/board/boardList?page=${ pageInfo.prvePage }'">&lt;</button>
		
		         <!--  10개 페이지 목록 -->
		         <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status"> <!-- status는 반복될 때 해당하는 페이지 -->
		             <c:if test="${ pageInfo.currentPage == status.current }"> <!-- 현재 페이지와 현재 반복하는 숫자가 같으면 -->
		                <button disabled><c:out value="${ status.current }" /></button>
		             </c:if>
		             <c:if test="${ pageInfo.currentPage != status.current }">
		                <button onclick="location.href='${ path }/board/boardList?page=${ status.current }'"><c:out value="${ status.current }" /></button>
		             </c:if>
		         </c:forEach>
		         
		         <!-- 다음 페이지로 -->
		         <button onclick="location.href='${ path }/board/boardList?page=${ pageInfo.nextPage }'">&gt;</button>
		         
		         <!-- 맨 끝으로 -->
		         <button onclick="location.href='${ path }/board/boardList?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
		      </div>
            <div>
               <script>
                  $(".tbl-board").attr("style","word-break:break-all");
               </script>

               <!-- '글쓰기' 버튼 -->
               <button type="button" id="btn-add"
                  onclick="location.href='${ path }/community/review/write'">글쓰기</button>
            </div>
            </div>
      </section>
   </div>
</body>
</html>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
