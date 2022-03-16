<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>전체 예약목록</title>
<link href="${path}/resources/css/memList.css" rel="stylesheet" />
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
				//						로	그	인	O	-	관	리	자
				//===============================================================================
				if (session.getAttribute("login") != null) {
					String mid = (String) session.getAttribute("id"); //String mid생성

					if (mid.equals("admin")) { //관리자(admin) 로그인
				%>
				<li><a href="/rentcar/admin/pageAnalyze">PageAnalyze</a></li>
				<li><a href="/rentcar/car/carList">RentCarList</a></li>
				<li><a href="memList">MemberList</a></li>
				<li><a href="/rentcar/reserve/allList">ReserveList</a></li>
				<li><a href="/rentcar/board/listPage">QnA</a></li>
				<li><a href="myList?id=${login.id}">MyPage</a></li>
				<li id="a"><i class="fas fa-user"></i>관리자</li>
				<li><a href="logout">Logout</a></li>
				<li><a href="#" class="navi__toggle"><i class="fas fa-bars"></i></a></li>
				<%
					} else {
				//===============================================================================
				//							로	그	인	O	-	유	저
				//===============================================================================
				%>
				<li><a href="/rentcar/reserve/catalog">RentCar</a></li>
				<li><a href="/rentcar/board/listPage">QnA</a></li>
				<li><a href="/rentcar/reserve/byMemList?memid=${login.id}">MyReserve</a>
				<li>
				<li><a href="myList?id=${login.id}">MyPage</a>
				<li>
				<li id="a"><i class="fas fa-user"></i><%=mid%>님</li>
				<li><a href="logout">Logout</a></li>
				<li><a href="#" class="navi__toggle"><i class="fas fa-bars"></i></a></li>
				<%
					}
				} else {
				//===============================================================================
				//								로	그	인	X
				//===============================================================================
				%>
				<li><a href="/rentcar/reserve/catalog">RentCar</a></li>
				<li><a href="/rentcar/board/listPage">QnA</a></li>
				<li><a href="/rentcar/member/loginForm">Login</a></li>
				<li><a href="#" class="navi__toggle"><i class="fas fa-bars"></i></a></li>
				<%
					}
				%>
			</ul>
		</nav>
	</div>
	<section class="joinSection">
		<div class="reserveCheckWrap">
			<h3 class="recoText carlist">전체 예약목록</h3>
			<table class="reserveList">
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
						<td><img
							src="<spring:url value='/resources/img/${dto.img}'/>" alt="car"
							width="150" height="100"></td>
						<td>${dto.name }</td>
						<td>${dto.rday }</td>
						<td>${dto.dday }</td>
						<td>${dto.qty }</td>
						<td>${dto.price }</td>
						<td>${dto.fee }</td>
						<td><c:choose>
								<c:when test="${dto.insurance eq 0}">비적용</c:when>
								<c:when test="${dto.insurance ne 0}">적용</c:when>
							</c:choose></td>
						<td>${dto.insu_fee }</td>
						<td><c:choose>
								<c:when test="${dto.wifi eq 0}">비적용</c:when>
								<c:when test="${dto.wifi ne 0}">적용</c:when>
							</c:choose></td>
						<td>${dto.wifi_fee }</td>
						<td><c:choose>
								<c:when test="${dto.navigation eq 0}">비적용</c:when>
								<c:when test="${dto.navigation ne 0}">적용</c:when>
							</c:choose></td>
						<td><c:choose>
								<c:when test="${dto.babyseat eq 0}">비적용</c:when>
								<c:when test="${dto.babyseat ne 0}">적용</c:when>
							</c:choose></td>
						<td>${dto.baby_fee }</td>
						<td>${dto.total }</td>
						<td align="center">
							<p>
								<button
									onclick="location.href='/rentcar/reserve/delete2?regno=${dto.regno}'">취소</button>
							</p>
						</td>
					</tr>
				</c:forEach>
			</table>

		</div>
	</section>

</body>
</html>