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
    for (var i = 0; i < results.length; i++) {
      var stopPositions = new google.maps.LatLng(results[i].latitude, results[i].longitude);
      var marker = new google.maps.Marker({
        position: stopPositions,
        icon: {
          path: google.maps.SymbolPath.CIRCLE,
          scale: 3
        },
      });
      var myLatlng = stopPositions;
      marker.setMap(my_map);
      bounds.extend(myLatlng);
    }
// Fits bounds of the map according to LatLngbounds of our map as defined by coordinates of existing data
    my_map.fitBounds(bounds);

  })

}
