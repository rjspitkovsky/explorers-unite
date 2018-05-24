# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
  trips#show page, fetchNextTrip() (userTrips.js, 24) GETS the next trip for that particular user and adds it to the DOM

- [x ] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
  users#show page, loadTrips() (userTrips.js, 14), GETS the index trips for that particular user and adds them to DOM

- [ x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
  trips#show page, getOtherUsers() (country.js, 21) Countries has_many Users through Trips; GETS users names from Country object and adds it to the DOM

- [ x] Use your Rails API and a form to create a resource and render the response without a page refresh.
  users#show page, postTrips() (trip.js, 13) POSTS the create trip from the form and adds it to the DOM

- [ x] Translate JSON responses into js model objects.
  UserTrips, Trip, Country

- [x] At least one of the js model objects must have at least one method added by your code to the prototype.
  UserTrips.findNextTripId(), Trip.changeRecommendValue(), Country.fetchUsers()

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
