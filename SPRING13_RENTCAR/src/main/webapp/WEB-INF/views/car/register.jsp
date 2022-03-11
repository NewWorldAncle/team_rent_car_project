<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>차량 등록</title>
</head>

<body>
	<h3>렌트카 등록</h3>
	<form action="registerOk" method="post">
		<table border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>종류</td>
				<td><input type="text" name="category" placeholder="숫자만 입력하세요">1.소형 2.중형 3.대형</td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price" placeholder="','를 제외하고 입력하세요"></td>
			</tr>
			<tr>
				<td>인승</td>
				<td>
					<select name="usepeople">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>제조회사</td>
				<td><input type="text" name="company"></td>
			</tr>
			<tr>
				<td>차량이미지</td>
				<td>
					<input type="text" name="imgName" id="imgName">
					<input type="file" name="img" onchange="javascript:document.getElementById('imgName').value=this.value">
				</td>
			</tr>
			<tr>
				<td>기타상세정보</td>
				<td><textarea name="info" rows="15" cols="55"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록하기">
					<input type="button" value="취소" onclick="javascript:window.location='/rentcar/car/carList'"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>