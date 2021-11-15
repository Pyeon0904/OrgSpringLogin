<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
	
<html>
<head>
<title>Org_Login</title>
<!-- css 참조 -->
<link rel="stylesheet" href="${ path }/resources/css/homeCss.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<!-- ------- -->

<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>

<body>
<div class="box">
    <div class="conbox">
        <img src="${path}/resources/images/mainBackground.jpg" style="width:100%; height:600px" />
		<div class="pageTitle">
			<h1>MAKE THE NEW FUTURE</h1>
			<h3>새로운 미래를 만들어 갑니다.</h3>
		</div>
	</div>
</div>
<div id="grid"></div>

<script>
<%--
document.addEventListener('DOMContentLoaded', function() {	
	axios({
		method: "get",
		url: `${path}/member/idCheck`, //url: "${path}/member/idCheck?id=1"
		params: {
			id: "id"
		},
	})
	.then(function() {
		console.log(result);	
	});
	}
--%>

window.onload = function(){
	$.ajax({
        method :"GET",
        url : "${path}/board/list",
        dataType : "JSON",
        success : function(result){
            grid.resetData(result);
        }
    });

    var grid = new tui.Grid({
        el: document.getElementById('grid'),
        data: gridData,
        scrollX: false,
        scrollY: false,
        columns: [
          {
            header: '번호',
            name: 'no',
          },
          {
            header: '제목',
            name: 'title',
          },
          {
            header: '작성자',
            name: 'writerId'
          },
          {
            header: '작성일',
            name: 'createDate'
          },
          {
            header: '첨부파일',
            name: 'originalFilename'
          }
        ]
      });
      };


      var gridData = [
    	  {
    		  no: 1,
    		  title: '안녕하세요',
    		  writerId: 'jjp',
    		  createDate: '2020.10.20',
    		  originalFilename: 123123
    	  }
      ];
</script>

</body>
</html>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
