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
		<h2>게시판 작성</h2>
	<div id='board-write-container'>
		<form action="${ path }/board/write" method="POST" 
					enctype="multipart/form-data">
			<table id='tbl-board'>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" id="title"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="writerId" value="${ loginMember.id }" readonly></td>
				</tr>
				<tr>
					<th>첨부파일1</th>
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
					<td><textarea name="content" cols="50" rows="15" ></textarea></td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" value="등록">
						<input type="reset" value="취소">
					</th>
				</tr>
			</table>
		</form>
	</div>
</div>
</section>
</div>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
