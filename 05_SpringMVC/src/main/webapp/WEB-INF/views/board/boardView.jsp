<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트 페이지</title>

<style>
	    /* 전체 틀 ------------------------------------------------- */
        .box{ 
            
            width:100%;
            height:300px; 
            margin-top:100px;
            margin-bottom:90px;
        }

        .conbox{
            position:relative; 
            width:80%; 
            top:20px;
            margin-left: auto;
            margin-right: auto;
            height: 300px;
            background-color:rgb(243, 211, 174);
            border-radius: 30px;
        }
        /* -------------------------------------------------------- */
        
        .boardTitle{
        	text-align: center;
            margin-top: 30px;
            color: rgb(241, 107, 27);
        }
        
        
</style>

</head>

<body>
	<div class="box">
		<h2 class="boardTitle">게시판 조회</h2>
		<div class="conbox"><br>
		
		
		</div>
	</div>
</body>
</html>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
