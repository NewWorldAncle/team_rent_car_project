<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>게시글 작성하기</title>
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
	<h2 align="center">게시글 작성</h2><hr>
	<form action = "writeOk" method="post">
		<table border="1" align="center">
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer" size="50"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="email" size="50"></td>
			</tr>
			<tr class="pass_wrap">
				<th>비밀번호</th>
				<td>
					<input type="password" name="password" size="50">
					<i class="fa-solid fa-eye"></i>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" size="50"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" rows="15" cols="55"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="작성하기"> &nbsp;&nbsp;
					<input type="button" value="목록" onclick="javascript:window.location='/rentcar/board/listPage'"/>
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