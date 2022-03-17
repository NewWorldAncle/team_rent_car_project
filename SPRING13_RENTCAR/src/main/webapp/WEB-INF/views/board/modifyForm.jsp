<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
<link href="${path}/resources/css/login_related.css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/c895b3190c.js"
	crossorigin="anonymous"></script>
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
		<div class="car_wrap">
			<h3 class="carHead">게시글 수정</h3>
			<form action="modifyOk?num=${modifyView.num}" method="post">
				<!-- 상세보기 페이지에서 바로 수정도 가능하도록 -->
				<table class="carTable">
					<tr>
						<td>글번호</td>
						<td><input type="hidden" name="num" value="${modifyView.num}">${modifyView.num}</td>
					</tr>
					<tr>
						<td>조회수</td>
						<td>${modifyView.readcount}</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="hidden" name="writer"
							value="${modifyView.writer}">${modifyView.writer}</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="email" name="email"
							value="${modifyView.email}"></td>
					</tr>
					<tr class="pass_wrap">
						<td>비밀번호</td>
						<td><input type="password" name="password"
							value="${modifyView.password}"> <i
							class="fa-solid fa-eye"></i></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="subject"
							value="${modifyView.subject}"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="content" rows="15" cols="55">${modifyView.content}</textarea></td>
					</tr>
				</table>
				<div class="menu_wrap">
					<input class="ok_button btnSpace" type="submit"value="수정">
					<input class="no_button btnSpace" type="button" value="취소"	onclick="javascript:history.back()" />
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