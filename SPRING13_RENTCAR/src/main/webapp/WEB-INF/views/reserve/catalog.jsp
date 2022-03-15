<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>차량 목록</title>
	<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		session = request.getSession();
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
	<h3>차량 목록</h3>
	
	<table width="1000" align="center">
	<c:forEach items="${catalog}" var="dto">
		<tr>
			<td width="333" align="center">
				<a href="regAction?no=${dto.no}">
					<img src="<spring:url value='/resources/img/${dto.img}'/>" alt="car" width="200" height="150"><br>
				</a>
				${dto.name}
			</td>
		</tr>
	</c:forEach>
	</table>
	
</body>
</html>