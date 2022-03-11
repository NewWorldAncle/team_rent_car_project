<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>렌트카</title>
	<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		session = request.getSession();
	%>
</head>

<body>
	<h1>렌트카 카탈로그</h1>
	<%	// 로그인 X
		if(session.getAttribute("login") == null) {
	%>
	<h2><a href="/rentcar/">V-RENTCAR</a></h2><hr>
	<% 
		}
		// 로그인 O
		if(session.getAttribute("login") != null) {
	%>
	<h2><a href="/rentcar/member/">V-RENTCAR</a></h2><hr>
	<% 
		}
	%>
	
		<table>
		<tr>
			<th>번호</th>
			<th>모델명</th>
			<th>종류</th>
			<th>가격</th>
			<th>인승</th>
			<th>제조사</th>
			<th>이미지</th>
			<th>상세정보</th>
			<th>편집</th>
		</tr>
		<c:forEach items="${carList}" var="dto">
			<tr>
				<td>${dto.no}</td>
				<td>${dto.name}</td>
				<td>
					<c:set var="category" value="${dto.category}"/>
						<c:choose>
							<c:when test="${category eq '1'}">
								소형
							</c:when>
							<c:when test="${category eq '2'}">
								중형
							</c:when>
							<c:when test="${category eq '3'}">
								대형
							</c:when>
							<c:otherwise>
								정보없음
							</c:otherwise>
						</c:choose>
				</td>
				<td>${dto.price}</td>
				<td>${dto.usepeople}</td>
				<td>${dto.company}</td>
				<td><img src="<spring:url value='/resources/img/${dto.img}'/>" alt="car" width="200" height="150"></td>
				<td>${dto.info}</td>
				<td>
					<button onclick="location.href='delete?no=${dto.no}'">삭제</button>
					<button onclick="location.href='updateView?no=${dto.no}'">수정</button>
				</td>
			</tr>
		</c:forEach>
	</table>
	<a href="register">차량 등록</a>
	
</body>
</html>