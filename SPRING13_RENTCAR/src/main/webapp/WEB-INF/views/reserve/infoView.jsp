<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>예약 정보 수정</title>
	<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		session = request.getSession();
	%>
</head>

<body>
	<h2><a href="/rentcar/member/">V-RENTCAR</a></h2><hr>

	<h3>예약 정보 수정</h3>	
	<form action="infoUp?regno=${detailDto.regno}" method="post">
		<table border="1" align="center">
			<tr>
				<td rowspan="9" width="50%" align="center">
					<img src="<spring:url value='/resources/img/${detailView.img}'/>" alt="${detailView.img}" width="250" height="200">
				</td>
				
				<td width="25%" align="center">차량이름</td>
				<td align="left">${detailView.name}</td>

			</tr>
			<tr>
				<td width="25%" align="center">대여가격</td>
				<td align="left">${detailView.price }원</td>
			</tr>
			<tr>
				<td width="25%" align="center">대여수량</td>
				<td align="left">
					<select name="qty">
						<option value="${detailDto.qty}" selected>${detailDto.qty}대</option>
						<option>------</option>
						<option value="1">1대</option>
						<option value="2">2대</option>
						<option value="3">3대</option>
						<option value="4">4대</option>
						<option value="5">5대</option>
					</select>
				</td>
			</tr>
			<tr>
			<td width="25%" align="center">대여기간</td>
				<td  align="left" width="40">
					<select name="dday">
						<option value="${detailDto.dday}" selected>${detailDto.dday}일</option>
						<option>------</option>
						<option value="1">1일</option>
						<option value="2">2일</option>
						<option value="3">3일</option>
						<option value="4">4일</option>
						<option value="5">5일</option>
						<option value="6">6일</option>
						<option value="7">7일</option>
					</select>
				</td>
			</tr>
			<tr>
				<td width="25%" align="center">대여일자</td>
				<td align="left">
					<input type="date" name="rday" value="${detailDto.rday}">
				</td>
			</tr>

			<tr>
				<td width="25%" align="center">보험</td>
				<td align="left">
					<select name="insurance" width="40">
						<c:choose>
							<c:when test = "${detailDto.insurance eq 0}">
								<option value="${detailDto.insurance}" selected>비적용</option>
							</c:when>
							<c:when test = "${detailDto.insurance ne 0}">
								<option value="${detailDto.insurance}" selected>적용</option>
							</c:when>
						</c:choose>
						<option>------</option>
						<option value="1">적용(1일1만원)</option>
						<option value="0">비적용</option>
					</select>
				</td>
			</tr>
			<tr>
				<td width="25%" align="center">WiFi</td>
				<td align="left">
					<select name="wifi" width="40">
						<c:choose>
							<c:when test = "${detailDto.wifi eq 0}">
								<option value="${detailDto.wifi}" selected>비적용</option>
							</c:when>
							<c:when test = "${detailDto.wifi ne 0}">
								<option value="${detailDto.wifi}" selected>적용</option>
							</c:when>
						</c:choose>
						<option>------</option>
						<option value="1">적용(1일1만원)</option>
						<option value="0">비적용</option>
					</select>
				</td>
			</tr>

			<tr>
				<td width="25%" align="center">Navigation</td>
				<td align="left">
					<select name="navigation" width="40">
						<c:choose>
							<c:when test = "${detailDto.navigation eq 0}">
								<option value="${detailDto.navigation}" selected>비적용</option>
							</c:when>
							<c:when test = "${detailDto.navigation ne 0}">
								<option value="${detailDto.navigation}" selected>적용</option>
							</c:when>
						</c:choose>
						<option>------</option>
						<option value="1">적용(무료)</option>
						<option value="0">비적용</option>
					</select>
				</td>
			</tr>
			<tr>
				<td width="25%" align="center">Baby seat</td>
				<td align="left">
					<select name="babyseat" width="40">
						<c:choose>
							<c:when test = "${detailDto.babyseat eq 0}">
								<option value="${detailDto.babyseat}" selected>비적용</option>
							</c:when>
							<c:when test = "${detailDto.babyseat ne 0}">
								<option value="${detailDto.babyseat}" selected>적용</option>
							</c:when>
						</c:choose>
						<option>------</option>
						<option value="1">적용(5000원)</option>
						<option value="0">비적용</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="3" width="50%" align="center">
					<input type="hidden" name="no" value="${detailDto.no}">
					<input type="hidden" name="memid" value="${detailView.memid}">
					<input type="hidden" name="price" value="${detailView.price}">
					<input type="submit" value="수정하기">
					<input type="button" value="취소" onclick="javascript:history.back()"/>
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>