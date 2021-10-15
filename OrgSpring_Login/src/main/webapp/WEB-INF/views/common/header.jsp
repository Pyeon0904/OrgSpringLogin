<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>header 페이지</title>
	
	<!-- 사용하려는 Font awesome 아이콘 사용 대표링크-->
    <script src="https://kit.fontawesome.com/cc18e3ecc9.js" crossorigin="anonymous"></script>
    
    <style>
 	/* 세세한 색을 바꾸려면? 일일이? X */
		/* :root를 사용해 대표 색을 정의해주고! 후에 color: var(--text-color) 로 지정*/
		:root {
		  --text-color: #f0f4f5;
		  --background-color: #263343;
		  --accent-color: #d49466;
		}
		
		body {
		  margin: 0;
		  font-family: 'Source Sans Pro';
		}
		
		a {
		  text-decoration: none;
		  color: var(--text-color);
		}
		
		.navbar {
		  display: flex;
		  justify-content: space-between;
		  align-items: center;
		  background-color: var(--background-color);
		  padding: 8px 12px;
		}
		
		.navbar__logo {
		  font-size: 24px;
		  color: white;
		}
		
		.navbar__logo i {
		  color: teal;
		}
		
		.navbar__menu {
		  display: flex;
		  list-style: none;
		  padding-left: 0;
		}
		
		.navbar__menu li {
		  padding: 8px 12px;
		}
		
		.navbar__menu li:hover {
		  background-color: rgb(241,107,17);
		  border-radius: 4px;
		}
		
		.navbar__icons {
		  list-style: none;
		  color: white;
		  display: flex;
		  padding-left: 0;
		}
		
		.navbar__icons li {
		  padding: 8px 12px;
		}
		
		.navbar__toogleBtn {
		  /*흐름에서 벗어나게! 포지션 앱솔루트!*/
		  position: absolute;
		  display: none;
		  right: 32px;
		  font-size: 24px;
		  color: wheat;
		}
		
		/*flex 형태로 하는 방법*/
		@media screen and (max-width: 768px) {
		  .navbar {
		    flex-direction: column;
		    align-items: flex-start;
		    padding: 8px 24px;
		  }
		
		  .navbar__menu {
		    display: none;
		    flex-direction: column;
		    align-items: center;
		    width: 100%;
		  }
		
		  .navbar__menu li {
		    width: 100%;
		    text-align: center;
		  }
		
		  .navbar__icons {
		    display: none;
		    justify-content: center;
		    width: 100%;
		  }
		
		  .navbar__toogleBtn {
		    display: block;
		  }
		
		  .navbar__menu.active,
		  .navbar__icons.active {
		    display: flex;
		  }
		}
 	
    </style>
    
</head>
<body>
	    <nav class="navbar">
        <div class="navbar__logo">
            <img src="../resources/images/Orange_Logo1.png"/>
            <a href="">Orange-I</a>
        </div>
        <ul class="navbar__menu">
            <li><a href="">메인</a></li>
            <li><a href="../ORG_Login/LoginMain.html">로그인</a></li>
            <li><a href="">회원가입</a></li>
            <li><a href="">게시판</a></li>
        </ul>
        <ul class="navbar__icons">
            <li><i class="fab fa-twitter"></i></li>
            <li><i class="fab fa-instagram"></i></li>
        </ul>

        <a href="#" class="navbar__toogleBtn">
            <i class="fas fa-bars"></i>
        </a>
    </nav>
    

</body>
</html>