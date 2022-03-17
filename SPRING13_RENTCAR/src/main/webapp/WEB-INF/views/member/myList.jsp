<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<!-- 외부기능 적용하기 -->
<script type="text/javascript" src="${path}/resources/js/joincheck.js"></script>
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
		<div class="myListWrap" align="center">
			<h3>내 정보 수정</h3>
			<form action="myModify?id=${mypage.id}" method="get">
				<table>
					<tr class="id_wrap">
						<th>아이디</th>
						<td><input type="text" name="id"  value="${mypage.id}"
							readonly></td>
					</tr>
					<tr class="pass_wrap">
						<th>비밀번호</th>
						<td><input type="password" name="pass" value="${mypage.pass}">
							<i class="fa-solid fa-eye"></i></td>

					</tr>
					<tr class="eamil_wrap">
						<th>이메일</th>
						<td><input type="email" name="email" value="${mypage.email}"></td>
					</tr>
					<tr class="tel_wrap">
						<th>전화번호</th>
						<td><input type="text" name="tel" value="${mypage.tel}"></td>
					</tr>
					<tr class="age_wrap">
						<th>연령대</th>
						<td><select name="age">
								<option value="${mypage.age}" selected>${mypage.age}</option>
								<option>----------------</option>
								<option value="20대">20대</option>
								<option value="20대">30대</option>
								<option value="20대">40대</option>
								<option value="20대">50대</option>
								<option value="20대">60대</option>
						</select>
					</tr>
					<tr class="job_wrap">
						<th>직업</th>
						<td><select name="job">
								<option value="${mypage.job}" selected>${mypage.job}</option>
								<option>------------------</option>
								<optgroup label="개발">
									<option value="연구원">연구원</option>
									<option value="프로그래머">프로그래머</option>
								</optgroup>
								<optgroup label="교육">
									<option value="교사">교사</option>
									<option value="교직원">교직원</option>
									<option value="학생">학생</option>
								</optgroup>
								<optgroup label="기타">
									<option value="사업가">사업가</option>
									<option value="자영업자">자영업자</option>
									<option value="주부">주부</option>
									<option value="프리랜서">프리랜서</option>
								</optgroup>
								<optgroup label="사무">
									<option value="공무원">공무원</option>
									<option value="회사원">회사원</option>
								</optgroup>
								<optgroup label="예체능">
									<option value="연예인">연예인</option>
									<option value="운동선수">운동선수</option>
								</optgroup>
								<optgroup label="군인">
									<option value="군인">군인</option>
								</optgroup>
						</select></td>
					</tr>
					<tr class="hobby_wrap">
						<th>취미</th>
							<td><%-- <input type="text" name="hobby" value="${mypage.hobby}"> --%>
								<select name="hobby">
								<option value="${mypage.hobby}" selected>${mypage.hobby}</option>
								<option>------------------</option>
									<option value="그림">그림</option>
									<option value="낚시">낚시</option>
									<option value="독서">독서</option>
									<option value="드라이브">드라이브</option>
									<option value="등산">등산</option>
									<option value="맛집탐방">맛집탐방</option>
									<option value="볼링">볼링</option>
									<option value="배드민턴">배드민턴</option>
									<option value="사진찍기">사진찍기</option>
									<option value="쇼핑">쇼핑</option>
									<option value="수집">수집</option>
									<option value="요리">요리</option>
									<option value="음악감상">음악감상</option>
									<option value="작사">작사</option>
									<option value="조경">조경</option>
									<option value="탁구">탁구</option>
									<option value="태권도">태권도</option>
									<option value="컴퓨터게임">컴퓨터게임</option>
									<option value="콘솔게임">콘솔게임</option>
									<option value="캠핑">캠핑</option>
									<option value="프로그래밍">프로그래밍</option>

						</select></td>
					</tr>
					<tr class="menu_wrap">
						<td colspan="2" align="center">
						</td>
					</tr>
				</table>
					<div class="menu_wrap">
						<input class="ok_button"
							type="submit" value="수정">&nbsp;&nbsp;&nbsp;&nbsp; <!-- form name 붙이고 자바스크립트로 처리..? -->
							<input class="no_button" type="button" value="탈퇴"
							onclick="javascript:window.location='myDelete?id=${mypage.id}'" />
					</div>
			</form>
		</div>
	</section>

	<!-------------------------- 자바스크립트 처리영역 -------------------------->
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