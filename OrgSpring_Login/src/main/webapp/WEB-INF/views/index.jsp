<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="/WEB-INF/views/common/header.jsp"%>
<html>
<head>
	<title>Org_Login</title>
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
		
		.topTextBox{
			width: 100%;
			margin-top: 100px;
			top:55%;
			
			
		}
		
	</style>
</head>

<body>
<div class="box">
    <div class="conbox">
        <img src="${path}/resources/images/mainBackground.jpg" style="width:100%; height:600px" />
		
		<!-- 로그인 X
		<c:if test="${ loginMember == null }">
			<form action="login" method="POST">
				아이디 : <input type="text" name="userId" required/><br>
				비밀번호 : <input type="password" name="userPwd" required><br><br>
				
				<input type="submit" value="로그인"/>
			</form>
		</c:if>
		-->
		
		<!-- 로그인 O 
		<c:if test="${ loginMember != null }">
			${ loginMember.name }님, 안녕하세요.
			<button onclick="location.replace('${path}/logout')">로그아웃</button>	
		</c:if>
		-->
		
	</div>
</div>
</body>
</html>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>


