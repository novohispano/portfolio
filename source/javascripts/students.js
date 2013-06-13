var Students = function(selectors) {
  this.showLocations = [];

  var students = [];

  $.each(selectors,$.proxy(function(index,selector) {
    students.push.apply(students, this.createStudents($(selector)));

    $(selector).hover(function() {
      $(this).addClass('hover');
    },function() {
      $(this).removeClass('hover');
    });

    $(selector).on("click",function() {
      if ( $(this).data('url') ) {
        document.location.href = $(this).data('url');
      }
    })

  },this));

  this.students = students;

  $.subscribe("filter:location",$.proxy(function(eventObj){
    console.log("Filter update location");

    var location = eventObj.handleObj.handler.arguments[1].location;
    var filterLocation = eventObj.handleObj.handler.arguments[1].value;

    if (filterLocation) {
      this.showLocations.push(location);
    } else {
      this.showLocations = $.grep(this.showLocations,function(existingLocation) {
        return existingLocation != location;
      });
    }

    this.updateStudents();

  },this));

}

Students.prototype = {
  createStudents: function(studentElements) {
    var students = [];

    studentElements.each(function(index,element) {
      var student = new Student({element: element});
      students.push(student);
    });

    return students;
  },
  updateStudents: function() {
    console.log("Updating Students List");

    var studentsToShow = [];
    var locations = this.showLocations;

    $.each(this.students,function(index,student) {
      $.each(locations,function(otherIndex,location) {

        if (student.willWorkAtLocation(location)) {
          console.log("Student: " + student + " will work at " + location);
          studentsToShow.push(student);
        }

      });
    });

    if (locations.length === 0) {
      studentsToShow = this.students;
    }

    var studentsToHide = $.grep(this.students,function(student) {
      // console.log("I am going to hide (" + ($.inArray(student,studentsToShow) !== -1) + ") the student " + student);
      return $.inArray(student,studentsToShow) == -1;
    });

    $.each(studentsToShow,function(index,student) {
      console.log("Showing " + student);
      student.show();
    });

    $.each(studentsToHide,function(index,student) {
      console.log("Hiding " + student);
      student.hide();
    });

  }
}