<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>아이디 찾기 결과</title>
</head>

<body>
	<h3>아이디 찾기 검색결과</h3>
	<div>
		<h4>${id }</h4><p/>
		<button type="button" onclick="javascript:window.close()">로그인</button>
		<button type="button" onclick="history.go(-1)">취소</button>
	</div>
</body>
</html>