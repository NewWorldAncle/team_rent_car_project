<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>/렌트카회사이름/</title>
<link href="${path}/resources/css/common.css" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/c895b3190c.js"
	crossorigin="anonymous"></script>
<script>
	window.onload = function() {

		$('.back_Gimg > ul> li:eq(2)').hide();
		$('.back_Gimg > ul> li:eq(1)').hide();
		setInterval(function() {
			$('.back_Gimg > ul> li:first').fadeOut(2000).next().fadeIn(2000)
					.end().appendTo('.back_Gimg > ul');
		}, 6000);
	}
</script>
</head>
<body>
	<div class="navi_container">
		<nav class="navi">
			<div class="navi_logo">
				<h1>
					<a href="home">V-RENTCAR</a>
				</h1>
			</div>
			<ul class="naiv_menu">
				<li><a href="carmain">RentCar</a></li>
				<li><a href="boardmain">QnA</a></li>
				<li><a href="#">Login</a></li>
				<li><a href="#" class="navi__toggle"><i class="fas fa-bars"></i></a></li>
			</ul>
		</nav>
	</div>
	<div class="main_wrap">
		<div class="main_back_container">
			<div class="back_G">
				<div id="big_back"></div>
				<div id="small_back">
					<div id="top_triangle"></div>				
				</div>
			</div>
			<div class="back_Gimg">
				<ul>
					<li><img class="main_slider" alt="슬라이더 이미지1"
						src="resources/img/mainslider1.jpg"></li>
					<li><img class="main_slider" alt="슬라이더 이미지2"
						src="resources/img/mainslider2.jpg"></li>
					<li><img class="main_slider" alt="슬라이더 이미지3"
						src="resources/img/mainslider3.jpg"></li>
				</ul>
			</div>
		</div>

		<div class="txt_area">
			<p>sub slogan position</p>
			<h2>first main slogan position</h2>
			<h2>second main slogan position</h2>
		</div>
		<div class="txt_scroll">Scroll Down</div>
	</div>
	
	
	<div class="location_info">
		<div class="loaction_txtmain">
			<p>LOCATION</p>
			<P>찾아오시는 길</P>
		</div>
		
		<div class="loaction_txtarea">
		
			<div class="loaction_txtarea_card">
				<i class="far fa-lightbulb"></i>
				<div class="card_txt">
					<p>[렌트카회사이름]</p>
					<p>저희 [레트카회사이름]은 합리적인 가격에 <br>
						좋은품질의 자동차를 제공하고있습니다</p>
				</div>
			</div>

			<div class="loaction_txtarea_card">
				<i class="fas fa-building"></i>
				<div class="card_txt">
					<p>사업자 정보</p>
					<p>대전 서구 둔산로 134 아베스빌딩 3층 / 대표:아무개<br>
						사업자 등록번호 : 987-66-12345<br>
						렌트카사업등록 : 2022-대전서구-1234<br>
					</p>
				</div>
			</div>
			<div class="loaction_txtarea_card">
				<i class="fas fa-headset"></i>
				<div class="card_txt">
					<p>고객 지원</p>
					<p>상담전화 : 1588-1234<br>
						이메일 : admin@email.com<br>
						상담가능 시간 : 9:00~17:30 주말/공휴일 제외<br>
					</p>
				</div>
			</div>
		</div>
		<div id="map"></div>
	</div>
	

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	65a78f9a5e49db3ff20dc5396c98841b"></script>
	<script>
		var mapContainer = document.getElementById('map'),
		mapOption = {
			center : new kakao.maps.LatLng(36.35099521726047, 127.3886331972048),level : 4
		};

		var map = new kakao.maps.Map(mapContainer, mapOption);

		var markerPosition = new kakao.maps.LatLng(36.35099521726047,
				127.3886331972048);

		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		marker.setMap(map);
	</script>

</body>
</html>