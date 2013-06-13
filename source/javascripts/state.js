State = function() {
  this.state = false;
  this.isEnabled = function() {
    return this.state;
  };

  this.isDisabled = function() {
    return !this.state;
  };

  this.toggle = function() {
    this.state = !this.state;
  };
};