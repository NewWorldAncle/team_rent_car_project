<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 분석(관리자용)</title>
<link href="${path}/resources/css/login_related.css" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/c895b3190c.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>

<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	session = request.getSession();
%>
</head>
<body>
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
	<section class="joinSection">
		<div class="analyzeWrap">
			<div class="chartSize">
				<div>
					일 방문자수
				</div>
				<canvas id="numChart"></canvas>
			</div>
			<div class="chartSize">
				<div>
					브라우저 사용 비율
				</div>
				<canvas id="browserChart"></canvas>
			</div>
		</div>
	</section>
	<script type="text/javascript">
		const visitorDate = ${visitorDate}
		const visitorNum = ${visitorNum}
		const backArry = [];
		
		for(var i =0; i< visitorDate.length;i++){
			backArry.push("#262626")
		}
		
		const borderArry = [];
		for(var i =0; i< visitorDate.length;i++){
			borderArry.push("#0C0C0C")
		}
		const ctx = document.getElementById('numChart').getContext('2d');
		const numChart = new Chart(ctx, {
    		type: 'bar',
            data: {
				labels:visitorDate,
                datasets:[{
                	label: '일 방문자수',
                    fill: false,
                    data: visitorNum,
                    backgroundColor: backArry,
                    borderColor: backArry,
					borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });

        </script>
        <script type="text/javascript">
        new Chart(document.getElementById("browserChart"), {
            type: 'pie',
            data: {
              labels: (${visitorBrowser}),
              datasets: [{
                label: "브라우저 접속 비율",
                backgroundColor: ["#000000", "#484848","#717171","#ADADAD","#CFCFCF","#E6E6E6"],
                data: (${visitorNum})
              }]
            },
            options: {
              title: {
                display: true,
                text: '총 브라우저 접속 비율'
              }
            }
        });
        
        </script>
    </body>
</html>
