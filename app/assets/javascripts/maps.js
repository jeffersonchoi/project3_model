// The init function needs to run on load
google.maps.event.addDomListener(window, 'load', initialize);
google.maps.event.addDomListener(window, 'page:load', initialize);

// Initialize Google Map
function initialize() {

  var mapProperties = {
    mapTypeId: google.maps.MapTypeId.ROADMAP,
  }

  var my_map = new google.maps.Map(document.getElementById("address-map"), mapProperties);

  var url = window.location.origin + window.location.pathname + ".json"

  $.get(url, function(results){

    if(!(results instanceof Array)) results = [results]

    var bounds = new google.maps.LatLngBounds();

    for (var i = 0; i < results.length; i++) {
      var stopPositions = new google.maps.LatLng(results[i].latitude, results[i].longitude);
      var marker = new google.maps.Marker({
        position: stopPositions
      });
      var myLatlng = stopPositions
      marker.setMap(my_map);
      bounds.extend(myLatlng)
    }

    my_map.fitBounds(bounds);
    
  })

}
