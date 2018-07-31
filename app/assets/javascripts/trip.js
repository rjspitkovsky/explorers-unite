// Must refactor to add this.country.name, this.comment, this.id, this.userId constructor methods to the Trip class

function Trip(data) {
  this.data = data
}

// In the database, the recommend? value is a boolean. The value should be rendered as yes/no instead of true/false
Trip.prototype.changeRecommendValue = function() {
  if (this.data["recommend?"]) {
    return "Yes"
  } else {
    return "No"
  }
}

// Compiles the information of the trip that was just added to the database in the same format as the Handlebars template

function postTrip(data) {
  const trip = new Trip(data);
  $("#trips").append(`<h3 id="new-trip-id">Explorers Unite Trip Id: ${trip.data.id}</h3>
    <h3 id="new-trip-country">${trip.data.country.name}</h3>
    <p id= "new-trip-comment">Comment: ${trip.data.comment}</p>
    <a href="/users/${trip.data.user.id}/trips/${trip.data.id}">See More Details About This Trip</a>`
  )
  }
