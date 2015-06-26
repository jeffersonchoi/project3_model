// The init function needs to run on load
google.maps.event.addDomListener(window, 'load', initialize);
google.maps.event.addDomListener(window, 'page:load', initialize);

// var bus_icon = <%= image_tag 'bus_icon.png' %>;

// Initialize Google Map
function initialize() {

// Define mapProperties
  var mapProperties = {
    mapTypeId: google.maps.MapTypeId.ROADMAP,
  }

// Define my_map to be map rendered on index page, labeled as "address-map"
  var my_map = new google.maps.Map(document.getElementById("address-map"), mapProperties);
// Define variable "url" as pathname in json format
  var url = window.location.origin + window.location.pathname + ".json"
// AJAX request for our seeded data rendered as json
  $.get(url, function(results){
// Sets our data as array, equal to variable "results", if not already in array form
    if(!(results instanceof Array)) results = [results]
// Defines variable "bounds" as the LatLngBounds of our map
    var bounds = new google.maps.LatLngBounds();
// For loop to capture the latitudes and longitudes of each of the items in our array
    var stopsPath704 = [];

// For loop for stop positions
    for (var i = 0; i < results[0].stops.length; i++) {
      var allStopPositions = new google.maps.LatLng(results[0].stops[i].latitude, results[0].stops[i].longitude)
      // Pushing stop locations into stopsPath704 array
      stopsPath704.push(allStopPositions)
      var marker = new google.maps.Marker({
        position: allStopPositions,
        icon: {
          path: google.maps.SymbolPath.CIRCLE,
          scale: 3,
          fillColor: '#FF0000',
          strokeColor: '#FF0000',
          fillOpacity: 1,
        },
      });
      marker.setMap(my_map);
      bounds.extend(allStopPositions);
    }

// For loop for bus positions
    for (var i = 0; i < results[0].buses.length; i++) {
      var allBusPositions = new google.maps.LatLng(results[0].buses[i].latitude, results[0].buses[i].longitude)
      var marker = new google.maps.Marker({
        position: allBusPositions,
        icon: '/assets/bus_icon.png'
      });
      marker.setMap(my_map);
    }

// Coloring route lines of different routes
    var path704 = new google.maps.Polyline({
      path: stopsPath704,
      geodesic: true,
      strokeColor: '#FF0000',
      strokeOpacity: 1.0,
      strokeWeight: 5
    });



// Fits bounds of the map according to LatLngbounds of our map as defined by coordinates of existing data
    my_map.fitBounds(bounds);
// Setting map for 3 different route paths
    path704.setMap(my_map);
  })

}


////////////////////////////////////////////////////////////////////////////////////////////////////

