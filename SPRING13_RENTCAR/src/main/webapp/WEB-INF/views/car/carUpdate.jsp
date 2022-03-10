<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>차량정보업데이트</title>
</head>

<body>
	<h3>렌트카 정보수정</h3>
	<form action="update?no=${carInfo.no}" method="post">
		<table border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="${carInfo.name}"></td>
			</tr>
			<tr>
				<td>종류</td>
				<td><input type="text" name="category" value="${carInfo.category}">1.소형 2.중형 3.대형</td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price" value="${carInfo.price}"></td>
			</tr>
			<tr>
				<td>인승</td>
				<td>
					<select name="usepeople">
						<option value="${carInfo.usepeople}" selected>${carInfo.usepeople}</option>
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
				<td><input type="text" name="company" value="${carInfo.company}"></td>
			</tr>
			<tr>
				<td>차량이미지</td>
				<td><input type="file" name="img" value="${carInfo.img}"></td>
			</tr>
			<tr>
				<td>기타상세정보</td>
				<td><textarea name="info" rows="15" cols="55">${carInfo.info}</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정하기">
					<input type="button" value="취소" onclick="javascript:window.location='/rentcar/car/carList'"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>