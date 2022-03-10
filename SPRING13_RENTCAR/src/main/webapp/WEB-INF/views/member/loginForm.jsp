<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		session = request.getSession();
		if(session.getAttribute("login") != null) {
			session.removeAttribute("login");
		}
	%>
</head>

<body>
	<div class="login_wrap" align="center">
		<div>
			<h2><a href="/rentcar/">홈으로</a></h2>
		</div>
		<form action="login" method="post">
			<div class="loginId">
				<h3>아이디</h3>
				<p><input type="text" name="id" required autofocus/></p>
			</div>
			<div class="loginPw">
				<h3>비밀번호</h3>
				<p><input type="password" name="pass"/></p>
			</div>
			<div class="loginEtc">
				<input type="submit" value="로그인" id="submitForm"/> &nbsp;&nbsp;
				<input type="button" value="회원가입" id="joinForm" onclick="javascript:window.location='joinForm'"/><br/>
				<a href="#" target="_blank" onclick="openPopId()">아이디찾기</a>
				<a href="#" target="_blank" onclick="openPopPw()">비밀번호찾기</a>
					<script>
						function openPopId(){
							var popup = window.open('findIdForm','아이디찾기','width=400px,height=200px');
						}
						function openPopPw(){
							var popup = window.open('findPwForm','비밀번호찾기','width=400px,height=200px');
						}
					</script>
			</div>
		</form>
	</div>
</body>
</html>