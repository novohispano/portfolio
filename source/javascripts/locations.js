var Locations = function(locationElements) {
  this.setupLocations( $(locationElements) );
};

Locations.prototype = {
  setupLocations: function(locationElements) {
    var locationStates = {};
    this.locationElements = locationElements;

    locationElements.each($.proxy(function(index,element) {
      var location = $(element).data('location');
      locationStates[location] = new State();
    },this));

    this.locationStates = locationStates;

    locationElements.on("click",function() {
      var location = $(this).data('location');
      var locationElement = $(".locations li[data-location='" + location + "'] a")
      var locationState = locationStates[location]

      locationState.toggle();
      locationElement.toggleClass('selected');

      $.publish("filter:location",{ location: location, value: locationState.state })

    });
  }
}
