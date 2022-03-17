<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${path}/resources/css/board.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>게시판</title>
<%
	request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
session = request.getSession();
%>
</head>
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
			//						로	그	인	O	-	관	리	자
			//===============================================================================
			if (session.getAttribute("login") != null) {
				String mid = (String) session.getAttribute("id"); //String mid생성

				if (mid.equals("admin")) { //관리자(admin) 로그인
			%>
			<li><a href="/rentcar/admin/pageAnalyze">PageAnalyze</a></li>
			<li><a href="/rentcar/car/carList">RentCarList</a></li>
			<li><a href="memList">MemberList</a></li>
			<li><a href="/rentcar/reserve/allList">ReserveList</a></li>
			<li><a href="/rentcar/board/listPage">QnA</a></li>
			<li><a href="myList?id=${login.id}">MyPage</a></li>
			<li id="a"><i class="fas fa-user"></i>관리자</li>
			<li><a href="logout">Logout</a></li>
			<li><a href="#" class="navi__toggle"><i class="fas fa-bars"></i></a></li>
			<%
				} else {
			//===============================================================================
			//							로	그	인	O	-	유	저
			//===============================================================================
			%>
			<li><a href="/rentcar/reserve/catalog">RentCar</a></li>
			<li><a href="/rentcar/board/listPage">QnA</a></li>
			<li><a href="/rentcar/reserve/byMemList?memid=${login.id}">MyReserve</a>
			<li>
			<li><a href="myList?id=${login.id}">MyPage</a>
			<li>
			<li id="a"><i class="fas fa-user"></i><%=mid%>님</li>
			<li><a href="logout">Logout</a></li>
			<li><a href="#" class="navi__toggle"><i class="fas fa-bars"></i></a></li>
			<%
				}
			} else {
			//===============================================================================
			//								로	그	인	X
			//===============================================================================
			%>
			<li><a href="/rentcar/reserve/catalog">RentCar</a></li>
			<li><a href="/rentcar/board/listPage">QnA</a></li>
			<li><a href="/rentcar/member/loginForm">Login</a></li>
			<li><a href="#" class="navi__toggle"><i class="fas fa-bars"></i></a></li>
			<%
				}
			%>
		</ul>
	</nav>
</div>
<!-- ===========================================네비 메뉴 끝 =============================== -->
<section class="listSection">
	<div class="listBox">
		<h3 class="head_txt">게시판</h3>


		<table class=table_css>
			<tr>
				<!-- 상단 -->
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>게시일</th>
				<th>조회수</th>
			</tr>
			<tr>
				<!-- 중단(본문) -->
				<c:forEach items="${listPage }" var="dto">
					<tr>
						<td width="10%"><c:out value="${dto.num}" /></td>
						<td width="40%"><c:forEach begin="1" end="${dto.re_level}">ㄴ</c:forEach>
							<a class="con_atag" href="view?num=${dto.num}"><c:out
									value="${dto.subject}" /></a></td>
						<td>${dto.writer}</td>
						<td>${dto.reg_date}</td>
						<td>${dto.readcount}</td>
				</c:forEach>
			</tr>

			<!-- 		<tfoot>
			<tr>	하단
				<td class="buttons">
					<input type="button" class="btn btn-outline-success" value="글쓰기" onclick="javascript:window.location='write'"/>&nbsp;
				</td>
			</tr>
		</tfoot> -->
		</table>
		<div class="layoutBox">
			<ul class="pageBtnWrap">
				<li class="page-item"><a class="page-link btn"
					href="listPage${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a>
				</li>

				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="idx">
					<li
						<c:out value="${pageMaker.cri.page == idx ? 'class=active' : ''}"/>>
						<a class="page-link" href="listPage${pageMaker.makeSearch(idx)}">${idx}</a>
					</li>
				</c:forEach>

				<li class="page-item"><a class="page-link btn"
					href="listPage${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
				</li>
			</ul>
			<div>
				<a class="buttons" href="write">글작성</a>
			</div>
		</div>
		<div class="search" style="float: right;">
			<select name="searchType">
				<option value="n"
					<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
				<option value="t"
					<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
				<option value="c"
					<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
				<option value="w"
					<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
				<option value="tc"
					<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
			</select> <input type="text" name="keyword" id="keywordInput"
				value="${scri.keyword}" />

			<button id="searchBtn" type="submit">검색</button>
			<script>
				$(function() {
					$('#searchBtn').click(
							function() {
								self.location = "listPage"
										+ '${pageMaker.makeQuery(1)}'
										+ "&searchType="
										+ $("select option:selected").val()
										+ "&keyword="
										+ encodeURIComponent($('#keywordInput')
												.val());
							});
				});
			</script>
		</div>
	</div>
</section>



</body>
</html>
