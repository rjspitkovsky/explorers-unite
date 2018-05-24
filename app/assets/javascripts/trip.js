function Trip(data) {
  this.data = data
}

Trip.prototype.changeRecommendValue = function() {
  if (this.data["recommend?"]) {
    return "Yes"
  } else {
    return "No"
  }
}

function postTrip(data) {
  let trip = new Trip(data);
  $("#trips").append(`<h3 id="new-trip-id">Explorers Unite Trip Id: ${trip.data.id}</h3>
    <h3 id="new-trip-country">${trip.data.country.name}</h3>
    <p id= "new-trip-comment">Comment: ${trip.data.comment}</p>
    <a href="/users/${trip.data.user.id}/trips/${trip.data.id}">See More Details About This Trip</a>`
  )
  }
