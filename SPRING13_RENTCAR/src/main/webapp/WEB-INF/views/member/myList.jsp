<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>마이페이지</title>
	<!-- 외부기능 적용하기 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/joincheck.js"></script>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" 
	integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" 
	crossorigin="anonymous" referrerpolicy="no-referrer" />
	<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		session = request.getSession();
	%>
</head>

<body>
	<h2 align="center"><a href="/rentcar/member/">홈으로</a></h2><hr>
	<div class="myListWrap" align="center"></div>
	<h5>내 정보</h5>
	<form action="myModify?id=${mypage.id}" method="get">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" value="${mypage.id}" readonly></td>
			</tr>
			<tr class="pass_wrap">
				<th>비밀번호</th>
				<td>
					<input type="password" name="pass" value="${mypage.pass}">
					<i class="fa-solid fa-eye"></i>
				</td>
				
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="email" value="${mypage.email}"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="tel" value="${mypage.tel}"></td>
			</tr>
			<tr>
				<th>연령대</th>
				<td>
				<select name="age">
					<option value="${mypage.age}" selected>${mypage.age}</option>
					<option>----------------</option>
					<option value="20대">20대</option>
					<option value="20대">30대</option>
					<option value="20대">40대</option>
					<option value="20대">50대</option>
					<option value="20대">60대</option>
				</select>
			</tr>
			<tr>
				<th>직업</th>
				<td>
					<select name="job">
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
					</select>
				</td>
			</tr>
			<tr>
				<th>취미</th>
				<td><input type="text" name="hobby" value="${mypage.hobby}"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정">&nbsp;&nbsp;&nbsp;&nbsp;
					<!-- form name 붙이고 자바스크립트로 처리..? -->
					<input type="button" value="탈퇴" onclick="javascript:window.location='myDelete?id=${mypage.id}'"/>
				</td>
			</tr>
			
		</table>
	</form>
	
	<!-------------------------- 자바스크립트 처리영역 -------------------------->
	<script>
		$(document).ready(function() {
			$('.pass_wrap i').on('click',function(){	//onclick 이벤트리스너
		        $('input').toggleClass('active');	//input태그에 active클래스 토글
		        if($('input').hasClass('active')){	//비밀번호 보이기
		            $(this).attr('class',"fa-solid fa-eye-slash")
		            .prev('input').attr('type',"text");
		        }else{	//비밀번호 숨기기
		            $(this).attr('class',"fa-solid fa-eye")
		            .prev('input').attr('type','password');
		        }
		    });
		});
	</script>
</body>
</html>