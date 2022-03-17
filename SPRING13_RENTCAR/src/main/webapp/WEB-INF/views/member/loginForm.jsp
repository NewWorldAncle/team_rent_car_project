<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/c895b3190c.js"
	crossorigin="anonymous"></script>
<link href="${path}/resources/css/login_related.css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/c895b3190c.js"
	crossorigin="anonymous"></script>
<title>로그인</title>
<%
	request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
session = request.getSession();
if (session.getAttribute("login") != null) {
	session.removeAttribute("login");
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

	<!-- 로그인부분 -->
	<section class="joinSection">
		<div class="login_wrap">
			<h3>로그인</h3>
			<form class="loginform" action="login" method="post">
				<div class="loginId">
					<h4>아이디</h4>
					<p>
						<input type="text" name="id" placeholder="아이디" required autofocus />
					</p>
				</div>
				<div class="loginPw">
					<h4>비밀번호</h4>
					<p>
						<input type="password" placeholder="비밀번호" name="pass" />
					</p>
				</div>
				<div class="loginEtc">
					<input type="submit" value="로그인" id="submitForm" />
				</div>
				<div class="find_account">
					<a href="#" target="_blank" onclick="openPopId()">아이디찾기</a>
					<a href="#" target="_blank" onclick="openPopPw()">비밀번호찾기</a>
					<a href="joinForm" id="joinForm">회원가입</a>
					<script>
						function openPopId() {
							var popup = window.open('findIdForm', '아이디찾기',
									'width=400px,height=200px');
						}
						function openPopPw() {
							var popup = window.open('findPwForm', '비밀번호찾기',
									'width=400px,height=200px');
						}
					</script>
				</div>
			</form>
		</div>
	</section>
</body>
</html>