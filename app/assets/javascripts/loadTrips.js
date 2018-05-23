// UserTrips JS Object Model will need to add more functionality -- i.e. method to get ID of next trip
function UserTrips(data){
  this.trips = data
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

  function Trip(values) {
    this.data = values
  }


function postTrip(data) {

  let trip = data;

  $("#trips").append(`<h3 id="new-trip-id">Explorers Unite Trip Id: ${trip["id"]}</h3>
    <h3 id="new-trip-country">${trip["country"]["name"]}</h3>
    <p id= "new-trip-comment">Comment: ${trip["comment"]}</p>
    <a href="/users/${trip["user"]["id"]}/trips/${trip["id"]}">See More Details About This Trip</a>`
  )

  // $("#trips").append(data)

  // let posting = $.post('/trips', values);
  // posting.done(function(data) {
    // let trip = new Trip(data)
    // fetchLastTrip()

    // loadTrips()
    // let user = new UserTrips(data)
    // let template = Handlebars.compile(document.getElementById("trip-template").innerHTML);
    // let result = template(user.trips);
    // document.getElementById("new-trip").innerHTML += result;
  }



// function fetchLastTrip() {
//   let userId = parseInt($(".js-load-trips").attr("data-user-id"))
//   $.get(`/users/${userId}/trips`, function(data) {
//
//     let lastTrip = data[data.length - 1]
//
//     let user = new UserTrips(lastTrip)
//
//     let template = Handlebars.compile(document.getElementById("trip-template").innerHTML);
//     let result = template(user.trips);
//     document.getElementById("trips").innerHTML += result;
//
// })
// }
