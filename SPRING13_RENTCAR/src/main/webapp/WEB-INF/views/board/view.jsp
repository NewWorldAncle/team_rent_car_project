<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>게시물 보기</title>
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
<script>
	var pass = prompt('비밀번호를 입력해주세요.');
	var password = '${boardView.password}';
	if (pass != password) {
		alert('비밀번호를 다시 확인해주세요.');
		history.back();
	};
</script>
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
			<h3 class="carHead">게시글</h3>
			<table class="carTable noInputT">
				<tr>
					<td>번호</td>
					<td>${boardView.num}</td>
				</tr>
				<tr>
					<td>조회수</td>
					<td>${boardView.readcount}</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${boardView.writer}</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>${boardView.email}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>${boardView.subject}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="content" rows="15" cols="55" readonly>${boardView.content}</textarea></td>
				</tr>
			</table>
			<div class="menu_wrap">
				<input class="ok_button btnSpace2" type="button" value="목록"
					onclick="javascript:window.location='/rentcar/board/listPage'" /> <input
					class="ok_button btnSpace2" type="button" value="수정"
					onclick="javascript:window.location='modify?num=${boardView.num}'" />
				<input class="ok_button btnSpace2" type="button" value="답글"
					onclick="javascript:window.location='replyView?num=${boardView.num}'" />
				<input class="no_button btnSpace2" type="button" value="삭제"
					onclick="javascript:window.location='delete?num=${boardView.num}'" />
			</div>
		</div>
	</section>
</body>
</html>