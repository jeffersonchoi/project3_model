// The init function needs to run on load
google.maps.event.addDomListener(window, 'load', initialize);
google.maps.event.addDomListener(window, 'page:load', initialize);

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
    var stopsPath733 = [];
    var stopsPath734 = [];
// Looping through 3 different routes via json reference
    for (var i = 0; i < results.length; i++) {
      if (results[i].route.api_id == 704) {
        var stops704 = new google.maps.LatLng(results[i].stop.latitude, results[i].stop.longitude);
        stopsPath704.push(stops704);
      }
      if (results[i].route.api_id == 733) {
        var stops733 = new google.maps.LatLng(results[i].stop.latitude, results[i].stop.longitude);
        stopsPath733.push(stops733);
      }
      if (results[i].route.api_id == 734) {
        var stops734 = new google.maps.LatLng(results[i].stop.latitude, results[i].stop.longitude);
        stopsPath734.push(stops734);
      }
    };

// Coloring route lines of different routes
    var path704 = new google.maps.Polyline({
      path: stopsPath704,
      geodesic: true,
      strokeColor: '#FF0000',
      strokeOpacity: 1.0,
      strokeWeight: 2
    });

    var path733 = new google.maps.Polyline({
      path: stopsPath733,
      geodesic: true,
      strokeColor: '#0000FF',
      strokeOpacity: 1.0,
      strokeWeight: 2
    });

    var path734 = new google.maps.Polyline({
      path: stopsPath734,
      geodesic: true,
      strokeColor: '#22FF00',
      strokeOpacity: 1.0,
      strokeWeight: 2
    });
// Creating markers for all stop positions and
    for (var i = 0; i < results.length; i++) {
      var allStopPositions = new google.maps.LatLng(results[i].stop.latitude, results[i].stop.longitude)
      var marker = new google.maps.Marker({
        position: allStopPositions,
        icon: {
          path: google.maps.SymbolPath.CIRCLE,
          scale: 3
        },
      });
      marker.setMap(my_map);
      bounds.extend(allStopPositions);
    }

// Fits bounds of the map according to LatLngbounds of our map as defined by coordinates of existing data
    my_map.fitBounds(bounds);
// Setting map for 3 different route paths
    path704.setMap(my_map);
    path733.setMap(my_map);
    path734.setMap(my_map);
  })

}
