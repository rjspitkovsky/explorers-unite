// UserTrips JS Object Model will need to add more functionality -- i.e. method to get ID of next trip
function UserTrips(data){
  this.trips = data
}

UserTrips.prototype.findNextTripId = function(userId, tripId) {
    data = this.trips
    tripIds = []
    data.forEach(trip => tripIds.push(trip.id))
    let currentTripIndex = tripIds.indexOf(tripId)
    return tripIds[currentTripIndex + 1]
  }

function loadTrips() {
  let userId = parseInt($(".js-load-trips").attr("data-user-id"))
  $.get(`/users/${userId}/trips`, function(data) {
    let user = new UserTrips(data)
    let template = Handlebars.compile(document.getElementById("trip-template").innerHTML);
    let result = template(user.trips);
    document.getElementById("trips").innerHTML = result;
  })
  }

  function fetchNextTrip() {
  let tripId = parseInt($(".js-next-trip").attr("data-trip-id"));
  let userId = parseInt($(".js-next-trip").attr("data-user-id"))

  $.get(`/users/${userId}/trips`, function(data) {
    let user = new UserTrips(data)
    let nextTripId = user.findNextTripId(userId, tripId)
    seedNextTripFields(userId, nextTripId)
  }).done($("#other-users").empty())
}


  function seedNextTripFields(userId, nextTripId) {
    $.get(`/users/${userId}/trips/${nextTripId}.json`, function(data) {
      let trip = new Trip(data)
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
