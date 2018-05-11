// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery3
//= require_tree .

	function initMap() {
					var polygonText = document.getElementById("polygon-text").textContent;
					var arrCoords = polygonText.split(',');
					var polygonCoords = [];

					for(i=0; i < arrCoords.length; i++){
						var coords = arrCoords[i].split(' ');
						polygonCoords.push({lat: parseFloat(coords[0]), lng: parseFloat(coords[1])});
					}
       
 				 function getCenter(){
				   var coords = polygonCoords[parseInt(polygonCoords.length / 2)];
						var firstCoord = polygonCoords[0];
						return {lat: parseFloat((coords.lat+firstCoord.lat)/2), lng: parseFloat((coords.lng+firstCoord.lng)/2) };
				 }	

					var map = new google.maps.Map(document.getElementById('map'), {
          	zoom: 8,
          	center: getCenter(),
          	mapTypeId: 'terrain'
        	});

        	// Construct the polygon.
        	var polygonArea = new google.maps.Polygon({
          	paths: polygonCoords,
          	strokeColor: '#FF0000',
          	strokeOpacity: 0.8,
          	strokeWeight: 2,
          	fillColor: '#FF0000',
          	fillOpacity: 0.35
        	});
        	polygonArea.setMap(map);
      	}

 
