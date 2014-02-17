$(document).ready(function(){

	var mapOpen = false;

	$('.content-resultats-list-button').click(function(e){
		
		var width = $('.content-resultats-filtres').width();
		$('.container-resultats-filtres').css('width',width);

		$('.content-resultats-filtres').toggleClass('noWidth');

		if( $('.content-resultats-filtres').hasClass('noWidth') ) {
			$('.content-resultats-list').removeClass('col-md-4 col-sm-5 col-xs-7').addClass('col-md-6 col-sm-8 col-xs-11');
		} else {
			$('.content-resultats-list').removeClass('col-md-6 col-sm-8 col-xs-11').addClass('col-md-4 col-sm-5 col-xs-7');
			$('.container-resultats-filtres').css('width', 'auto');
		}

		e.preventDefault();


	});

	$('.content-resultats-map-button').click(function(e){

		$('.content-resultats-map').toggleClass('marginLess');

		if ( $('.content-resultats-map').hasClass('marginLess') ) {
			$('.content-resultats-map').removeClass('col-xs-1').addClass('col-xs-12');
			$('.content-resultats-map-button').removeClass('col-xs-12').addClass('col-xs-1');

			$('#map').css('width','91%');
			setTimeout(function(){google.maps.event.trigger(map, 'resize');},300);
			
			mapOpen = true;
		} else {
			$('.content-resultats-map').removeClass('col-xs-12').addClass('col-xs-1');
			$('.content-resultats-map-button').removeClass('col-xs-1').addClass('col-xs-12');
			$('#map').css('width','100%');
			mapOpen = false;
		}

		e.preventDefault();
	});

	$( window ).resize(function() {
		
		if (mapOpen && $(window).width()>=768){
			$('.content-resultats-map')
				.toggleClass('marginLess')
				.removeClass('col-xs-12').addClass('col-xs-1');
			$('.content-resultats-map-button').removeClass('col-xs-1').addClass('col-xs-12');
			$('#map').css('width','100%');
			mapOpen = false;
		}
	});






});


function initialize(locations) {
	var map = new google.maps.Map(document.getElementById('map'), {
		zoom: 6,
		center: new google.maps.LatLng(47.4,1.6),
		mapTypeControl: true,
		mapTypeControlOptions: {
			style: google.maps.MapTypeControlStyle.DROPDOWN_MENU
		},
		navigationControl: true,
		navigationControlOptions: {
			style: google.maps.NavigationControlStyle.SMALL,
			position: google.maps.ControlPosition.TOP_RIGHT
		},
		scaleControl: true,
		streetViewControl: false,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	});

	var infowindow = new google.maps.InfoWindow();

	var marker, i;

	for (i = 0; i < locations.length; i++) {  
		marker = new google.maps.Marker({
		position: new google.maps.LatLng(locations[i][1], locations[i][2]),
		map: map
	});

	google.maps.event.addListener(marker, 'click', (function(marker, i) {
		return function() {
		  infowindow.setContent(locations[i][0]);
		  infowindow.open(map, marker);
		}
		})(marker, i));
	}
};
	