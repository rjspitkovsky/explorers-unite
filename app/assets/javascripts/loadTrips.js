// $(document).ready(function() {
//   loadTrips()
// })
//
//
// function loadTrips() {
//   // $('#load-trips').on('click', function(e) {
//   //   let userId = $(e.target).attr('user-id')
//   //   fetchTrips(userId)
//   // })
//   let userId = $(e.target).attr('user-id')
//
// }
//
// function fetchTrips(userId) {
//   $.get('/users/' + userId + '/trips.json', function(data) {
//     alert(data)
//   })
// }

function loadTrips() {
  let userId = parseInt($(".js-load-trips").attr("data-user-id"))
  $.get(`/users/${userId}/trips`, function(data) {
    alert(data[0]["comment"])
  })
  }
