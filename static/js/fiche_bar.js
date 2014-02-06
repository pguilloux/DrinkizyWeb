$(document).ready(function(){

	//Call the layout settings and masonry
	var MasonryObject = {
		msnry : "",
		initMsnry : function(){
			var container = document.querySelector('#container-barCard');
			msnry = new Masonry( container, {
				// options
				columnWidth: 100,
				itemSelector: '.menuCat '
			});
		},
		destroyMsnry : function(){
			msnry.destroy();
		},
		layoutMsnry : function(){
			msnry.layout();
		}
	};

	MasonryObject.initMsnry();

	$(".bar-card .menuCat li").click(function(e){

		$(this).find(" .infoDrinks").slideToggle(100, function(){
			MasonryObject.layoutMsnry();
		});
		
		$(this).toggleClass("selected");

		

		e.preventDefault();
	})

	
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

}