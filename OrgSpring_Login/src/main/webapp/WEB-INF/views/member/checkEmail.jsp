<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 체크 페이지</title>
<style> 
	div{ 
		position:relative; 	
		height: auto;
		margin-top: auto;
		text-align: center;
		font-size: 25px;
	}
	
	.btn_sign{
		border-radius: 10px;
		background-color: rgb(243, 211, 174);
	}
	
	.btn_sign:hover{
		color: white;
		cursor: pointer;
	}
	
</style> 
</head>
<body>
<div>
	<h2 style="color:rgb(241, 107, 27)">회원 본인인증</h2>
	<form action="checkEmail" method="POST">
		<table align="center">
			<tr>
				<th>이메일</th>
				<td></td>
				<td><input type="email" name="userEmail" id="userEmail" placeholder="입력하세요" required style="height: 30px" /></td>
			</tr>
		</table>
		<br>
		<button class="btn_sign" type="submit" style="width: 255px; height: 30px;">인증하기</button>
	</form>
</div>
<body>

</body>
</html>