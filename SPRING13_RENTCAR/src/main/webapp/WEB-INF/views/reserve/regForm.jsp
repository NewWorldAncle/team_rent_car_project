<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>차량 예약하기</title>
	<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		session = request.getSession();
	%>
	<% 
	if(session.getAttribute("login") == null) {
	%>
		<script language="JavaScript">
			alert("로그인 후 가능합니다.");
			window.location.href = "/rentcar/member/loginForm";
		</script>
	<%
		}
	%>
</head>

<body>
	<%	// 로그인 X
		if(session.getAttribute("login") == null) {
	%>
	<h2><a href="/rentcar/">V-RENTCAR</a></h2><hr>
	<% 
		}
		// 로그인 O
		if(session.getAttribute("login") != null) {
	%>
	<h2><a href="/rentcar/member/">V-RENTCAR</a></h2><hr>
	<% 
		}
	%>
	<h3>차량 예약하기</h3>	
	<form action="regOk" method="post">
		<table border="1" align="center">
			<tr>
				<td rowspan="12" width="50%" align="center">
					<img name="img" src="<spring:url value='/resources/img/${dto.img}'/>" alt="car" width="200" height="150">
				</td>
				
				<td width="25%" align="center">차량이름</td>
				<td align="left">${dto.name}</td>

			</tr>
			<tr>
				<td width="25%" align="center">차량분류</td>
				<td align="left">${dto.category}</td>
			</tr>
			<tr>
				<td width="25%" align="center">대여가격</td>
				<td align="left">${dto.price }</td>
			</tr>
			<tr>
				<td width="25%" align="center">제조회사</td>
				<td align="left">${dto.company }</td>
			</tr>
			<tr>
				<td width="25%" align="center">상세정보</td>
				<td align="left">${dto.info }</td>
			</tr>
			<tr>
				<td width="25%" align="center">대여수량</td>
				<td align="left"><select name="qty">
					<option value="1">1대</option>
					<option value="2">2대</option>
					<option value="3">3대</option>
					<option value="4">4대</option>
					<option value="5">5대</option>
				</select></td>
			</tr>
			<tr>
			<td width="25%" align="center">대여기간</td>
				<td  align="left" width="40"><select name="dday">
					<option value="1">1일</option>
					<option value="2">2일</option>
					<option value="3">3일</option>
					<option value="4">4일</option>
					<option value="5">5일</option>
					<option value="6">6일</option>
					<option value="7">7일</option>
				</select></td>
			</tr>
			<tr>
				<td width="25%" align="center">대여일자</td>
				<td align="left"><input type="date" name="rday"></td>
			</tr>

			<tr>
				<td width="25%" align="center">보험적용</td>
				<td align="left"><select name="insurance" width="40">
					<option value="1">적용(1일1만원)</option>
					<option value="0">비적용</option>
				</select></td>
			</tr>
			<tr>
				<td width="25%" align="center">WiFi적용</td>
				<td align="left"><select name="wifi" width="40">
					<option value="1">적용(1일1만원)</option>
					<option value="0">비적용</option>
				</select></td>
			</tr>

			<tr>
				<td width="25%" align="center">Navigation적용</td>
				<td align="left"><select name="navigation" width="40">
					<option value="1">적용(무료)</option>
					<option value="0">비적용</option>
				</select></td>
			</tr>
			<tr>
				<td width="25%" align="center">Baby seat적용</td>
				<td align="left"><select name="babyseat" width="40">
					<option value="1">적용(5000원)</option>
					<option value="0">비적용</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="3" width="50%" align="center">
					<input type="hidden" name="no" value="${dto.no}">
					<input type="hidden" name="img" value="${dto.img }">
					<input type="hidden" name="memid" value="${memid}">
					<input type="hidden" name="price" value="${dto.price }">
					<input type="submit" value="예약하기">
					<input type="button" value="취소" onclick="javascript:history.back()"/>
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>