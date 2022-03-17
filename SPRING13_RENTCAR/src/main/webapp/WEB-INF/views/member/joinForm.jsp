<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- 외부기능 적용하기 -->
<script type="text/javascript" src="${path}/resources/js/joincheck.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="${path}/resources/css/login_related.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://kit.fontawesome.com/c895b3190c.js"
	crossorigin="anonymous"></script>
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
	<!-- 회원가입 부분 -->
	<section class="joinSection">
		<form action="join" method="post" name="reg_frm">
			<div class="joinWrap">
				<h3>
					<strong>회원가입</strong>
				</h3>
				<table>
					<tr class="id_wrap">
						<th>아이디</th>
						<td><input type="text" id="id" name="id"
							placeholder="아이디를 입력해주세요."> <span id="idcheck"></span></td>
					</tr>
					<tr class="pass_wrap">
						<th>비밀번호</th>
						<td><input type="password" name="pass"
							placeholder="비밀번호를 입력해주세요"> <i class="fa-solid fa-eye"></i>
						</td>
					</tr>
					<tr class="pass_chk_wrap">
						<th>비밀번호 확인</th>
						<td><input type="password" name="pass_chk"></td>
					</tr>
					<tr class="eamil_wrap">
						<th>이메일</th>
						<td><input type="email" name="email"
							placeholder="'@'를 포함하여 입력해주세요"></td>
					</tr>
					<tr class="tel_wrap">
						<th>전화번호</th>
						<td><input type="text" name="tel"
							placeholder="'-'를 포함하여 입력해주세요"></td>
					</tr>
					<tr class="age_wrap">
						<th>연령대</th>
						<td><input type="radio" name="age" value="20대">20대 <input
							type="radio" name="age" value="30대">30대 <input
							type="radio" name="age" value="40대">40대 <input
							type="radio" name="age" value="50대">50대 <input
							type="radio" name="age" value="60대">60대</td>
					</tr>
					<tr class="job_wrap">
						<th>직업</th>
						<td><select name="job">
								<option value="선택하세요" selected>선택하세요</option>
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
						<td>
							<table>
								<tr>
									<td><input type="checkbox" name="hobby" value="그림">그림</td>
									<td><input type="checkbox" name="hobby" value="낚시">낚시</td>
									<td><input type="checkbox" name="hobby" value="독서">독서</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="hobby" value="드라이브">드라이브</td>
									<td><input type="checkbox" name="hobby" value="등산">등산</td>
									<td><input type="checkbox" name="hobby" value="맛집탐방">맛집탐방</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="hobby" value="볼링">볼링</td>
									<td><input type="checkbox" name="hobby" value="배드민턴">배드민턴</td>
									<td><input type="checkbox" name="hobby" value="사진찍기">사진찍기</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="hobby" value="쇼핑">쇼핑</td>
									<td><input type="checkbox" name="hobby" value="수집">수집</td>
									<td><input type="checkbox" name="hobby" value="요리">요리</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="hobby" value="음악감상">음악감상</td>
									<td><input type="checkbox" name="hobby" value="작사">작사</td>
									<td><input type="checkbox" name="hobby" value="조경">조경</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="hobby" value="탁구">탁구</td>
									<td><input type="checkbox" name="hobby" value="태권도">태권도</td>
									<td><input type="checkbox" name="hobby" value="컴퓨터게임">컴퓨터게임</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="hobby" value="콘솔게임">콘솔게임</td>
									<td><input type="checkbox" name="hobby" value="캠핑">캠핑</td>
									<td><input type="checkbox" name="hobby" value="프로그래밍">프로그래밍</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr class="menu_wrap">
						<td colspan="2"><input class="ok_button" type="button"
							value="가입" name="confirm" onclick="infoConfirm()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input class="no_button" type="button" value="취소" name="cancel"
							onclick="javascript:window.location='loginForm'" /></td>
					</tr>
				</table>
			</div>
		</form>
	</section>

	<!-------------------------- 자바스크립트 처리영역 -------------------------->
	<script type="text/javascript">
		$(function() {
			$("#id").on('keyup', idcheck);
		})
		function idcheck() {
			var id = $("id").val();
			var sendData = {
				"id" : id
			};
			$.ajax({
				method : 'POST',
				url : 'idCheck',
				data : sendData,
				success : function(resp) {
					if (resp == 'fail') {
						$('#idCheck').css('color', 'red')
						$('#idCheck').html("사용 중인 아이디입니다.")
						flag = false;
					} else {
						$('#idCheck').css('color', 'blue')
						$('#idCheck').html("사용 가능한 아이디입니다.")
						flag = true;
					}
				}
			})
		}
	</script>
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