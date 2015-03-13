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
    $.getJSON(weatherAPI, data, showWeather).fail(function(){
      $(".error").text("Weather API is Down!")
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

  var retrieveEventId = function(element) {
    var indexListItem = $($($(element).parent()).parent()).children(":first");
    var index = indexListItem.text();
  };

  //Controller


  // Event Handlers


  $("#all_mbark_list").on("click", "button", function(event){
    // event.preventDefault();
    // console.log("button clicked");
    // console.log(this);
    var mbarkToModify = $($(this).parent()).parent();
    // console.log(mbarkToModify);
    var indexListItem = $($($(this).parent()).parent()).children(":first");
    var index = indexListItem.text();
    console.log(index);
    response = $.ajax({
      url: '/mbarks/add_user/' + index,
      type: 'put',
      data: {id: index},
    });

    response.done(function(serverData){
      // console.log(serverData);
      // console.log("winning");

      // console.log(serverData.event)
      window.location.href = "/mbarks"
      //redirect here if successful
    });

    response.fail( function() {
      console.log("fails");
    });
  });

  $("#show_add_mbark_form").on("click", function(event){
    $("#add_event").show();
  });

  $("#add_dog_button").on("click", function(event){
    event.preventDefault();
    $(this).hide();
    $("#create-dog").show();
  });

  setInitialMbarksState();

});
