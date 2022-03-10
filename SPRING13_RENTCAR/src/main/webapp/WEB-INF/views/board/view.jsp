<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>게시물 보기</title>
	<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		session = request.getSession();
	%>
	<script>
		var pass = prompt('비밀번호를 입력해주세요.');
		var password = '${boardView.password}';
		if(pass != password) {
			alert('비밀번호를 다시 확인해주세요.');
			history.back();
		};
	</script>
</head>

<body>
	<table border="1" align="center">
		<tr>
			<th>번호</th>
			<td>${boardView.num}</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${boardView.readcount}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${boardView.writer}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${boardView.email}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${boardView.subject}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" rows="15" cols="55" readonly>${boardView.content}</textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="목록" onclick="javascript:window.location='/rentcar/board/listPage'"/> &nbsp;&nbsp;
				<input type="button" value="수정" onclick="javascript:window.location='modify?num=${boardView.num}'"/> &nbsp;&nbsp;
				<input type="button" value="답글" onclick="javascript:window.location='replyView?num=${boardView.num}'"/> &nbsp;&nbsp;
				<input type="button" value="삭제" onclick="javascript:window.location='delete?num=${boardView.num}'"/>
			</td>
		</tr>
	</table>
</body>
</html>