<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CARTEST</title>
</head>
<body>
<h1>보드 테스트</h1>
	<table>
		<tr>
			<th>번호</th>
			<th>모델명</th>
			<th>종류</th>
			<th>가격</th>
			<th>인승</th>
			<th>제조사</th>
			<th>이미지</th>
			<th>상세정보</th>
		</tr>
		<c:forEach items="${carDAO}" var="dto">
			<tr>
				<td>${dto.no}</td>
				<td>${dto.name}</td>
				<td>
					<c:set var="category" value="${dto.category}"/>
						<c:choose>
							<c:when test="${category eq '1'}">
								소형
							</c:when>
							<c:when test="${category eq '2'}">
								중형
							</c:when>
							<c:when test="${category eq '3'}">
								대형
							</c:when>
							<c:otherwise>
								정보없음
							</c:otherwise>
						</c:choose>
				</td>
				<td>${dto.price}</td>
				<td>${dto.usepeople}</td>
				<td>${dto.conpany}</td>
				<td><img src="resources/img/${dto.img}" alt="car"></td>
				<td>${dto.info}</td>
			</tr>
		</c:forEach>
	</table>
	<a href="home">보드 바로가기</a>
	
</body>
</html>