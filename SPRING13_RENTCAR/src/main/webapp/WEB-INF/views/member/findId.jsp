<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>아이디 찾기 결과</title>
	<link href="${path}/resources/css/find.css" rel="stylesheet" />
</head>

<body>
	<div class="find_head">
	<h3 >아이디 찾기 검색결과</h3>
	</div>
	<div class="insertPart">
		<h4 class="findid">${id }</h4><p/>
	</div>
	<div class="menuPart">
		<input class="ok_button" type="button" value="로그인 " onclick="javascript:window.close()">
		<input class="no_button" type="button" value="취소 " onclick="javascript:window.history.go(-1)">
	</div>
</body>
</html>