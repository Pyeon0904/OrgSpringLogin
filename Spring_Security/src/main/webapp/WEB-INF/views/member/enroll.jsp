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
<title>회원가입 페이지</title>
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
            width:30%; 
            top:20px;
            margin-left: auto;
            margin-right: auto;
            height: 300px;
            background-color:rgb(243, 211, 174);
            border-radius: 30px;
        }
        /* -------------------------------------------------------- */
        
        .enrollTitle{
        	text-align: center;
            margin-top: 30px;
            color: rgb(241, 107, 27);
        }
	</style>

</head>

<body>
<div class="box">
<h2 class="enrollTitle">회원가입</h2>
<div class="conbox"><br>
	<section id="content">
	<div id="enroll-container">
		<form name="memberEnrollFrm" action="${ path }/member/enroll" method="POST">
			<table align="center">
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="id" id="newId" placeholder="아이디(4글자이상)" required />
						<input type="button" id="checkDuplicate" value="중복검사" />
					</td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td>
						<input type="password" name="password" id="pass1" required /> 
					</td>
				</tr>
				<tr>
					<th>패스워드 확인</th>
					<td>
						<input type="password" id="pass2"/> 
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="name" required />
					</td>
				</tr>
				<tr>
					<th>휴대폰</th>
					<td>
						<input type="tel" name="phone" maxlength="11" placeholder="(-없이)01012345678">
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="email" name="email" placeholder="abc@abc.com" />
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name="address" />
					</td>
				</tr>
				<tr>
					<th>취미</th>
					<td>
						<label><input type="checkbox" name="hobby" value="운동"/>운동</label>
						<label><input type="checkbox" name="hobby" value="등산"/>등산</label>
						<label><input type="checkbox" name="hobby" value="독서"/>독서</label>
						<label><input type="checkbox" name="hobby" value="게임"/>게임</label>
						<label><input type="checkbox" name="hobby" value="여행"/>여행</label>
					</td>
				</tr>
			</table>
			
			<br>
			
			<div align="center">
				<input type="submit" id="enrollSubmit" value="가입"/>
				<input type="reset" value="취소"/>
			</div>
				
			</form>
		 	<form name="checkIdForm">
		 		<input type="hidden" name="userId">
		 	</form>
		</div>
	</section>
	
<!-- <script>
		$(document).ready(() => {
			$("#pass2").blur((event) => {
				let pass1 = $("#pass1").val();			
				let pass2 = $(event.target).val();
				
				if(pass1.trim() != pass2.trim()) {
					alert("비밀번호가 일치하지 않습니다.");
					
					$("#pass1").val("");
					$(event.target).val("");
					$("#pass1").focus();
				}
			});
	    	
		    $("#enrollSubmit").on("click", () => {
		    	// TODO 전송하기 전에 각 영역에 유효성 검사로직을 추가하는 부분!
		    	// 유효성 검사 후 전송하도록 만들어보세요^^
		    	
		    	//return false;
		    });
		    
		 	// 아이디 중복을 확인 처리 콜백함수
			$("#checkDuplicate").on("click", () => {
				
				}
			});
		});
	</script> -->
	
	</div>
</div>
	
</body>
</html>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
