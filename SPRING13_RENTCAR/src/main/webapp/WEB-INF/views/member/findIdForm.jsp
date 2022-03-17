<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>아이디찾기</title>
	<link href="${path}/resources/css/find.css" rel="stylesheet" />
</head>

<body>
	<div class="find_head">
		<h3>아이디 찾기</h3>
	</div>
	<form action="findId" method="post">
		<div class="insertPart">
			<label>이메일</label>
			<input type="text" name="email" required>
		</div>
		<div class="menuPart">
			<input class="ok_button" type="submit" value="찾기">
			<input class="no_button" type="button" value="돌아가기" onclick="javascript:window.close()">
		</div>
		
	</form>
</body>
</html>