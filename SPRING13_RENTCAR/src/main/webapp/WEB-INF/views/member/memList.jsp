<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>회원출력</title>
	<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		session = request.getSession();
	%>
</head>

<body>
	<h2 align="center"><a href="/rentcar/member/">홈으로</a></h2><hr>
	<h2>회원명단</h2>
	<table width="700" border="1" align="center">
		<tr>
			<th>아이디</th>
			<th>패스워드</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>연령대</th>
			<th>직업</th>
			<th>취미</th>
			<th>편집</th>
		</tr>
		<c:forEach items="${memList}" var="dto">
			<tr align="center">
				<td>${dto.id }</td>
				<td>${dto.pass }</td>
				<td>${dto.email }</td>
				<td>${dto.tel }</td>
				<td>${dto.age }</td>
				<td>${dto.job }</td>
				<td>${dto.hobby }</td>
				<td><button onclick="location.href='memDelete?id=${dto.id}'">삭제</button></td>
			</tr>
		</c:forEach>
	</table>
	<div class="menu" align="right">
		<a href="/rentcar/member/batchForm">회원 배치작업</a>
	</div>
	<hr>
</body>
</html>