<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        { 
            font-family: 'NanumGothic';
        }

        /* 전체 틀 ------------------------------------------------- */
        .box{ 
            
            width:100%;
            height:300px; 
            margin-top:100px;
            margin-bottom:300px;
        }

        .conbox{
            position:relative; 
            width:30%; 
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

        a { 
            text-decoration:none;
        } 

    </style>

</head>
<body>
	<div class="box">
        <h2 class="loginTitle">로그인</h2>
        <div class="conbox">
        <table class="loginTable">
            <br><br>
            <tr>
                <td><input type="text" placeholder="아이디"></td>
            </tr>
            <tr>
                <td><input type="button" class="btnSearch" value="아이디 찾기"></td>
                <td></td>
            </tr>
            <tr>
                <td><input type="text" placeholder="패스워드"></td>
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
                <td><input type="button" class="btnLogin" id="" value="로그인"></td>
            </tr>
            <tr>
                <td>
                    <a href="../ORG_Login/EnrollMain.html">
                        <input type="button" class="btnEnroll" value="회원가입">
                    </a>
                </td>
            </tr>
        </table>

        <a href="#">
            <i class="fab fa-twitter"></i>
        </a>
        <a href="#">
            <i class="fab fa-instagram"></i>
        </a>
        
    </div>
    </div>
<body>

</body>
</html>