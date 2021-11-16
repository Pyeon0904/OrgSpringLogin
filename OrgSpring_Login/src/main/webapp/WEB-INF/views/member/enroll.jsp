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
<!-- css 참조 -->
<link rel="stylesheet" href="${ path }/resources/css/allCss/allCss.css"/>
<link rel="stylesheet" href="${ path }/resources/css/allCss/btnCss.css" />
<!-- ------- -->

<script src="${ path }/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<style>
        /* 하단 버튼 ----------------------------------------  */
        #enrollSubmit, #enrollCancel, .checkDuplicate {
        	border-radius:10px;
        	background-color: transparent;	
        	width: 100px;
        }
        
        #enrollSubmit:hover, #enrollCancel:hover{
        	color: white;
        	background-color:rgb(246, 189, 102);
        }
        /* ------------------------------------------------- */
        
        /* Table 간격 조정-------------------------------- */
     	td { width: 300px; padding: 10px; }
        th { width: 350px; }
        /* --------------------------------------------- */
        
        /* 유효성 검사 필터 색 강조(red)--------------------- */
        .id.regex, .pw.regex, .name.regex, .phone.regex, .email.regex { color: red; }
        /* --------------------------------------------- */
	</style>
	
	<!-- 유효성 검사로직 ------------------------------------------------------- -->
	<script>

			/* this / e.target 
			// 아이디 유효성 검사
			document.addEventListener('DOMContentLoaded', function() {
				document.getElementById('newId').addEventListener('input', function(e) {
					var id = this.id.trim();
				});
			});
			
			document.getElementById('newId').addEventListener("input", function(){
				validId(this.value.trim());
			});
			
			var id = document.getElementById("newId");
			id.addEventListener("input", function(valiId) {
			});
			
			document.getElementById('newId').addEventListener('input', function(e) {  
				valiId(e.target.value.trim()); 
			});
			*/
			
		// 유효성 검사(JavaScript) ----------------------------------------------------------
		// $(document).ready(() => {
			/*
			// 아이디 유효성 검사 (jQuery)
				$("#newId").on("input", function(){
					let id = $("#newId").val().trim();
					valiId(id);
				});
			*/	
			// 아이디 유효성검사(js)
			document.getElementById('newId').addEventListener('input', function(e) {
				var id = document.getElementById('newId').value.trim();
				console.log(id);
				valiId(id);
			});
			
			/*
			// 비밀번호 유효성 검사
			$("#pass1").on("input", function(){
				let pw = $("#pass1").val().trim();
				valiPw(pw);
			});
			*/
			// 비밀번호 유효성 검사
			document.getElementById('pass1').addEventListener('input', function(e){
				var pw = document.getElementById('pass1').value.trim();
				console.log(pw);
				valiPw(pw);
			});
			
			/*
			// 이메일 유효성 검사
		    $("#email").on("input",function(){
		    	valiEmail();
		    });
			*/
			// 이메일 유효성 검사
			document.getElementById('email').addEventListener('input', function(e) {
				console.log(email);
				valiEmail(); 	// 유효성 검사
				emailSelect();  // 이메일 선택(dropbox)
			});
			
		});	
		
		$(document).ready(() => {
			// 비밀번호 일치여부
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
		});
		
