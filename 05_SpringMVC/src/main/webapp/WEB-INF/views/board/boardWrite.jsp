<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기 페이지</title>
	<style>
		/* 전체 틀 ------------------------------------------------- */
        .box{ 
            width:100%;
            height:450px; 
            margin-top:100px;
            margin-bottom:300px;
        }

        .conbox{
            position:relative; 
            width:100%; 
            top:20px;
            margin-left: auto;
            margin-right: auto;
            height: 300px;
            background-color:rgb(243, 211, 174);
            border-radius: 30px;
        }
        /* -------------------------------------------------------- */
		
        .pageTitle{
            text-align: center;
            margin-top: 30px;
            color: rgb(241, 107, 27);
        }
        
        .tableWrite{
        	margin: auto;
        }
        
        .btn_bottom{
        	text-align: center;
        }
        
        .t_red{
        	color: red;
        }
	</style>
</head>

<body>
<div id="box">
<section id="section">
<div id="conbox">
	<h1 class="pageTitle" align="center">게시글 작성</h1>
		<form action="${ path }/board/boardWrite" enctype="multipart/form-data" method="POST">
			<table class="tableWrite">
				<caption><strong><span class="t_red">*</span> 표시는 필수입력 항목입니다.</strong></caption>
				    <colgroup>
				        <col width="20%">
				        <col width="*">
				    </colgroup>
				    <tbody class="tableWrite">
						<tr>
							<th>제목<span class="t_red">*</span></th>
							<td><input type="text" name="title" class="tbox01" placeholder="제목을 입력해주세요." style="width:350px" required/></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><input type="text" name="writerId" class="tbox01" value="${ loginMember.id }" style="width:350px" readonly></td>
						</tr>
						<tr>
							<th>내용<span class="t_red">*</span></th>
							<td><textarea id="summernote" name="content" style="height:300px; width:350px;" required></textarea></td>
						</tr>
						<tr>
							<th scope="row">첨부파일</th>
							<td><input type="file" name="upfile"></td>
						</tr>
				    </tbody>
			</table>
			<br><br><br>
				<div class="btn_bottom">
					<input type="submit" value="등록하기">
					<button type="button" onclick="location.href='${path}/board/boardView'">목록으로</button>
				</div>
		</form>
</div>
</section>
</div>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
