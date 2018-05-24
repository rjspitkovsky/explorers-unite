  function Country(data) {
    this.users = data.users
    this.id = data.id
  }

  Country.prototype.fetchUsers = function(userId) {
    users = this.users
    userIds = []
    users.map(user => userIds.push(user.id))
    let userIndex = userIds.indexOf(userId)
    let beforeUser = users.slice(0, userIndex)
    let afterUser = users.slice(userIndex + 1, users.length)
    let otherUsers = [...beforeUser, ...afterUser]
    otherUsers.forEach(user => $("#other-users").append(`<a href="/users/${user.id}">${user.name}</a><br>`))
  }


function getOtherUsers() {
  let countryId = parseInt($(".js-other-users").attr("data-country-id"));
  let userId = parseInt($(".js-other-users").attr("data-user-id"))
  $.get(`/countries/${countryId}.json`, function(data) {
    country = new Country(data)
    country.fetchUsers(userId)
  })
}
