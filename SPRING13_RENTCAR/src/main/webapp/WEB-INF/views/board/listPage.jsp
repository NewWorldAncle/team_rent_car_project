<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${path}/resources/css/login_related.css" rel="stylesheet" />
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
	<div class="navi_container">
		<nav class="navi">
			<div class="navi_logo">
				<%
					// 로그인 X
				if (session.getAttribute("login") == null) {
				%>
				<a href="/rentcar/">V-RENTCAR</a>
				<%
					}
				// 로그인 O
				if (session.getAttribute("login") != null) {
				%>
				<a href="/rentcar/member/">V-RENTCAR</a>
				<%
					}
				%>
			</div>
			<ul class="naiv_menu">
				<%
					//===============================================================================
				//					로	그	인	된	상	태	-	관	리	자
				//===============================================================================
				if (session.getAttribute("login") != null) {
					String mid = (String) session.getAttribute("id"); //String mid생성

					if (mid.equals("admin")) { //관리자(admin) 로그인
				%>
				<li><a href="/rentcar/admin/pageAnalyze">PageAnalyze</a></li>
				<li><a href="/rentcar/car/carList">RentCarList</a></li>
				<li><a href="memList">Member</a></li>
				<li><a href="/rentcar/board/listPage">QnA</a></li>
				<li><a href="myList?id=${login.id}">MyPage</a></li>
				<li id="a">관리자님 접속</li>
				<li><a href="logout">Logout</a></li>
				<li><a href="#" class="navi__toggle"><i class="fas fa-bars"></i></a></li>
				<%
					} else {
				//===============================================================================
				//						로	그	인	된	상	태	-	유	저
				//===============================================================================
				%>
				<li><a href="/rentcar/reserve/catalog">RentCar</a></li>
				<li><a href="/rentcar/board/listPage">QnA</a></li>
				<li><a href="myList?id=${login.id}">MyPage</a>
				<li>
				<li id="a"><%=mid%> 회원님 접속</li>
				<li><a href="logout">Logout</a></li>
				<li><a href="#" class="navi__toggle"><i class="fas fa-bars"></i></a></li>
				<%
					}
				} else {
				//===============================================================================
				//						로	그	인	안	된	상	태
				//===============================================================================
				%>
				<li><a href="/rentcar/reserve/catalog">RentCar</a></li>
				<li><a href="/rentcar/board/listPage">QnA</a></li>
				<li><a href="member/loginForm">Login</a></li>
				<li><a href="#" class="navi__toggle"><i class="fas fa-bars"></i></a></li>
				<%
					}
				%>
			</ul>
		</nav>
	</div>
	<h3>게시판</h3>
	<form role="form" method="get">
	
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
			<c:forEach items="${listPage }" var="dto">
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
   					<a class="page-link" href="listPage${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a>
   				</li> 
				
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<li <c:out value="${pageMaker.cri.page == idx ? 'class=active' : ''}"/>>
						<a class="page-link" href="listPage${pageMaker.makeSearch(idx)}">${idx}</a>
					</li>
				</c:forEach>
				
				<li class="page-item">
					<a class="page-link" href="listPage${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
				</li>
			</ul>
		</div>
		
  <div class="search" style="float:right;">
    <select name="searchType">
      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
    </select>

    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>

    <button id="searchBtn" type="submit">검색</button>
    <script>
      $(function(){
        $('#searchBtn').click(function() {
          self.location = "listPage" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>
  </div>		
  
</body>
</html>
