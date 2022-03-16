<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>차량 등록</title>
	<link href="${path}/resources/css/login_related.css" rel="stylesheet" />
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
	<div class="car_wrap">	
	<h3 class="carHead">렌트카 등록</h3>
	<form action="registerOk" method="post">
		<table class="carTable">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>종류</td>
				<td><input type="text" name="category" placeholder="숫자만 입력하세요">1.소형 2.중형 3.대형</td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price" placeholder="','를 제외하고 입력하세요"></td>
			</tr>
			<tr>
				<td>인승</td>
				<td>
					<select name="usepeople">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>제조회사</td>
				<td><input type="text" name="company"></td>
			</tr>
			<tr>
				<td>차량이미지</td>
				<td>
					<input type="text" name="imgName" id="imgName">
					<input type="file" name="img" onchange="javascript:document.getElementById('imgName').value=this.value">
				</td>
			</tr>
			<tr>
				<td>기타상세정보</td>
				<td><textarea name="info" rows="15" cols="55"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
				</td>
			</tr>
		</table>
		<div class="menu_wrap">
			<input class="ok_button btnSpace" type="submit" value="등록하기">
			<input class="no_button btnSpace" type="button" value="취소" onclick="javascript:window.location='/rentcar/car/carList'"/>
		</div>
	</form>
	</div>
	</section>
</body>
</html>