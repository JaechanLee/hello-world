// Global variables
var lng = 37.5367416;
var lat = 127.1472435;
var address = "서울시 강동구 천호대로 1231 길동현대아파트";
var mymap;
var districts;
var crimeData;

// Functions description

// 0. Others

// Leaflet
// 1. Leaflet
// 1-1. Draw leaflet
function drawLeaflet(lat, lng) {
	$.ajax({
		url: "/GothamSeoul/locationData.do?lat=" + lat + "&lng=" + lng,
		type: "get",
		success: function(data) {
			alert(JSON.stringify(data));
			$('#map_container iframe').attr("src", "leafletchart/index.html");
			$('#comm').html(data.comm);
			$('#temp').html(data.temp+'°C');
			$('#w_graph1').attr("src","/test1.jpg");
			$('#w_graph2').attr("src","/test2.jpg");
		}
	});
};

function drawGraph(){
	$.ajax({
		url: "/GothamSeoul/graphy.do?",
		type: "get",
		success: function(data) {
//			alert("data:image/jpg;base64, " + data);
			$('#result_graphy').attr("src", "data:image/jpg;base64, "+ data);
		}
	});
}


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

// 3. Geocode
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
			drawLeaflet(lat, lng);
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

// 3-1. Get a location of given address
// 3-1-0. Get a string of given address
function getAddress() {
	$('#search_button').click(function() {
		address = $('#search_input_district button').text() + $('#search_input_detail')[0].value;
		getAddressLocation(address);
	});
};

// 3-1-1. Get a location of given address
function getAddressLocation(address) {
	naver.maps.Service.geocode({
	    address: address
		}, function(status, response) {
	    if (status !== naver.maps.Service.Status.OK) {
	        return alert('Something wrong!');
	    }

	    var result = response.result, // container for search result
	        point = result.items[0].point; // result needed
	    
	    lat = JSON.stringify(point.x);
	    lng = JSON.stringify(point.y);

	    drawLeaflet(lng, lat); // callback
	});
};

// 4. Tab Click Event
// 4-1. Item container event(1)
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

// 4-2. Item container event(2)
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
		drawGraph();
	});
}

// 5. Animation
// 5-1. Site description toggle
function siteDescriptionToggle() {
	$('#site_description_toggle').click(function() {
		if ($(this).data("key") != true) {
			$('#site_description').css({"max-height": this.previousElementSibling.scrollHeight + "px"});
			$(this).data("key", true);
		} else {
			$('#site_description').css({"max-height": "0"});
			$(this).data("key", false);
		}
	});
};

// 5-?. Item index color differing
function itemIndexColor() {
	$('.item_index').each(function() {
		var key = $(this).text();
		if (key >= 90) {
			$(this).css({color: "#000066"});
		} else if (key >= 75) {
			$(this).css({color: "#006600"});
		} else if (key >= 60) {
			$(this).css({color: "#e6b800"});
		} else {
			$(this).css({color: "#b30000"});
		}
	});
};

// 6. Get alarm data
// 6-1. Accident Alarm
function accidentAlarm() {
	$.ajax({
		url: "/GothamSeoul/accidentAlarm.do",
		type: "get",
		success: function(data) {
			alert(JSON.stringify(data));
		}
	});
};

function fireAlarm() {
	$.ajax({
		url: "/GothamSeoul/fireAlarm.do",
		type: "get",
		success: function(data) {
			alert(JSON.stringify(data));
		}
	});
};

//Page script starter
$(document).ready(function() {
	getCurrentLocation();
	tabClick1();
	tabClick2();
	siteDescriptionToggle();
	itemIndexColor();
	getAddress();
//	fireAlarm();
//	accidentAlarm();
});