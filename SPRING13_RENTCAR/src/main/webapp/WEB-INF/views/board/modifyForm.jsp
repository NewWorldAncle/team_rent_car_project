<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>게시물 수정</title>
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
	<form action="modifyOk?num=${modifyView.num}" method="post">	<!-- 상세보기 페이지에서 바로 수정도 가능하도록 -->
		<table border="1" align="center">
			<tr>
				<th>글번호</th>
				<td><input type="hidden" name="num" value="${modifyView.num}">${modifyView.num}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${modifyView.readcount}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="hidden" name="writer" value="${modifyView.writer}">${modifyView.writer}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="email" value="${modifyView.email}"></td>
			</tr>
			<tr class="pass_wrap">
				<th>비밀번호</th>
				<td>
					<input type="password" name="password" value="${modifyView.password}">
					<i class="fa-solid fa-eye"></i>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" value="${modifyView.subject}"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" rows="15" cols="55">${modifyView.content}</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정"> &nbsp;&nbsp;
					<input type="button" value="취소" onclick="javascript:history.back()"/>
				</td>
			</tr>
		</table>
	</form>
	
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