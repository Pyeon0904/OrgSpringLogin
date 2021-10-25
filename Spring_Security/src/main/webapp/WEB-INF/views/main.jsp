<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!DOCTYPE html>

<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인페이지</title>
	<style>
		/* 전체 틀 ------------------------------------------------- */
        .box{ 
            
            width:100%;
            height:1000px; 
            margin-top:auto;
            margin-bottom:90px;
        }

        .conbox{
            position:relative; 
            width:100%; 
            margin-top: auto;
            margin-left: auto;
            margin-right: auto;
            height: 300px;
            background-color:none;
            border-radius: 30px;
        }
        /* -------------------------------------------------------- */
		
		
		.loginButton{
			color : black;
		}
	</style>

</head>
<body>
<div class="box">
    <div class="conbox">
        <img src="${path}/resources/images/mainBackground.jpg" style="width:100%; height:600px" />
		
	<!-- 로그인 중이 아닐 때에만 Login 버튼이 보임  -> taglib ( security/tags ) 때문에 가능 -->
	<sec:authorize access="isAnonymous()">
 		<a class="loginButton" href='${pageContext.request.contextPath}/loginPage/'>로그인</a>
	</sec:authorize>
	
	<!-- 로그인 중일 경우에만 Logout 버튼이보임 -->
	<sec:authorize access="isAuthenticated()">
		<form action="${pageContext.request.contextPath}/logout" method="POST"> 
			<input id="logoutBtn" type="submit" value="Logout" />
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		</form>
	</sec:authorize>
	</div>
</div>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
