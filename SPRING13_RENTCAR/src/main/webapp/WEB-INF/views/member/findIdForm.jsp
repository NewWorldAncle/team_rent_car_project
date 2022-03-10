<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>아이디찾기</title>
</head>

<body>
	<h3>아이디 찾기</h3>
	<form action="findId" method="post">
		<div class="insertPart">
			<label>이메일</label>
			<input type="text" name="email" required>
		</div>
		<div class="menuPart">
			<input type="submit" value="찾기">
			<input type="button" value="돌아가기" onclick="javascript:window.close()">
		</div>
		
	</form>
</body>
</html>