<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<title>board</title>
</head>
<body>
	<h1>보드 테스트</h1>
	<table>
		<tr>
			<th>번호</th>
			<th>게시자</th>
			<th>제목</th>
			<th>일자</th>
			<th>조회</th>
		</tr>
		<c:forEach items="${serverTime}" var="dto">
			<tr>
				<td>${dto.num}</td>
				<td>${dto.writer}</td>
				<td><c:forEach begin="1" end="${dto.re_level}">--</c:forEach> <a href="content_view?bid=${dto.num}">
						${dto.subject} </a></td>
				<td>${dto.reg_date}</td>
				<td>${dto.readcount}</td>
			</tr>
		</c:forEach>
	</table>
	
	<a class="buttons" href="carmain">carTest</a>
</body>
</html>