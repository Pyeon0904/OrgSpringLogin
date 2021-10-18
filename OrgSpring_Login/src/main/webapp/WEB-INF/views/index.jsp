<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!Doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700&subset=korean" rel="stylesheet">
	
	<title>메인페이지</title>
	<style>
	
	</style>
</head>

<body>
	<form action="login" method="POST">
	아이디 : <input type="text" name="userId" required/><br>
	비밀번호 : <input type="password" name="userPwd" required>
	
	<input type="submit" value="로그인"/><br><br>
	
	<input type="button" onclick="${path}/member/login" value="로그인창"/>
</form>
</body>
</html>


