<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<html>
<head>
	<title>Org_Login</title>
	<style>
		/* 전체 틀 ------------------------------------------------- */
        .box{ 
            width:100%;
            height:400px; 
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
	</div>
</div>
	<h2>MAKE THE NEW FUTURE</h2>
	<h4>새로운 미래를 만들어 갑니다.</h4>
</body>
</html>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>