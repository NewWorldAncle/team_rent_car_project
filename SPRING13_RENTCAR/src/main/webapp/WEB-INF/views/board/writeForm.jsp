<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>게시글 작성하기</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="${path}/resources/css/login_related.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
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
	<section class="joinSection">
		<div class="car_wrap">
			<h3 class="carHead">게시글 작성</h3>
			<form action="writeOk" method="post">
				<table class="carTable">
					<tr>
						<td>작성자</td>
						<td><input type="text" name="writer" size="50"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="email" name="email" size="50"></td>
					</tr>
					<tr class="pass_wrap">
						<td>비밀번호</td>
						<td><input type="password" name="password" size="50">
							<i class="fa-solid fa-eye"></i></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="subject" size="50"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="content" rows="15" cols="55"></textarea></td>
					</tr>
				</table>
				<div class="menu_wrap">
					<input class="ok_button btnSpace"  type="submit" value="작성하기">
					 <input class="ok_button btnSpace" type="button"
						value="목록"
						onclick="javascript:window.location='/rentcar/board/listPage'" />
				</div>
			</form>
		</div>
	</section>
	<script>
		$(document).ready(
				function() {
					$('.pass_wrap i').on(
							'click',
							function() { //onclick 이벤트리스너
								$('input').toggleClass('active'); //input태그에 active클래스 토글
								if ($('input').hasClass('active')) { //비밀번호 보이기
									$(this).attr('class',
											"fa-solid fa-eye-slash").prev(
											'input').attr('type', "text");
								} else { //비밀번호 숨기기
									$(this).attr('class', "fa-solid fa-eye")
											.prev('input').attr('type',
													'password');
								}
							});
				});
	</script>
</body>
</html>