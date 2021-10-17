<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="false" %>
<html>
<head>
	<title>SpringMVC</title>
	<style>
	
	</style>
</head>

<body>
<h1>Main</h1>
<form action="login" method="POST">
	아이디 : <input type="text" name="userId" required/><br>
	비밀번호 : <input type="password" name="userPwd" required>
	
	<input type="submit" value="로그인"/>
</form>

</body>
</html>
