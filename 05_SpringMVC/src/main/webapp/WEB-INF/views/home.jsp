<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
<head>
	<title>Org_Login</title>
	<style>
	
	</style>
</head>

<body>
<h1>Login 페이지</h1>

<!-- 로그인 X -->
<c:if test="${ loginMember == null }">
	<form action="login" method="POST">
		아이디 : <input type="text" name="userId" required/><br>
		비밀번호 : <input type="password" name="userPwd" required><br><br>
		
		<input type="submit" value="로그인"/>
	</form>
</c:if>

<!-- 로그인 O -->
<c:if test="${ loginMember != null }">
	${ loginMember.name }님, 안녕하세요.
	<button>로그아웃</button>	
</c:if>

</body>
</html>
