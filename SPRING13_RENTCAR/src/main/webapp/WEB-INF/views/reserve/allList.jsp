<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>전체 예약목록</title>
	<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		session = request.getSession();
	%>
</head>

<body>
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
	<h3>전체 예약목록</h3>
	
	<div class="main" align="center">
		<table border="1">
			<tr>
				<th>예약번호</th>
				<th>예약자ID</th>
				<th>차량이미지</th>
				<th>차량이름</th>
				<th>대여일</th>
				<th>대여일수</th>
				<th>차량대수</th>
				<th>차량단가</th>
				<th>차량이용료</th>
				<th>보험</th>
				<th>보험요금</th>
				<th>WIFI</th>
				<th>WIFI요금</th>
				<th>NAVI</th>
				<th>아동시트</th>
				<th>아동시트요금</th>
				<th>총비용</th>
				<th>예약관리</th>
			</tr>
		<c:forEach items="${allViewData}" var="dto">
			<tr align="center">
				<td>${dto.regno }</td>
				<td>${dto.memid }</td>
				<td><img src="<spring:url value='/resources/img/${dto.img}'/>" alt="car" width="150" height="100"></td>
				<td>${dto.name }</td>
				<td>${dto.rday }</td>
				<td>${dto.dday }</td>
				<td>${dto.qty }</td>
				<td>${dto.price }</td>
				<td>${dto.fee }</td>
				<td>
					<c:choose>
						<c:when test = "${dto.insurance eq 0}">비적용</c:when>
						<c:when test = "${dto.insurance ne 0}">적용</c:when>
					</c:choose>
				</td>
				<td>${dto.insu_fee }</td>
				<td>
					<c:choose>
						<c:when test = "${dto.wifi eq 0}">비적용</c:when>
						<c:when test = "${dto.wifi ne 0}">적용</c:when>
					</c:choose>
				</td>
				<td>${dto.wifi_fee }</td>
				<td>
					<c:choose>
						<c:when test = "${dto.navigation eq 0}">비적용</c:when>
						<c:when test = "${dto.navigation ne 0}">적용</c:when>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test = "${dto.babyseat eq 0}">비적용</c:when>
						<c:when test = "${dto.babyseat ne 0}">적용</c:when>
					</c:choose>
				</td>
				<td>${dto.baby_fee }</td>
				<td>${dto.total }</td>
				<td align="center">
					<p><button onclick="location.href='/rentcar/reserve/delete2?regno=${dto.regno}'">취소</button></p>
				</td>
			</tr>
		</c:forEach>
		</table>
	</div>
	
</body>
</html>