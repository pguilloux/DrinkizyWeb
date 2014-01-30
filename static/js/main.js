$(document).ready(function(){


	$("input[name=categories]").change(function() {
		var category = $(this).val();
		console.log(category);
		/*$.getJSON("{% url list_cities %}", { province: province }, function(cities) {
		    var cities_select = $("#cities");
		    … put the `cities` list into the `cities_select` …
		});*/
	});

});
