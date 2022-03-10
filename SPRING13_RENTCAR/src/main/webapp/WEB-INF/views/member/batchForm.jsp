<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>회원 배치처리</title>
	<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		session = request.getSession();
	%>
</head>

<body>
	<h2 align="center"><a href="/rentcar/member/">홈으로</a></h2><hr>
	<h2>회원가입 통합하기</h2>
	<form action="batch" method="post">
		<table border="1" align="center">
			<tr>
			<th>아이디</th>
			<th>패스워드</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>연령대</th>
			<th>직업</th>
			<th>취미</th>
		</tr>
		<tr>
			<td colspan="7">
				<div align="center">
					작성 시 순서에 맞춰 컴마(,)로 나열하세요.<br/>
					여러 명을 작업하려면 줄을 바꿔주세요.
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="7">
				<textarea rows="10" cols="100" name="batchData" placeholder="ex) hongGD,1234,HGD@naver.com,010-2222-3333,30대,프로그래머,요리	"></textarea>
			</td>
		</tr>
		
		<tr align="center">
			<td colspan="7">
				<input type="submit" value="배치처리">&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="memList">회원관리</a>
			</td>
		</tr>
		</table>
	</form>
</body>
</html>