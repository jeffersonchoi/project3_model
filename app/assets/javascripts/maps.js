// The init function needs to run on load
google.maps.event.addDomListener(window, 'load', initialize);
google.maps.event.addDomListener(window, 'page:load', initialize);

var stopsPath704 = [];
var busLocations = [];
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
// Pushing stop locations into stopsPath704 array
    // var stopsPath704 =[];
// For loop for stop positions
    for (var i = 0; i < results[0].stops.length; i++) {
      var allStopPositions = new google.maps.LatLng(results[0].stops[i].latitude, results[0].stops[i].longitude)
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
      var bus_position = new google.maps.LatLng(results[0].buses[i].latitude, results[0].buses[i].longitude)
      busLocations.push(bus_position)
      var marker = new google.maps.Marker({
        position: bus_position,
        icon: '/assets/bus_icon.png'
      });
      marker.setMap(my_map);

    }

    calculateDistances(bus_position, stopsPath704)

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


function calculateDistances(bus_location, bus_stops) {
  var service = new google.maps.DirectionsService();

  waypoints = []
  bus_stops = bus_stops.splice(-8)
  for(var i = 0; i < bus_stops.length; i++){
    waypoints.push( {location: bus_stops[i]} )
  }

  var destination = bus_stops.pop()

 //console.log(bus_stops)

  service.route(
    {
      origin: bus_location,
      waypoints: waypoints,
      destination: destination,
      travelMode: google.maps.TravelMode.DRIVING,
      unitSystem: google.maps.UnitSystem.METRIC,
      avoidHighways: false,
      avoidTolls: false
    }, callback);
    console.log("calculateDistances running")
}

function callback(response, status) {
  if (status == google.maps.DistanceMatrixStatus.OK) {
    console.log("callback running");
    console.log(response)
    var origin = response.originAddresses;
    var destination = response.destinationAddresses;

    var results = response.routes[0].legs[0];
    var distance = results.distance.text;
    var duration = results.duration.text;
    document.getElementById('testDiv').innerHTML = duration;
  } else {
    console.log("something's wrong with calculateDistances")
    console.log(status)
  }
}
// HOW TO SPLIT A LONG ARRAY INTO A SMALLER ARRAY
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
