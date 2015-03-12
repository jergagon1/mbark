$(document).ready(function() {

// Weather API

var weatherAPI = 'http://api.openweathermap.org/data/2.5/weather';
var data = {
  q : "San Francisco,CA",
  units : "imperial",
};
function showWeather(weatherReport) {
  $('#city').text(weatherReport.name);
  $('#temp').text(weatherReport.main.temp);
  $('#conditions').text(weatherReport.weather[0].main);
}
$("#update_forecast").on("click", function(){
  $.getJSON(weatherAPI, data, showWeather)
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

var retrieveEventId = function(element) {
  var indexListItem = $($($(element).parent()).parent()).children(":first");
  var index = indexListItem.text();
};

//Controller


// Event Handlers



$("#all_mbark_list").on("click", "button", function(event){
  console.log("button clicked");

});

$("#show_add_mbark_form").on("click", function(event){
  $("#add_event").show();
})

$

$("#add_dog_button").on("click", function(event){
  event.preventDefault();
  $(this).hide();
  $("#create-dog").show();
})





setInitialMbarksState();





});
