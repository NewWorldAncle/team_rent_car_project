<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>렌트카 리스트</title>
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
			<%	// 로그인 X
				if(session.getAttribute("login") == null) {
			%>
				<a href="/rentcar/">V-RENTCAR</a>
			<% 
				}
				// 로그인 O
				if(session.getAttribute("login") != null) {
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
				if(session.getAttribute("login") != null) {
					String mid = (String)session.getAttribute("id"); //String mid생성
				
				if(mid.equals("admin"))	{	//관리자(admin) 로그인
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
				} else{
			//===============================================================================
			//							로	그	인	O	-	유	저
			//===============================================================================
			%>		
				<li><a href="/rentcar/reserve/catalog">RentCar</a></li>
				<li><a href="/rentcar/board/listPage">QnA</a></li>
				<li><a href="/rentcar/reserve/byMemList?memid=${login.id}">MyReserve</a><li>
				<li><a href="myList?id=${login.id}">MyPage</a><li>
				<li id="a"><i class="fas fa-user"></i><%=mid %>님</li>
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
	<!-- ===========================================네비 메뉴 끝 =============================== -->
	<section class="joinSection">
			<div class="reserveCheckWrap">
	<h3 class="recoText carlist">렌트카 리스트</h3>
	<div class="carinsertButton">
		<a href="register">차량 등록</a>
	</div>
	<table class="reserveList">
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
</div>
</section>
</body>
</html>