// 정규식 적용-------------------------------------------------------------------
		// (정규식) 아이디
		function valiId(id){
		 	var checkNumber = /[^0-9]/;
		 	var checkEnglish =  /[^a-zA-Z]/;
		 	var checkBlank = /[\s]/;
			var checkKorean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
			var checkspe = /[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/;
		 	   
		    if(id.length < 4 || id.length > 12){
		    	//$(".id.regex").html("영문,숫자를 혼합 4-12자리");
		    	document.querySelector('.id').innerHTML="영문,숫자를 혼합 4-12자리";
			}else if(checkKorean.test(id)){
		     	//$(".id.regex").html("한글을 포함할 수 없습니다.");
				document.querySelector('.id').innerHTML="한글을 포함할 수 없습니다.";
		    }else if(!checkEnglish.test(id)||!checkNumber.test(id)){
		     	//$(".id.regex").html("영문,숫자를 혼합하여 입력해주세요.");
		     	document.querySelector('.id').innerHTML="영문,숫자를 혼합하여 입력해주세요.";
		    }else if(checkBlank.test(id)){
		        //$(".id.regex").html("공백을 포함할 수 없습니다.");
		        document.querySelector('.id').innerHTML="공백을 포함할 수 없습니다.";
		    }else if(checkspe.test(id)){
		        //$(".id.regex").html("특수문자를 포함할 수 없습니다.");
		        document.querySelector('.id').innerHTML="특수문자를 포함할 수 없습니다.";
		    }else{
		     	//$(".id.regex").html("");
		     	document.querySelector('.id').innerHTML="";
		    return true;
			}
		}
		
		// (정규식) 비밀번호
		function valiPw(pw) {
			var checkNumber = /[^0-9]/;
		 	var checkEnglish =  /[^a-zA-Z]/;
		 	var checkBlank = /[\s]/;
		 	var checkKorean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		 	var checkspe = /[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/;
		 	   
		    if(pw.length < 8 || pw.length > 12){
		    	//$(".pw.regex").html("영문,숫자,특수문자 혼합 8-12자리");
		    	document.querySelector('.pw').innerHTML="영문,숫자,특수문자 혼합 8-12자리";
		    }else if(checkKorean.test(pw)){
		     	//$(".pw.regex").html("한글을 포함할 수 없습니다.");
		    	document.querySelector('.pw').innerHTML="한글을 포함할 수 없습니다.";
		    }else if(!checkEnglish.test(pw)||!checkNumber.test(pw)||!checkspe.test(pw)){
		     	//$(".pw.regex").html("영문,숫자,특수문자를 혼합하여 입력해주세요.");
		    	document.querySelector('.pw').innerHTML="영문,숫자,특수문자를 혼합하여 입력해주세요.";
		    }else if(checkBlank.test(pw)){
		        //$(".pw.regex").html("공백을 포함할 수 없습니다.");
		    	document.querySelector('.pw').innerHTML="공백을 포함할 수 없습니다.";
		    }else{
		     	//$(".pw.regex").html("");
		     	document.querySelector('.pw').innerHTML="";
		    return true;
		    }
		}
		
		// (정규식) 이메일
		function valiEmail(){
	 		var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	        var result = regex.exec($("#email").val());
	       
	       if(result != null){
	           //$(".email.regex").html("");
	           document.querySelector('.email').innerHTML="";
	           return true;
	       }else{
	           //$(".email.regex").html("올바른 이메일 형식이 아닙니다.");
	    	   document.querySelector('.email').innerHTML="올바른 이메일 형식이 아닙니다.";
	       }
	 	}
		
		// 이메일 선택부분(selectBox)
	    function emailSelect() {
	        var m = document.getElementById("email");
	        if (m.value != "") {
	            m.value = m.value + document.getElementById("email_Select").value;
	            var n = m.value.split("@")[0];
	            m.value = n + document.getElementById("email_Select").value;
	            
	            if(document.getElementById("email_Select").value != ""){
	            	//$(".email.regex").html("");
	            	document.querySelector('.email').innerHTML="";
	            }else{
	            	//$(".email.regex").html("올바른 이메일이 아닙니다.");
	            	document.querySelector('.email').innerHTML="올바른 이메일이 아닙니다.";
	            }
	        }
	    }
		// ------------------------------------------------------------------------------
	
		
	//$(document).ready(() => {
		
		// 아이디 중복확인
	document.addEventListener('DOMContentLoaded', function() {	
		document.getElementById('checkDuplicate').addEventListener('click', function(e) {
			var id = document.getElementById('checkDuplicate').value.trim();
			
			if (id.length < 4) {
				document.querySelector('checkDuplicate').innerHTML="아이디는 최소 4글자 이상 입력하세요.";
			}
		});
	
		/*
		// 아이디 중복을 확인 처리 콜백함수
		$("#checkDuplicate").on("click", () => {
			let id = $("#newId").val().trim();
			
			if (id.length < 4) {
				alert("아이디는 최소 4글자 이상 입력하세요.")
				
				return;
			}
		*/	

/* [Ajax -> Axios]
			$.ajax({
		        type: "get",
		        url: "${path}/member/idCheck",
		        dataType: "json",
		        data: {
		            id // 속성의 키값과 변수명이 동일할 경우
		        },
		        success: function(data) {
		            console.log(data);
		            
		            if(data.validate === true) {
		                alert("이미 사용중인 아이디 입니다.");
		            } else {
		                alert("사용 가능한 아이디 입니다.");							
		            }
		        },
		        error: function(e) {
		            console.log(e);
		        }
		    });
*/

// [Ajax -> Axios]
			axios({
				method: "get",
				url: `${path}/member/idCheck`, //url: "${path}/member/idCheck?id=1"
				params: {
					id: "id"
				},
			})
			.then(function(params) {
					console.log(params);

				if(params.validate === true) {
					alert("이미 사용중인 아이디 입니다.");
				} else {
					alert("사용 가능한 아이디 입니다.");							
				}
			})
			.catch(function(e) {
					console.log(e);
				});
			});
	
		 //회원가입 버튼 눌렀을 때, 빈칸 있으면 다시 유효성 검사진행     
		/*
		 $("#enrollSubmit").on("click",function(){
	    	   var id = $("#newId").val().trim();
	    	   var pw = $("#pass1").val().trim();
	    	   var email = $("#email").val().trim();
	    	   */
		
		document.addEventListener('DOMContentLoaded', function() {
	       document.getElementById('enrollSubmit').addEventListener('click', function(e) {
	    	   var id = document.getElementById('newId').val().trim();
	    	   var pw = document.getElementById('pass1').val().trim();
	    	   var email = document.getElementById('email').val().trim();
	       });
	    	   if(!valiId(id)){
	    		   alert("아이디 양식을 다시 확인해주세요");
	    		   return;
	    	   }
	    	   
	    	   if(!valiPw(pw)){
	    		   alert("비밀번호 양식을 다시 확인해주세요");
	    		   retrun;
	    	   }
	    	  
	    	   if(!valiEmail(email)){
	    		   alert("이메일 양식을 다시 확인해주세요");
	    		   retrun;
	    	   }
	    	   
	    	 //아이디 중복체크를 하지 않았으면 전송되지 않도록
	    	   if($("#checkid").val()!="통과"){
	    	        alert('아이디 중복확인 해주세요.');
	    	        return;
	    	    }
	    	 
	    	 // 빈칸 없을 때 제출
	    	   ${"join_content"}.submit();
	       
		});
	});
		
	</script>
