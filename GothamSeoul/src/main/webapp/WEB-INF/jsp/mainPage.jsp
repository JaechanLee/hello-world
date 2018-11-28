<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<title>서울 재난정보 플랫폼 - main</title>
	
	<!-- CSS link -->
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- Bootstrap theme CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<!-- Leaflet CSS -->
	<link rel="stylesheet" href="<c:url value='/leaflet/leaflet.css' />" />
	<!-- Leaflet GPS control CSS -->
	<link href='https://api.mapbox.com/mapbox.js/plugins/leaflet-locatecontrol/v0.43.0/L.Control.Locate.mapbox.css' rel='stylesheet' />
	<link href='https://api.mapbox.com/mapbox.js/plugins/leaflet-locatecontrol/v0.43.0/css/font-awesome.min.css' rel='stylesheet' />
	<!-- FontAwesome CSS -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	<!-- Main CSS -->
	<link rel="stylesheet" href="<c:url value='/css/gotham_style.css' />" />
	
	<!-- JavaScript -->
	<!-- Leaflet -->
	<script src="<c:url value='/leaflet/leaflet.js' />"></script>
	<!-- Leaflet GPS control -->
	<script src='https://api.mapbox.com/mapbox.js/plugins/leaflet-locatecontrol/v0.43.0/L.Control.Locate.min.js'></script>
	<!-- Naver Geocode -->
	<script src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=t76XFOO4KOQe79v0K_L0&submodules=geocoder"></script>	
	<!-- jQeury -->
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<!-- jQuery User Interface -->
	<script src="https://code.jquery.com/ui/jquery-ui-git.js"></script>
	<!-- Bootstrap -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<!-- Main Javascript -->
	<!-- placed at the end of HTML body -->

</head>

<body>
	<div id="header">
		<a href="main.do"><h1>서울 재난정보 플랫폼</h1></a>
	</div>
	<div class="custom_container container-fluid" id="main">
		<div class="row" id="main_container">
			<div class="col-xs-1" id="sidebar_1">
				<div class="btn" id="content_title_1">
					<i class="fas fa-map fa-3x"></i>
					<p>지도</p>
				</div>
				<div class="btn" id="content_title_2">
					<i class="fas fa-file-alt fa-3x"></i>
					<p>보고서</p>
				</div>
			</div>
			<div class="col-xs-2" id="sidebar_2">
				<div class="item_title" id="item_title_1">
					<i class="fas fa-sun fa-3x"></i>
					<p>날씨/생활</p>
					<hr>
					<p class="item_index">97</p>
				</div>
				<div class="item_title" id="item_title_2">
					<i class="fas fa-car-crash fa-3x"></i>
					<p>화재/사고</p>
					<hr>
					<p class="item_index">56</p>
				</div>
				<div class="item_title" id="item_title_3">
					<i class="fas fa-shield-alt fa-3x"></i>
					<p>보건/안전</p>
					<hr>
					<p class="item_index">82</p>
				</div>
			</div>
			<div class="col-xs-9" id="submain">
				<div id="search_container">
					현재 주소 - 
					<div class="dropdown" id="search_input_district">
					 	<button class="btn" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
					 	district
					    <span class="caret"></span>
					    </button>
					    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
					    	<li role="presentation"><a role="menuitem" tabindex="-1" href="#">강남구</a></li>
					    	<li role="presentation"><a role="menuitem" tabindex="-1" href="#">강동구</a></li>
					 	  	<li role="presentation"><a role="menuitem" tabindex="-1" href="#">강북구</a></li>
					 	    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">강서구</a></li>
		   			 	    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">관악구</a></li>
					 	    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">광진구</a></li>
					 	    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">구로구</a></li>
					 	    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">금천구</a></li>
					 	    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">노원구</a></li>
					 	    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">도봉구</a></li>
					 	    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">동대문구</a></li>
					 	    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">동작구</a></li>
					 	    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">마포구</a></li>
					 	    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">서대문구</a></li>
					 	    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">서초구</a></li>
					 	    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">성동구</a></li>
					 	    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">성북구</a></li>
					 	    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">송파구</a></li>
					 	    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">양천구</a></li>
					 	    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">영등포구</a></li>
					 	    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">용산구</a></li>
					 	    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">은평구</a></li>
					 	    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">종로구</a></li>
					 	    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">중구</a></li>
					 	    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">중랑구</a></li>
						</ul>
					</div>
					<input type="text" id="search_input_detail" />
					<i class="fas fa-search btn" id="search_button"></i>
				</div>
				<div class="embed-responsive embed-responsive-16by9" id="map_container">
					<iframe class="embed-responsive-item" src="" allowfullscreen></iframe>
				</div>
				<div id="report_container_1">
				날씨/생활 보고서
				</div>
				<div id="report_container_2">
				화재/사고 보고서
				</div>
				<div id="report_container_3">
				보건/안전 보고서
				</div>
			</div>
		</div>
	</div>
	<div id="footer">
		<div id="site_info">
			GOTHAM.SEOUL<br>
			Multicampus Java Programming Course Final Project<br>
			(c) 2018 Kim Hojun - Kim Sooji - Lim Dongjoo - Choi Miji - Ji Joonho - Lee Jaechan
		</div>
	</div>

<!-- Main JavaScript -->
<script src="<c:url value='/js/gotham_script.js' />"></script>

</body>

</html>