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
