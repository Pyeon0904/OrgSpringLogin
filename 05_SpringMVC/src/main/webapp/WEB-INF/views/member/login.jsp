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
    <!-- 사용하려는 Font awesome 아이콘 사용 대표링크-->
    <script src="https://kit.fontawesome.com/cc18e3ecc9.js" crossorigin="anonymous"></script>

    <!-- 폰트 -->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700&subset=korean">

    <style>
        html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video 
        { font-family: 'NanumGothic'; }

        /* 전체 틀 ------------------------------------------------- */
        .box{ 
            
            width:100%;
            height:200px; 
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
		
        .loginTitle{
            text-align: center;
            margin-top: 30px;
            color: rgb(241, 107, 27);
        }

        .loginTable{
            margin: auto;
        }

        /*찾기버튼 : 아이디 / 패스워드--------------------- */
        .btnSearch{
            background-color: transparent;
            color: darkgray;
            border: 0;
            outline: 0;
        }

        .btnSearch:hover{
            color:rgb(246, 189, 102);
        }
        /* ---------------------------------------------- */

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

        .saveId{
            float: left;
            font-size: 5px;
        }
		
		/* 로그인 후, 로그아웃 폼 */
		.logoutForm{
			text-align:right;
		}
		
        a { 
            text-decoration:none;
        } 
			
		.kakaoImg{
			text-align: right;
		}
		
    </style>

</head>
<body>

	<div class="box">
        <h2 class="loginTitle">로그인</h2>
        <div class="conbox">
	        <!-- 로그인 X -->
	        <c:if test="${ loginMember == null }">
			<form action="login" method="POST">
	        <table class="loginTable" align="center">
	            <br><br>
	            <tr>
	                <td><input type="text" name="userId" placeholder="아이디" required></td>
	            </tr>
	            <tr>
	                <td><input type="button" class="btnSearch" value="아이디 찾기"></td>
	                <td></td>
	            </tr>
	            <tr>
	                <td><input type="password" name="userPwd" placeholder="패스워드" required></td>
	            </tr>
	            <tr>
	                <td><input type="button" class="btnSearch" value="패스워드 찾기"></td>
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
	                    <input type="button" onclick="location.href='${path}/member/enroll'" class="btnEnroll" value="회원가입">
	                </td>
	            </tr>
	        </table>
	
	        <!-- <a href="#">
	            <i class="fab fa-twitter"></i>
	        </a>
	        <a href="#">
	            <i class="fab fa-instagram"></i>
	        </a>  -->
	        </form>
		</c:if>
		
		<!-- 로그인 O -->
		<c:if test="${ loginMember != null }">
			<div class="logoutForm">
			${ loginMember.name }님, 안녕하세요.
			<button onclick="location.replace('${path}/logout')">로그아웃</button>
			</div>
		</c:if>
		
		<!-- 로그인이 안 되어있을 때 -->
		<c:if test="${ loginMember == null }">       
			<div class="kakaoImg">
			<!-- Kakao 로그인 관련 -->
			<a href="javascript:kakaoLogin();"><img src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png" style="height:40px; width:auto; border-radius: 30px;"/></a>
		    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
		    <script>
		        //Javascript 키 : 	427203f7175b539affe5f0ed8831e4a2
		        window.Kakao.init("427203f7175b539affe5f0ed8831e4a2"); // 어느 애플리케이션이 연동될지 key 입력
		
		        function kakaoLogin(){
		            window.Kakao.Auth.login({
		                scope:'profile_nickname, account_email, gender, age_range, birthday',
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
   		</c:if>
    </div>
</div>	
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
