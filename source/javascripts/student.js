Student = function(options) {
  this.element = options.element;
  this.elem = $(this.element);

  this.toString = function() {
    return this.elem.data('name');
  }
  this.locations = function() {
    return this.elem.data('location').split(" ");
  };

  this.willWorkAtLocation = function(location) {
    return $.inArray(location,this.locations()) !== -1;
  };

  this.hide = function() {
    this.elem.hide();
  };

  this.show = function() {
    this.elem.show();
  };

}