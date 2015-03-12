$(document).ready(function() {

// Weather API



$("#check_forecast").on("click", function(event){
  console.log("weather button clicked");
  event.preventDefault();
  .ajax({
    type: 'get',
    url: 'api.openweathermap.org/data/2.5/find?q=San%20Francisco&units=imperial',

  })

});



// View


var hideElement = function(element) {
  $(element).hide();
};

var showElement = function(element) {
  $(element).show();
};

var setInitialMbarksState = function() {
  hideElement("#add_event");
  showElement("#show_add_mbark_form");
};


// Event Handlers



$("#all_mbark_list").on("click", "button", function(event){
  console.log("button clicked");

});

$("#show_add_mbark_form").on("click", function(event){
  $("#add_event").show();
})



//Controller
setInitialMbarksState();











});
