<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인 페이지</title>
	
	<style>
	 /* 전체 틀 ------------------------------------------------- */
        .box{ 
            background-color:none;
            width:100%;
            height:auto; 
            margin-top:50px;
            margin-bottom:100px;
            margin-left:670px;
            padding:10px;
        }

        .conbox{
            width:1600px; 
            position:relative; 
            top:20px;
            margin:auto;
        }
        /* -------------------------------------------------------- */

        .loginTitle{
            text-align: center;

        }

        .loginTable{
            
        }

        .search{
            background-color: white;
            font-size: 6px;
        }
	
	</style>
	
</head>
<body>
	<h2 class="loginTitle">로그인</h2>
    <div class="box">
    <div class="conbox">
        <table class="loginTable">
            <tr>
                <td><input type="text" placeholder="아이디"></td>
            </tr>
            <tr>
                <td class="search"><input type="button" value="아이디 찾기"></td>
                <td></td>
            </tr>
            <tr>
                <td><input type="text" placeholder="패스워드"></td>
            </tr>
            <tr>
                <td class="search"><input type="button" value="패스워드 찾기" style="background:none;"></td>
            </tr>
        </table>
    </div>
    </div>
</body>
</html>

