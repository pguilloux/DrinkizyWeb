$(document).ready(function(){


	
});



function initialize(long, lat, name) {
	var myLatlng = new google.maps.LatLng(long, lat);
    var mapOptions = {
      center: new google.maps.LatLng(long, lat),
      zoom: 15
    };
    var map = new google.maps.Map(document.getElementById("map-canvas"),mapOptions);
    var marker = new google.maps.Marker({
	    position: myLatlng,
	    map: map,
	    title: name
	});

    var infowindow = new google.maps.InfoWindow();
	google.maps.event.addListener(marker, 'click', function() {
	    infowindow.setContent(name);
	    infowindow.open(map, marker);
  	});

}