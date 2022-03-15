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
<form role="form" method="get">
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

  <div class="search" style="float:right;">
    <select name="searchType">
      <option value="cn"<c:out value="${scri.searchType eq 'cn' ? 'selected' : ''}"/>>차량 이름</option>
    </select>

    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>

    <button id="searchBtn" type="submit">검색</button>
    <script>
      $(function(){
        $('#searchBtn').click(function() {
          self.location = "catalog" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>
  </div>	
	
	
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
</form>	
</body>
</html>
