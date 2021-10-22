<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>
	<style>
	
	</style>
</head>

<body>
	<form action="${pageContext.request.contextPath}/login" method="post">

    <input type="text" name="loginId" placeholder="ID">

    <input type="password" name="loginPwd" placeholder="Password">

    <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
    
    <button type="submit">로그인</button>
</form>
</body>
</html>