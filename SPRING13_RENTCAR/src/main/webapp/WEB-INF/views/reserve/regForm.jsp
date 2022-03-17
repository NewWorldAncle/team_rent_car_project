<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>차량 예약하기</title>
<link href="${path}/resources/css/login_related.css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/c895b3190c.js"
	crossorigin="anonymous"></script>
<%
	request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
session = request.getSession();
%>
<%
	if (session.getAttribute("login") == null) {
%>
<script language="JavaScript">
	alert("로그인 후 가능합니다.");
	window.location.href = "/rentcar/member/loginForm";
</script>
<%
	}
%>
</head>

<body>
	<div class="navi_container">
		<nav class="navi">
			<div class="navi_logo">
				<a href="/rentcar/">V-RENTCAR</a>
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
				<li><a href="/rentcar/member/memList">MemberList</a></li>
				<li><a href="/rentcar/reserve/allList">ReserveList</a></li>
				<li><a href="/rentcar/board/listPage">QnA</a></li>
				<li><a href="/rentcar/member/myList?id=${login.id}">MyPage</a></li>
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
				<li><a href="/rentcar/member/myList?id=${login.id}">MyPage</a><li>
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
		<div class="regWrap">
			<h3>차량 예약하기</h3>
			<form action="regOk" method="post">
				<div class="reg_container">
					<div class="reg_content">
						<div class="reg_img">
							<img name="img"
								src="<spring:url value='/resources/img/${dto.img}'/>" alt="car">
						</div>
						<div class="reg_info">
							<table>
								<tr>
									<td>차량이름 &emsp; &emsp; :</td>
									<td>${dto.name}</td>
								</tr>
								<tr>
									<td>차량분류 &emsp; &emsp; :</td>
									<td>
									<c:choose>
										<c:when test = "${dto.category eq 1}">소형</c:when>
										<c:when test = "${dto.category eq 2}">중형</c:when>
										<c:when test = "${dto.category eq 3}">대형</c:when>
									</c:choose>
									</td>
								</tr>
								<tr>
									<td>대여가격 &emsp; &emsp; :</td>
									<td>${dto.price }</td>
								</tr>
								<tr>
									<td>제조회사 &emsp; &emsp; :</td>
									<td>${dto.company }</td>
								</tr>
								<tr>
									<td>상세정보 &emsp; &emsp; :</td>
									<td>${dto.info }</td>
								</tr>
								<tr>
									<td>대여수량 &emsp; &emsp; :</td>
									<td><select name="qty">
											<option value="1">1대</option>
											<option value="2">2대</option>
											<option value="3">3대</option>
											<option value="4">4대</option>
											<option value="5">5대</option>
									</select></td>
								</tr>
								<tr>
									<td>대여기간 &emsp; &emsp; :</td>
									<td><select name="dday">
											<option value="1">1일</option>
											<option value="2">2일</option>
											<option value="3">3일</option>
											<option value="4">4일</option>
											<option value="5">5일</option>
											<option value="6">6일</option>
											<option value="7">7일</option>
									</select></td>
								</tr>
								<tr>
									<td>대여일자 &emsp; &emsp; :</td>
									<td><input type="date" name="rday"></td>
								</tr>

								<tr>
									<td>보험적용 &emsp; &emsp; :</td>
									<td><select name="insurance">
											<option value="1">적용(1일1만원)</option>
											<option value="0">비적용</option>
									</select></td>
								</tr>
								<tr>
									<td>WiFi적용 &emsp; &emsp; :</td>
									<td><select name="wifi">
											<option value="1">적용(1일1만원)</option>
											<option value="0">비적용</option>
									</select></td>
								</tr>

								<tr>
									<td>Navigation적용:</td>
									<td>
										<select name="navigation">
											<option value="1">적용(무료)</option>
											<option value="0">비적용</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>Baby seat적용 &nbsp;:</td>
									<td><select name="babyseat">
											<option value="1">적용(5000원)</option>
											<option value="0">비적용</option>
									</select></td>
								</tr>
								<tr>
									<td colspan="3"><input type="hidden" name="no"
										value="${dto.no}"> <input type="hidden" name="img"
										value="${dto.img }"> <input type="hidden" name="memid"
										value="${memid}"> <input type="hidden" name="price"
										value="${dto.price }"></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="menu_wrap">
						<input class="ok_button regButton" type="submit" value="예약하기"> 
						<input class="no_button regButton" type="button" value="취소"
							onclick="javascript:history.back()" />
					</div>
				</div>
			</form>
		</div>
	</section>
</body>
</html>