  function Country(data) {
    this.users = data.users
    this.id = data.id
  }

// This method finds the users who have been to the country being viewed, excluding the user whose trip is being viewed. Then we add links to the other users' pages on the trip page 
  Country.prototype.fetchUsers = function(userId) {
    users = this.users
    userIds = []
    users.map(user => userIds.push(user.id))
    let userIndex = userIds.indexOf(userId)
    let beforeUser = users.slice(0, userIndex)
    let afterUser = users.slice(userIndex + 1, users.length)
    let otherUsers = [...beforeUser, ...afterUser]
    if (otherUsers.length > 0) {
    otherUsers.forEach(user => $("#other-users").append(`<a href="/users/${user.id}">${user.name}</a><br>`))
  } else {
    $("#other-users").text("No one else has visited this country")
  }
}

function getOtherUsers() {
  let countryId = parseInt($(".js-other-users").attr("data-country-id"));
  let userId = parseInt($(".js-other-users").attr("data-user-id"))
  $.get(`/countries/${countryId}.json`, function(data) {
    country = new Country(data)
    country.fetchUsers(userId)
  })
}
