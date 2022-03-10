<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<title>게시판</title>
	<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		session = request.getSession();
	%>
</head>

<body class="container">
	<%	// 로그인 X
		if(session.getAttribute("login") == null) {
	%>
	<h2><a href="/rentcar/">홈으로</a></h2><hr>
	<% 
		}
		// 로그인 O
		if(session.getAttribute("login") != null) {
	%>
	<h2><a href="/rentcar/member/">홈으로</a></h2><hr>
	<% 
		}
	%>
	<h3>게시판</h3>
		<table class="table table-hover">
		<thead class="table-dark">
			<tr>	<!-- 상단 -->
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>게시일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr>	<!-- 중단(본문) -->
			<c:forEach items="${list }" var="dto">
				<tr>
					<td width="10%"><c:out value="${dto.num}"/></td>
					<td width="40%">
						<c:forEach begin="1" end="${dto.re_level}">ㄴ</c:forEach>
						<a href="view?num=${dto.num}"><c:out value="${dto.subject}"/></a>
					</td>
					<td width="15%">${dto.writer}</td>
					<td width="20%">${dto.reg_date}</td>
					<td align="center" width="10%">${dto.readcount}</td>
			</c:forEach>
			</tr>
		</tbody>
		<tfoot>
			<tr>	<!-- 하단 -->
				<td colspan="5" align="right">
					<input type="button" class="btn btn-outline-success" value="글쓰기" onclick="javascript:window.location='write'"/>&nbsp;
				</td>
			</tr>
		</tfoot>
		</table>
		
		<div class="col-md-offset-3">
  			<ul class="pagination justify-content-center">
   				<li class="page-item">
   					<a class="page-link" href="listPage${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a>
   				</li> 
				
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<li <c:out value="${pageMaker.cri.page == idx ? 'class=active' : ''}"/>>
						<a class="page-link" href="listPage${pageMaker.makeQuery(idx)}">${idx}</a>
					</li>
				</c:forEach>
				
				<li class="page-item">
					<a class="page-link" href="listPage${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a>
				</li>
			</ul>
		</div>
</body>
</html>