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
<title>게시판 작성 페이지</title>
<!-- css 참조 -->
<link rel=stylesheet href="${ path }/resources/css/allCss/allCss.css"/>
<link rel=stylesheet href="${ path }/resources/css/allCss/btnCss.css"/>
<link rel=stylesheet href="${ path }/resources/css/boardCss/boardWriteCss.css"/>
<!-- ------- -->
<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<!-- summerNote(js) 참조 -->
<script src="${path}/resources/js/summerNote.js"></script>
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
	<h2 class="pageTitle">게시판 작성</h2>
	<div class="conbox"><br>
	<div id='board-write-container'>
		<form action="${ path }/board/write" method="POST" enctype="multipart/form-data">
			<table id='tbl-board' align="center">
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" maxlength="16px" placeholder="제목을 입력해주세요." id="title" required></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="writerId" value="${ loginMember.id }" readonly></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><input type="file" name="upfile"></td>
				</tr>
				<!-- 
				<tr>
					<th>첨부파일2</th>
					<td><input type="file" name="upfile"></td>
				</tr>
				 -->
				<tr>
					<th>내용</th>
					<td><textarea class="content" name="content" cols="150" rows="12" maxlength="180px" placeholder="내용을 입력해주세요." style="resize:none;" required></textarea></td>
				</tr>
				<tr>
					<th colspan="2">
						<div class="btn_YS">
							<input type="submit" value="등록"
									style="border-radius: 10px; cursor:pointer; background-color: transparent;">
							<input type="reset" value="취소"
									style="border-radius: 10px; cursor:pointer; background-color: transparent;">
						</div>
					</th>
				</tr>
			</table>
		</form>
	</div>
</div>
</div>
<script>

</script>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
