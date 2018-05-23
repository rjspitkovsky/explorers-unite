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
  // $("#new-trip").empty()
  let userId = parseInt($(".js-load-trips").attr("data-user-id"))
  $.get(`/users/${userId}/trips`, function(data) {

    // GIVING JSON INFO TO JS OBJECT MODEL
    let user = new UserTrips(data)
    // let tripIds = []
    // data.forEach(trip => tripIds.push(trip.comment))

    // TEMPLATING INTO DOM
    let template = Handlebars.compile(document.getElementById("trip-template").innerHTML);
    let result = template(user.trips);
    document.getElementById("trips").innerHTML += result;
    // document.getElementById("trips").innerHTML += tripIds.join(" ") //(result)
    // alert(data[0]["comment"])
  })
  }

  function fetchNextTrip() {
  let tripId = parseInt($(".js-next-trip").attr("data-trip-id"));
  let userId = parseInt($(".js-next-trip").attr("data-user-id"))

  $.get(`/users/${userId}/trips`, function(data) {
    let user = new UserTrips(data)
    let nextTripId = user.findNextTripId(userId, tripId)
    seedNextTripFields(userId, nextTripId)
  })
}


  function seedNextTripFields(userId, nextTripId) {
    $.get(`/users/${userId}/trips/${nextTripId}.json`, function(data) {
      $(".next-trip-country").text(data["country"]["name"]);
      $(".next-trip-id").text(`Explorers Unite Trip ID: ${data["id"]}`);
      $(".next-trip-comment").text(`Comment: ${data["comment"]}`);
      $(".js-next-trip").attr("data-trip-id", data["id"]);
      $(".next-trip-year").text(`Year Visited: ${data["year"]}`);
      $(".next-trip-recommend").text(`Recommended? ${data["recommend?"]}`);
    })
  }
