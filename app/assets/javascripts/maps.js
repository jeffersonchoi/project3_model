// The init function needs to run on load
google.maps.event.addDomListener(window, 'load', initialize);
google.maps.event.addDomListener(window, 'page:load', initialize);

// Initialize Google Map
function initialize() {
  
  var center_coords = new google.maps.LatLng(34.0219,-118.4814);
    
  var mapProperties = {
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    center: center_coords,
    zoom: 11
  } 

  var my_map = new google.maps.Map(document.getElementById("address-map"), mapProperties);

  var url = window.location.origin + window.location.pathname + ".json"

  $.get(url, function(results){
    
    if(!(results instanceof Array)) results = [results] 

    for (var i = 0; i < results.length; i++) {
      var marker = new google.maps.Marker({
        position: new google.maps.LatLng(results[i].latitude, results[i].longitude)
      });
      console.log(results[i]);
      marker.setMap(my_map);
    }

  })
  
  // var bounds = new google.maps.LatLngBounds();
    
  // my_map.fitBounds(bounds);

}