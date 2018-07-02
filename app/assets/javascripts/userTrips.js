
function UserTrips(data){
  this.trips = data
}

// prototype method finds the ID of the next trip taken by the given user based on the trip currently viewed

UserTrips.prototype.findNextTripId = function(userId, tripId) {
    const data = this.trips
    tripIds = []
    data.forEach(trip => tripIds.push(trip.id))
    let currentTripIndex = tripIds.indexOf(tripId)
    return tripIds[currentTripIndex + 1]
  }

  // prototype method designed to render only the trips that have been recommended by a user

  UserTrips.prototype.filterRecommend = function() {
    const data = this.trips
    return data.filter(trip => trip["recommend?"] === true)
  }

function loadTrips() {
  let userId = parseInt($(".js-load-trips").attr("data-user-id"))
  $.get(`/users/${userId}/trips`, function(data) {
    let user = new UserTrips(data)
    const trueTrips = user.filterRecommend()
    // compiles the template, adds the information gathered from the database to it like mad-libs and then renders the result to the trips div on the page
    let template = Handlebars.compile(document.getElementById("trip-template").innerHTML);
    let result = template(trueTrips);
    document.getElementById("trips").innerHTML = result;
  })
  }

  function fetchNextTrip() {
  let tripId = parseInt($(".js-next-trip").attr("data-trip-id"));
  let userId = parseInt($(".js-next-trip").attr("data-user-id"))

  $.get(`/users/${userId}/trips`, function(data) {
    let user = new UserTrips(data)
    let nextTripId = user.findNextTripId(userId, tripId)
    // after finding the ID of the next trip, you can then make an API call to return that trip in JSON 
    seedNextTripFields(userId, nextTripId)
  }).done($("#other-users").empty())
  // resets the field for the other users that have been to the country you are currently viewing
}


  function seedNextTripFields(userId, nextTripId) {
    $.get(`/users/${userId}/trips/${nextTripId}.json`, function(data) {
      let trip = new Trip(data)
      // There are 8 different values on the page that need to be updated to render the correct information as well as be able to find the next trip to render
      $(".js-next-trip-country").text(data["country"]["name"]);
      $(".next-trip-id").text(`Explorers Unite Trip ID: ${data["id"]}`);
      $(".next-trip-comment").text(`Comment: ${data["comment"]}`);
      $(".js-next-trip").attr("data-trip-id", data["id"]);
      $(".js-next-trip-country").attr("data-country-id", data["country"]["id"]);
      $(".js-other-users").attr("data-country-id", data["country"]["id"]);
      $(".next-trip-year").text(`Year Visited: ${data["year"]}`);
      $(".next-trip-recommend").text(`Recommended? ${trip.changeRecommendValue()}`);
    })
  }
