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
<title>로그인</title>
<!-- css 참조 -->
<link rel="stylesheet" href="${ path }/resources/css/allCss/allCss.css"/>
<link rel="stylesheet" href="${ path }/resources/css/allCss/btnCss.css" />
<link rel="stylesheet" href="${ path }/resources/css/userCss/loginCss.css" />

<!-- ------- -->
<!-- 사용하려는 Font awesome 아이콘 사용 대표링크-->
<script src="https://kit.fontawesome.com/cc18e3ecc9.js" crossorigin="anonymous"></script>

<!-- 폰트 -->
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700&subset=korean">

<script type="text/javascript">
	
	$(document).ready(()=>{
		$("#findPwd").on("click", (e)=>{
			
			const url = "${path}/member/findPwd";
			const status="left=500px, top=200px, width=450px; height=300px";
			
			open(url, "", status);
		});
		
		$("#findId").on("click", (e)=>{
			
			const url = "${path}/member/checkEmail";
			const status="left=500px, top=200px, width=450px; height=300px";
			
			open(url, "", status);
		});	
	});
</script>
</head>
<body>
	<div class="box">
        <h2 class="pageTitle">로그인</h2>
        <div class="conbox">
	        <!-- 로그인 X -->
	        <c:if test="${ loginMember == null }">
			<form action="login" method="POST">
	            <br><br>
	        <table class="loginTable" align="center">
	            <tr>
	                <td><input type="text" name="userId" placeholder="아이디" required></td>
	            </tr>
	            <tr>
	                <td><a class="btnFind" href="javascript:void(window.open('${path}/member/checkEmail', '아이디 찾기', 'width=500px, height=300px'))">아이디 찾기</a></td>
	            </tr>
	            <tr>
	                <td><input type="password" name="userPwd" placeholder="패스워드" required></td>
	            </tr>
	            <tr>
	                <td><a class="btnFind" href="javascript:void(window.open('${path}/member/findPwd', '비밀번호 찾기', 'width=500px, height=300px'))">비밀번호 찾기</a></td>
	            </tr>
	            <tr>
	            	<th></th>
	            	<td></td>
	            </tr>
	            <tr>
	            	<th></th>
	            	<td></td>
	            </tr>
	            <tr>
	                <td>
	                    <label><input type="checkbox" name="saveId" class="saveId" ${ cookie.saveId.value != null ? "checked" : ""}/>아이디 저장</label>
	                </td>
	            </tr>
	            <tr>
	                <td><input type="submit" class="btnLogin" value="로그인"></td>
	            </tr>
	            <tr>
	                <td>
	                    <input type="button" onclick="location.href='${path}/member/enrollCheck'" class="btnEnroll" value="회원가입">
	                </td>
	            </tr>
	        </table>
	        </form>
		</c:if>
		
		<!-- 로그인 O -->
		<c:if test="${ loginMember != null }">
			<br><br>
			<div class="logoutForm">
				${ loginMember.name }님, 안녕하세요.
				<button class="logoutBtn" onclick="location.replace('${path}/logout')">로그아웃</button>
			</div>
		</c:if>
		
		
    </div>
</div>	
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
