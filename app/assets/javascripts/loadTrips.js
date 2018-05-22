function loadTrips() {

  let userId = parseInt($(".js-load-trips").attr("data-user-id"))
  $.get(`/users/${userId}/trips`, function(data) {

    // GIVING JSON INFO TO JS OBJECT MODEL
    let tripIds = []
    data.forEach(trip => tripIds.push(trip.comment))

    // TEMPLATING INTO DOM
    document.getElementById("trips").innerHTML += tripIds.join(" ") //(result)
    // alert(data[0]["comment"])
  })
  }
