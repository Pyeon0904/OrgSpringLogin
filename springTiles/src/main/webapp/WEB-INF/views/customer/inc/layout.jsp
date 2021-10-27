<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title" /></title>
	<style>
	
	</style>
</head>

<body>
	<h2>메인(layout)</h2>
	
	<!-- header 넣기 -->
	<tiles:insertAttribute name="header" />
	
	<!-- visual 부분 -->
	<tiles:insertAttribute name="visual" />
	
	<!-- side 부분 -->
	<tiles:insertAttribute name="aside" />
	
	<!-- body 부분 -->
	<tiles:insertAttribute name="visual" />
	
	<!-- footer 부분 -->
	<tiles:insertAttribute name="footer" />
	
</body>
</html>