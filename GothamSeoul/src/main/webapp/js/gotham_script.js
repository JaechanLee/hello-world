// Global variables
var lng = 37.5367416;
var lat = 127.1472435;
var address = "서울시 강동구 천호대로 1231 길동현대아파트";
var mymap;
var districts;
var crimeData;

// Functions description

// 0. Others

// Leaflet for javascript
// 1. Leaflet

// 2. Address search
// 2-1. Dropdown setting
$('.dropdown ul li a').click(function() {
	$(this).parents('.dropdown').children('button').text($(this).text());
//	$(this).parents('.dropdown').children('.btn btn-default dropdown-toggle').text("modified");
});

// 2-2. Show district searched
function showDistricts() {
//	$.getJSON("geoJSON/seoul_municipalities_geo.json", function(jsonFeature) {
//		districts = jsonFeature;
		var jsonFeature_ = (districts.features).filter(function(data) {
			// to use .filter() function, selected a key: '.features' which is enclosed by '[,]' -> Array type
			return data.properties.SIG_KOR_NM == $('#search_input_district button').text();
		});
		L.geoJSON(jsonFeature_).addTo(mymap);
//	});
};

// 3. Geocode(Naver)
// 3-0. Get current location
function getCurrentLocation() {
	function getLocation() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(showPosition,
					showError);
		} else {
			alert(" 이 브라우저는 geolocation을 지원하지 않습니다.");
		}
	};
	
	function showPosition(position) {
		lat = position.coords.latitude;
		lng = position.coords.longitude;
		setTimeout(function() {
			$.ajax({
				url: "/GothamSeoul/locationData.do?lat=" + lat + "&lng=" + lng,
				type: "get",
				success: function(data) {
					$('#map_container iframe').attr("src", "leafletchart/index.html");
				}
			});
		}, 200);
	};
	
	function showError(error) {
		alert("error");
	};
	
	getLocation();
//	setTimeout( function(){
//		   naver.maps.Service.reverseGeocode({
//		       location: new naver.maps.LatLng(lat, lng),
//		   }, function(status, response) {
//		       if (status !== naver.maps.Service.Status.OK) {
//		           return alert('Something wrong!');
//		       }
//		       
//		       var result = response.result, // 검색 결과의 컨테이너
//		       items = result.items; // 검색 결과의 배열
//		       guName = items[2].address.split(' ')[1];
//	//		       console.log(guName);
//	//		       alert(guName);
//		   }); 
//		}, 20);
};
// 3-1. Get location of given address
//function geocode(address) {
//	naver.maps.Service.geocode({
//	    address: address
//		}, function(status, response) {
//	    if (status !== naver.maps.Service.Status.OK) {
//	        return alert('Something wrong!');
//	    }
//
//	    var result = response.result, // container for search result
//	        point = result.items[0].point; // result needed
//	    
//	    lat = JSON.stringify(point.x);
//	    lng = JSON.stringify(point.y);
//
//	    callLeaflet(lng, lat); // callback
//	});
//};

// 4. Item
// 4-1. Item container animation(1)
function tabClick1() {
	$('#content_title_1').click(function() {
		$(this).css({"background-color":"white"});
		$('#content_title_2').css({"background-color":"rgb(223, 223, 221)"});
		$('#map_container').show();
	});
	$('#content_title_2').click(function() {
		$(this).css({"background-color":"white"});
		$('#content_title_1').css({"background-color":"rgb(223, 223, 221)"});
		$('#map_container').hide();
	});
	$('#content_title_1').trigger("click");
};

// 4-2. Item container animation(2)
function tabClick2() {
	$('#item_title_1').click(function() {
		$('#report_container_1').show();
		$('#report_container_2').hide();
		$('#report_container_3').hide();
	});
	$('#item_title_2').click(function() {
		$('#report_container_1').hide();
		$('#report_container_2').show();
		$('#report_container_3').hide();
	});
	$('#item_title_3').click(function() {
		$('#report_container_1').hide();
		$('#report_container_2').hide();
		$('#report_container_3').show();
	});
}

//Page script starter
$(document).ready(function() {
	getCurrentLocation();
	tabClick1();
	tabClick2();
});