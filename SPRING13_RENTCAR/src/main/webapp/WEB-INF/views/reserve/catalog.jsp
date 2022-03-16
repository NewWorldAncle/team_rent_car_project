<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>차량 목록</title>
<link href="${path}/resources/css/car_related.css" rel="stylesheet" />
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
	<!-- ===========================================네비 메뉴 끝 =============================== -->
<div class="recoProduct">
		<h3 class="recoText">차량 목록</h3>
		<div class="search">
			<select name="searchType">
				<option value="cn"
					<c:out value="${scri.searchType eq 'cn' ? 'selected' : ''}"/>>차량
					이름</option>
			</select> 
			<input type="text" name="keyword" id="keywordInput"
				value="${scri.keyword}" />
	
			<button id="searchBtn" type="submit">검색</button>
			<script>
				$(function() {
					$('#searchBtn').click(
							function() {
								self.location = "catalog"
										+ '${pageMaker.makeQuery(1)}'
										+ "&searchType="
										+ $("select option:selected").val()
										+ "&keyword="
										+ encodeURIComponent($('#keywordInput')
												.val());
							});
				});
			</script>
		</div>


	<div class="recoContain">
		<c:forEach items="${catalog}" var="dto">
			<div class="recoBox">
				<div class="boxImg">
					<a href="regAction?no=${dto.no}"> <img
						src="<spring:url value='/resources/img/${dto.img}'/>" alt="car">
					</a>
				</div>
				<div class="boxInfo">
					<div class="proName ">
						<strong>${dto.name}</strong>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<script>
		//추천메뉴 마우스호버 할 때 강조
		$(document).ready(function(){
			var vrecoBox = $(".recoBox")	
	
			vrecoBox.mouseover(function(){
				$(this).find(".boxImg img").addClass("zoom").removeClass("zoomout");
				vrecoBox.not($(this)).find(".boxImg img").removeClass("zoom");
		
				$(this).find(".proName").addClass("hilit").removeClass("hilitout");
				vrecoBox.not($(this)).find(".boxImg img").removeClass("hilit");
		
				$(this).addClass("boxShadow").removeClass("boxShadowout").siblings().removeClass("boxShadow");
			});
			vrecoBox.mouseout(function(){
				$(this).find(".boxImg img").addClass("zoomout").removeClass("zoom");
				vrecoBox.not($(this)).find(".boxImg img").removeClass("zoomout");
		
				$(this).find(".proName, .price dt, .boxfoot").addClass("hilitout").removeClass("hilit");
				vrecoBox.not($(this)).find(".boxImg img").removeClass("hilitout");
		
				$(this).addClass("boxShadowout").removeClass("boxShadow").siblings().removeClass("boxShadowout");
			});
		});
	</script>
</div>
</body>
</html>
