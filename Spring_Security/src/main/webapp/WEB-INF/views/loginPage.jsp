<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>
	<style>
        /* 전체 틀 ------------------------------------------------- */
        .box{ 
            
            width:100%;
            height:400px; 
            margin-top:100px;
            margin-bottom:300px;
        }

        .conbox{
            position:relative; 
            width:40%; 
            top:20px;
            margin-left: auto;
            margin-right: auto;
            height: 300px;
            background-color:rgb(243, 211, 174);
            border-radius: 30px;
        }
        /* -------------------------------------------------------- */
		
		/*페이지 헤더 */
		.loginTitle{
            text-align: center;
            margin-top: 30px;
            color: rgb(241, 107, 27);
        }
        
        /* 로그인 폼 전체 */
        .loginForm{
        	text-align: center;
        }
        
        /* 자동로그인 체크박스 */
        .autoLogin{
        	text-align:left;
        }
		
		/* 로그인 / 회원가입 버튼-------------------------- */
        .btnLogin, .btnEnroll{
            margin-top: 15px;
            height: 30px;
            width: 170px;
            background-color: transparent;
            border-radius: 10px;
        }


        .btnEnroll:hover, .btnLogin:hover{
            background-color:rgb(246, 189, 102);
            color: white;
        }
        /*-----------------------------------------------*/
		
		.kakaoImg{
			text-align: right;
		}
		
	</style>
</head>
<body>
	<div class="box">
        <h2 class="loginTitle">로그인</h2>
        <div class="conbox">
    	<br><br><br>
		<form class="loginForm" action="${pageContext.request.contextPath}/login" method="post">
		    <input type="text" name="loginId" placeholder="ID"><br>
		
		    <input type="password" name="loginPwd" placeholder="Password"><br>
		
		    <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
		    
		    <input class="autoLogin" name="remember-me" type="checkbox"/>자동 로그인<br><br><br>
		    
		    <button type="submit" class="btnLogin">로그인</button>
		    <input type="button" class="btnEnroll" value="회원가입">
		    <br><br>
		</form>
		<div class="kakaoImg">
		<!-- Kakao 로그인 관련 -->
		<a href="javascript:kakaoLogin();"><img src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png" style="height:40px; width:auto; border-radius: 30px;"/></a>
	    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	    <script>
	        //Javascript 키 : 	50bcd66db0433545cd97827ffda1fc2a
	        window.Kakao.init("50bcd66db0433545cd97827ffda1fc2a"); // 어느 애플리케이션이 연동될지 key 입력
	
	        function kakaoLogin(){
	            window.Kakao.Auth.login({
	                scope:'profile_nickname, account_email, gender',
	                success: function(authObj){
	                    console.log(authObj);
	                    window.Kakao.API.request({
	                        url:'/v2/user/me',
	                        success: res => {
	                            const kakao_account = res.kakao_account;
	                            console.log(kakao_account);
	                        }
	                    });
	                }
	            });
	        }
   		</script>
   		</div>
		</div>
	</div>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