</head>

<body>
<div class="box">
<h2 class="pageTitle">회원가입</h2>
<div class="conbox"><br>
	<section id="content">
	<div id="enroll-container">
		<form name="memberEnrollFrm" action="${ path }/member/enroll" method="POST">
			<br>
			<table align="center" rules="rows" frame="hsides">
				<tr>
					<th>아이디</th>
					<td width="300px;">
						<input type="text" name="id" id="newId" placeholder="아이디(4글자이상)" required />
						<input type="button" id="checkDuplicate" value="중복검사" />
					</td>
					<td><div class="id regex" id="id regex"></div></td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td><input class="member_pw" type="password" name="password" id="pass1" required /></td>
					<td><div class="pw regex"></div></td>
				</tr>
				<tr>
					<th>패스워드 확인</th>
					<td>
						<input class="member_pw" type="password" id="pass2"/> 
						<div class="repw regex"></div>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="name" required />
						<div class="name regex"></div>
					</td>
				</tr>
				<tr>
					<th>휴대폰</th>
					<td>
						<input type="tel" name="phone" maxlength="11" placeholder="(-없이)01012345678">
						<div class="phone regex"></div>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="email" name="email" id="email" placeholder="abc@abc.com" />
						<select class="email_Select" id="email_Select" onchange="emailSelect();">
								<option value="" selected>직접입력</option>
								<option value="@naver.com">naver.com</option>
								<option value="@gmail.com">gmail.com</option>
								<option value="@daum.com">daum.com</option>
						</select>
					</td>
					<td><div class="email regex"></div></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address" /></td>
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
			
			<br><br><br><br>
			
			<div align="center">
				<input type="submit" id="enrollSubmit" value="가입"/>
				<input type="reset" id="enrollCancel" value="취소"/>
			</div>
				
			</form>
		 	<form name="checkIdForm">
		 		<input type="hidden" name="userId">
		 	</form>
		</div>
	</section>
	</div>
</div>
</body>
</html>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
