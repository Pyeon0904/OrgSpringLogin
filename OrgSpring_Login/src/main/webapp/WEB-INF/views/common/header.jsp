<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>header 페이지</title>
	
	<!-- 사용하려는 Font awesome 아이콘 사용 대표링크-->
    <script src="https://kit.fontawesome.com/cc18e3ecc9.js" crossorigin="anonymous"></script>
    
</head>
<body>
	<nav class="navbar">
		<div class="navbar_logo">
			<a href="">
				<img class="logo" src="<%= request.getContextPath() %>/resources/images/Orangei_Logo1.png">
			</a>
		</div>
		
		<ul class="navbar_menu">
			<li><a href="../views/member/login">메인</a></li>
			<li><a href="<%= request.getContextPath() %>/member/login.jsp">로그인</a></li>
			<li><a href="<%= request.getContextPath() %>/views/member/login">회원가입</a></li>
			<li><a href="<%= request.getContextPath() %>/views/member/login">게시판</a></li>
			
		</ul>
		<ul>
			<li><i class="fab fa-instagram"></i></li>
		</ul>
		
		<a href="#" class="navbar__toogleBtn">
            <i class="fas fa-bars"></i>
        </a>
	</nav>
	<hr id="OrgLine" style="background-color:rgba(241, 107, 17); height:2px;">

</body>
</html>