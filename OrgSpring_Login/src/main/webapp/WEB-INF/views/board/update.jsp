<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정 페이지</title>
<!-- css 참조 -->
<link rel=stylesheet href="${ path }/resources/css/allCss/allCss.css"/>
<link rel=stylesheet href="${ path }/resources/css/allCss/btnCss.css"/>
<link rel=stylesheet href="${ path }/resources/css/boardCss/boardWriteCss.css"/>
<!-- ------- -->
<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<!-- summerNote(js) 참조 -->
<script src="${ path }/resources/js/summerNote.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<script src="${path}/resources/summernote/summernote-lite.js"></script>
<script src="${path}/resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${path}/resources/summernote/summernote-lite.css">
<!-- ------------------ -->
</head>

<body>
<div class="box">
	<h2 class="pageTitle">게시글 수정</h2>
	<div class="conbox"><br>
<div id='board-write-container'>
	<form action="${ path }/board/update" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="no" value="${ board.no }" />
		<input type="hidden" name="originalFileName" value="${ board.originalFileName }" />
		<input type="hidden" name="renamedFileName" value="${board.renamedFileName}" />
	
		<table id='tbl-board'>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" id="title" value="${board.title}"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writerId" value="${ board.writerId }" readonly></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<input type="file" name="reloadFile"><br>
					<c:if test="${ !empty board.originalFileName }">
						현재 업로드한 파일 : 
						<a>
							<c:out value="${ board.originalFileName }"></c:out>
						</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea class="content" name="content" cols="50" rows="15" ><c:out value="${ board.content }"></c:out></textarea>
				</td>
			</tr>
		</table>
		<br><br><br>
		<div align="center">
			<input type="submit" class="update-btn" value="수정">
			<input type="button" class="update-btn" onclick="location.replace('${ path }/board/list')" value="목록으로">
		</div>
	</form>
</div>
</div>
</div>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
