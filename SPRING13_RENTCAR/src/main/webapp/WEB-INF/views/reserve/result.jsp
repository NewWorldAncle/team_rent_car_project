<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>예약 결과</title>
<link href="${path}/resources/css/login_related.css" rel="stylesheet" />
<%
	request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
session = request.getSession();
%>
</head>

<body>
	<div class="navi_container">
		<nav class="navi">
			<div class="navi_logo">
				<%
					// 로그인 X
				if (session.getAttribute("login") == null) {
				%>
				<a href="/rentcar/">V-RENTCAR</a>
				<%
					}
				// 로그인 O
				if (session.getAttribute("login") != null) {
				%>
				<a href="/rentcar/member/">V-RENTCAR</a>
				<%
					}
				%>
			</div>
			<ul class="naiv_menu">
				<%
					//===============================================================================
				//					로	그	인	된	상	태	-	관	리	자
				//===============================================================================
				if (session.getAttribute("login") != null) {
					String mid = (String) session.getAttribute("id"); //String mid생성

					if (mid.equals("admin")) { //관리자(admin) 로그인
				%>
				<li><a href="/rentcar/admin/pageAnalyze">PageAnalyze</a></li>
				<li><a href="/rentcar/car/carList">RentCarList</a></li>
				<li><a href="memList">Member</a></li>
				<li><a href="/rentcar/board/listPage">QnA</a></li>
				<li><a href="myList?id=${login.id}">MyPage</a></li>
				<li id="a">관리자님 접속</li>
				<li><a href="logout">Logout</a></li>
				<li><a href="#" class="navi__toggle"><i class="fas fa-bars"></i></a></li>
				<%
					} else {
				//===============================================================================
				//						로	그	인	된	상	태	-	유	저
				//===============================================================================
				%>
				<li><a href="/rentcar/reserve/catalog">RentCar</a></li>
				<li><a href="/rentcar/board/listPage">QnA</a></li>
				<li><a href="myList?id=${login.id}">MyPage</a>
				<li>
				<li id="a"><%=mid%> 회원님 접속</li>
				<li><a href="logout">Logout</a></li>
				<li><a href="#" class="navi__toggle"><i class="fas fa-bars"></i></a></li>
				<%
					}
				} else {
				//===============================================================================
				//						로	그	인	안	된	상	태
				//===============================================================================
				%>
				<li><a href="/rentcar/reserve/catalog">RentCar</a></li>
				<li><a href="/rentcar/board/listPage">QnA</a></li>
				<li><a href="member/loginForm">Login</a></li>
				<li><a href="#" class="navi__toggle"><i class="fas fa-bars"></i></a></li>
				<%
					}
				%>
			</ul>
		</nav>
	</div>
	<section class="joinSection">
		<div class="regWrap">
			<h3>예약 확인</h3>
			<div class="reg_container">
				<div class="reg_content">
					<div class="reg_img">
						<img src="<spring:url value='/resources/img/${img}'/>" alt="car">
					</div>
					<div class="reg_info">
						<table>
							<tr>
								<td>차량대수  &emsp; :</td>
								<td>${reserveDTO.qty}</td>
							</tr>
							<tr>
								<td>대여일  &emsp; &nbsp;&nbsp; :</td>
								<td>${reserveDTO.rday}</td>
							</tr>
							<tr>
								<td>대여일수  &emsp; :</td>
								<td>${reserveDTO.dday}일사용, ${price * reserveDTO.dday * reserveDTO.qty}원</td>
							</tr>
							<tr>
								<td>보험  &emsp; &emsp; &nbsp; :</td>
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
								<td>와이파이 &emsp; :</td>
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
								<td>네비게이션&nbsp; :</td>
								<td>
									<c:choose>
										<c:when test = "${reserveDTO.navigation eq 0}">비적용</c:when>
										<c:when test = "${reserveDTO.navigation ne 0}">적용</c:when>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td>아동시트 &emsp; :</td>
								<td>
									<c:if test="${reserveDTO.babyseat eq 0}">
										비적용
									</c:if>
									<c:if test="${reserveDTO.babyseat eq 1}">
										적용, ${reserveDTO.babyseat * 5000 * reserveDTO.qty}원
									</c:if>
								</td>
							</tr>
							<tr class="cost">
								<td >합계  &emsp; &nbsp; :</td>
								<td><b>${cost }</b></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="menu_wrap">
					<input class="ok_button regButton" type="button" value="확인" onclick="location.href='byMemList'">
				</div>
			</div>
		</div>
	</section>
</body>
</html>