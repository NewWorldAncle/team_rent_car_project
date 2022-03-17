<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>비밀번호 찾기</title>
	<link href="${path}/resources/css/find.css" rel="stylesheet" />
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
	<div class="find_head">
		<h3>비밀번호 찾기</h3>
	</div>
	<div class="vinsertPart">
		<div class="intoBox">
		<label>아이디</label>
		<input type="text" name="id" id="id" required>
		</div >
		<div class="intoBox">
		<label>이메일</label>
		<input type="text" name="email" id="email">
		</div>
	</div>
	<div class="menuPart">
		<input class="ok_button" type="button" id=findBtn value="찾기">
		<input class="no_button" type="button" value="돌아가기" onclick="javascript:window.close()">
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