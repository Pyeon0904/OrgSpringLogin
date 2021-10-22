<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
	<style>
	
	</style>
</head>

<body>
	<p>현재시간 ${serverTime}</p>
	
	<!-- 로그인중이 아닐 때에만 Login 버튼이 보임  -> taglib ( security/tags ) 때문에 가능 -->
	<sec:authorize access="isAnonymous()">
 		<a href='${pageContext.request.contextPath}/loginPage/'>Login</a>
	</sec:authorize>
	
	<!-- 로그인 중일 경우에만 Logout 버튼이보임 -->
	<sec:authorize access="isAuthenticated()">
		<form action="${pageContext.request.contextPath}/logout" method="POST"> 
			<input id="logoutBtn" type="submit" value="Logout" />
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		</form>
	</sec:authorize>
</body>
</html>