// Looping through 3 different routes via json reference
    // // for (var i = 0; i < results.length; i++) {
    //   if (results[i].route.api_id == 704) {
    //     var stops704 = new google.maps.LatLng(results[i].stop.latitude, results[i].stop.longitude);
    //     stopsPath704.push(stops704);
    //   }
    //   if (results[i].route.api_id == 733) {
    //     var stops733 = new google.maps.LatLng(results[i].stop.latitude, results[i].stop.longitude);
    //     stopsPath733.push(stops733);
    //   }
    //   if (results[i].route.api_id == 734) {
    //     var stops734 = new google.maps.LatLng(results[i].stop.latitude, results[i].stop.longitude);
    //     stopsPath734.push(stops734);
    //   }
    // };

    // var path733 = new google.maps.Polyline({
    //   path: stopsPath733,
    //   geodesic: true,
    //   strokeColor: '#0000FF',
    //   strokeOpacity: 1.0,
    //   strokeWeight: 2
    // });
    //
    // var path734 = new google.maps.Polyline({
    //   path: stopsPath734,
    //   geodesic: true,
    //   strokeColor: '#22FF00',
    //   strokeOpacity: 1.0,
    //   strokeWeight: 2
    // });
    //
    // new google.maps.LatLng(34.0150299, -118.49735),
    // new google.maps.LatLng(34.0140399, -118.4977299),
    // new google.maps.LatLng(34.0149399, -118.4939),
    // new google.maps.LatLng(34.0166499, -118.49468),
    // new google.maps.LatLng(34.0192799, -118.49143),
    // new google.maps.LatLng(34.0197199, -118.49134),
    // new google.maps.LatLng(34.0285899, -118.48036),
    // new google.maps.LatLng(34.0287999, -118.47967),
    // new google.maps.LatLng(34.0331399, -118.47433),
    // new google.maps.LatLng(34.03351, -118.4742999),
    // new google.maps.LatLng(34.0405699, -118.46304),
    // new google.maps.LatLng(34.04084, -118.4630899),
    // new google.maps.LatLng(34.04371, -118.4565299),
    // new google.maps.LatLng(34.0437499, -118.45578),
    // new google.maps.LatLng(34.0476099, -118.44489),
    // new google.maps.LatLng(34.04725, -118.44418),
    // new google.maps.LatLng(34.0498699, -118.43622),
    // new google.maps.LatLng(34.0498699, -118.43783),
    // new google.maps.LatLng(34.05741, -118.4246499),
    // new google.maps.LatLng(34.05769, -118.4237199),
    // new google.maps.LatLng(34.06661, -118.4113699),
    // new google.maps.LatLng(34.06682, -118.4104899),
    // new google.maps.LatLng(34.07252, -118.4021999),
    // new google.maps.LatLng(34.07262, -118.4025299),
    // new google.maps.LatLng(34.0849099, -118.38363),
    // new google.maps.LatLng(34.0849499, -118.3844),
    // new google.maps.LatLng(34.0893299, -118.37608),
    // new google.maps.LatLng(34.0898799, -118.37604),
    // new google.maps.LatLng(34.09059, -118.37044),
    // new google.maps.LatLng(34.0908399, -118.3706199),
    // new google.maps.LatLng(34.0906999, -118.36172),
    // new google.maps.LatLng(34.0909599, -118.36122),
    // new google.maps.LatLng(34.0906399, -118.3521399),
    // new google.maps.LatLng(34.09059, -118.3443),
    // new google.maps.LatLng(34.09057, -118.33819),
    // new google.maps.LatLng(34.09085, -118.3389199),
    // new google.maps.LatLng(34.0905899, -118.32633),
    // new google.maps.LatLng(34.0908699, -118.32695),
    // new google.maps.LatLng(34.0906599, -118.30891),
    // new google.maps.LatLng(34.0909099, -118.30949),
    // new google.maps.LatLng(34.0907, -118.2997799),
    // new google.maps.LatLng(34.0909599, -118.3010899),
    // new google.maps.LatLng(34.0907699, -118.29203),
    // new google.maps.LatLng(34.0909999, -118.29194),
    // new google.maps.LatLng(34.0924399, -118.28078),
    // new google.maps.LatLng(34.08296, -118.27353),
    // new google.maps.LatLng(34.0775399, -118.26322),
    // new google.maps.LatLng(34.0778, -118.2631499),
    // new google.maps.LatLng(34.0767099, -118.25755),
    // new google.maps.LatLng(34.0770699, -118.25771),
    // new google.maps.LatLng(34.0726099, -118.2512499),
    // new google.maps.LatLng(34.0726199, -118.2509199),
    // new google.maps.LatLng(34.0626699, -118.24651),
    // new google.maps.LatLng(34.0629399, -118.24641),
    // new google.maps.LatLng(34.0603199, -118.2436999),
    // new google.maps.LatLng(34.0608999, -118.2439799),
    // new google.maps.LatLng(34.0581, -118.23881),
    // new google.maps.LatLng(34.05539, -118.2331199),
    // new google.maps.LatLng(34.0512399, -118.23093),
