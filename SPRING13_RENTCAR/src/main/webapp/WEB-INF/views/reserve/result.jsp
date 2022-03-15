<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>예약 결과</title>
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
	<h3>차량 목록</h3>
	예약된 정보를 출력하는 화면입니다. <br>
	
	<table border="1" align="center">
		<tr>
			<td rowspan="9">
				<img src="<spring:url value='/resources/img/${img}'/>" alt="car" width="300" height="250">
			</td>
		</tr>
		<tr>
			<td>차량대수</td>
			<td>${reserveDTO.qty}</td>
		</tr>
		<tr>
			<td>대여일</td>
			<td>${reserveDTO.rday}</td>
		</tr>
		<tr>
			<td>대여일수</td>
			<td>${reserveDTO.dday}일 사용, ${price * reserveDTO.dday * reserveDTO.qty}원</td>
		</tr>
		<tr>
			<td>보험</td>
			<td>
				<c:if test="${reserveDTO.insurance eq 0}">
					비적용
				</c:if>
				<c:if test="${reserveDTO.insurance eq 1}">
					적용, ${reserveDTO.insurance * 10000 * reserveDTO.dday * reserveDTO.qty}원
				</c:if>
			</td>
		</tr>
		<tr>
			<td>와이파이</td>
			<td>
				<c:if test="${reserveDTO.wifi eq 0}">
					비적용
				</c:if>
				<c:if test="${reserveDTO.wifi eq 1}">
					적용, ${reserveDTO.wifi * 10000 * reserveDTO.dday *reserveDTO.qty}원
				</c:if>
			</td>
		</tr>
		<tr>
			<td>네비게이션</td>
			<td>
				<c:choose>
					<c:when test = "${reserveDTO.navigation eq 0}">비적용</c:when>
					<c:when test = "${reserveDTO.navigation ne 0}">적용</c:when>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td>아동시트</td>
			<td>
				<c:if test="${reserveDTO.babyseat eq 0}">
					비적용
				</c:if>
				<c:if test="${reserveDTO.babyseat eq 1}">
					적용, ${reserveDTO.babyseat * 5000 * reserveDTO.qty}원
				</c:if>
			</td>
		</tr>
		<tr>
			<td>합계</td>
			<td><b>${cost }</b></td>
		</tr>
		<tr>
			<td colspan="3" align="center">
				<button onclick="location.href='byMemList'">확인</button>
			</td>
		</tr>
	</table>
</body>
</html>