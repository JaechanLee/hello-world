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
// 1. Leaflet - general
// 1-1. Print leaflet
function callLeaflet(lng, lat) {
	mymap = L.map('map').setView([lng, lat], 13);

	L.tileLayer('https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}{r}.png', {
		attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a> &copy; <a href="https://carto.com/attributions">CARTO</a>',
		subdomains: 'abcd',
	    maxZoom: 18,
	    id: 'mapbox.streets',
	    accessToken: 'pk.eyJ1IjoibHVuYXJiIiwiYSI6ImNqb253M3JnMTBkYWozcXFzajBydHJreG4ifQ.v-1uxREgiTygQh_7O-10MQ'
	}).addTo(mymap);
	
	L.control.locate({
//		locateOptions: {
//			minZoom: 18,
//			maxZoom: 18
//		}
	}).addTo(mymap);
	
//	showCrimeMap();
	showDistricts();
};

// 1-2. Map removing process needed for update
function removeLeaflet() {
	if (map != undefined || map != null) {
		map.remove();
		$("#map_container").empty().html("<div id='map'></div>");
	}
};

// 1-3. Update leaflet by searched address
function updateBySearch() {
	$('#search_button').click(function() {
		address = $('#search_input_district button').text() + $('#search_input_detail')[0].value;
		console.log(address);
		removeLeaflet();
		geocode(address);
	});
};


// 2. Leaflet - layer
// 2-0. Bring geoJSON data
function bringJSON() {
	$.ajax({
		url: "geoJSON/seoul_municipalities_geo.json",
		dataType: "json",
		async: false,
		success: function(jsonFeature) {
			districts = jsonFeature;
		}
	});
	
	$.ajax({
		url: "dataset/2017crime.json",
		dataType: "json",
		async: false,
		success: function(jsonFeature) {
			crimeData = jsonFeature;
		}
	});
//	$.getJSON("geoJSON/seoul_municipalities_geo.json", function(jsonFeature) {
//		districts = jsonFeature;
//	});
};

// 2-1. Show choropleth map(polygons) by categories
function showCrimeMap() {
	
	function getColor(d) {
	    return d > 7000 ? '#800026' :
	           d > 6000 ? '#BD0026' :
	           d > 5000 ? '#E31A1C' :
	           d > 4000 ? '#FC4E2A' :
	           d > 3000 ? '#FD8D3C' :
	           d > 2000 ? '#FEB24C' :
	           d > 1000 ? '#FED976' :
	                      '#FFEDA0';
	}

	function style(districts) {
		var crimeData_ = (crimeData).filter(function(data) {
			return data.자치구 == districts.properties.SIG_KOR_NM;
		});
	    return {
	        fillColor: getColor(crimeData_[0].범죄_발생_총합),
	        weight: 2,
	        opacity: 1,
	        color: 'white',
	        dashArray: '3',
	        fillOpacity: 0.7
	    };
	}
	
	L.geoJSON(districts, {style: style}).addTo(mymap);
};

// 2-2. District searching
// 2-2-1. Dropdown setting
$('.dropdown ul li a').click(function() {
	$(this).parents('.dropdown').children('button').text($(this).text());
//	$(this).parents('.dropdown').children('.btn btn-default dropdown-toggle').text("modified");
});

// 2-2-2. Show district searched
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

// 3. Geocode(Naver) and update leaflet by produced location
function geocode(address) {
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

	    callLeaflet(lng, lat); // callback
	});
};

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
	bringJSON();
	updateBySearch();
	callLeaflet(lng, lat);
	tabClick1();
	tabClick2();
});