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
