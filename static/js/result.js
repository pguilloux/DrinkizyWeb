var map;

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
			$('#map-canvas').show();
			$('.content-resultats-map').removeClass('col-xs-1').addClass('col-xs-12');
			$('.content-resultats-map-button').removeClass('col-xs-12').addClass('col-xs-1');

			$('#map-canvas').css('width','91%');
			setTimeout(function(){google.maps.event.trigger(map, 'resize');},300);
			
			mapOpen = true;
		} else {
			$('#map-canvas').hide();
			$('.content-resultats-map').removeClass('col-xs-12').addClass('col-xs-1');
			$('.content-resultats-map-button').removeClass('col-xs-1').addClass('col-xs-12');
			$('#map-canvas').css('width','100%');
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
		} else if ( $(window).width()>=768 ) {
			$('#map-canvas').show();
		} else if ( $(window).width()<=768 ) {
			$('#map-canvas').hide();
			$('.content-resultats-filtres').addClass('noWidth');
			$('.content-resultats-list').removeClass('col-md-4 col-sm-5 col-xs-7').addClass('col-md-6 col-sm-8 col-xs-11');
		} 
	});


	if ( $(window).width()<=768 ) {
		$('#map-canvas').hide();
	}




});



function initialize(locations) {

   	var bounds = new google.maps.LatLngBounds();

	map = new google.maps.Map(document.getElementById('map-canvas'), {
		
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
		bounds.extend(locations[i][1]);

		var mapLabel = new MapLabel({
          text: i+1,
          position: locations[i][1]+10.5,
          map: map,
          fontSize: 35,
          align: 'center'
        });
        mapLabel.set('position', locations[i][1]);

        var marker = new google.maps.Marker({
        	icon : '../../../static/medias/img_design/map-marker.png'
        });
        marker.bindTo('map', mapLabel);
        marker.bindTo('position', mapLabel);
        marker.setDraggable(true);
		

		/*marker = new google.maps.Marker({
			position: locations[i][1],
			icon: 'http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld='+(i+1)+'|FE6256|000000',
			map: map,

		});
		marker = new MarkerWithLabel({
            map: map,
            position: locations[i][1],
            icon : '../../../static/medias/img_design/map-marker.png',
            labelContent : i,
            labelAnchor : new google.maps.Point(3, 30),     // e.g. new google.maps.Point(21, 10);
            labelClass : "mapIconLabel",          // the CSS class for the label
            labelInBackground : false
        });*/

	   	map.fitBounds(bounds);

		google.maps.event.addListener(marker, 'click', (function(marker, i) {
			return function() {
			  infowindow.setContent(locations[i][0]);
			  infowindow.open(map, marker);
			}
			})(marker, i));
	}

};

	