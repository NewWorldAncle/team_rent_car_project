<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>비밀번호 찾기</title>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
	<h3>비밀번호 찾기</h3>
	<div class="InsertPart">
	<p>
		<label>아이디</label>
		<input type="text" name="id" id="id" required>
	</p>
	<p>
		<label>이메일</label>
		<input type="text" name="email" id="email">
	</p>
	</div>
	<div class="menuPart">
		<button type="button" id=findBtn>찾기</button>
		<input type="button" value="돌아가기" onclick="javascript:window.close()">
	</div>
	
	<script>
		$(function(){
			$("#findBtn").click(function(){
				$.ajax({
					url : "../member/findPw",
					type : "POST",
					data : {
						id : $("#id").val(),
						email : $("#email").val()
					},
					success : function(result){
						alert(result);
					},
				})
			});
		});
	</script>
</body>
</html>