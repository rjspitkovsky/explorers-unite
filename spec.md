# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x ] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
  User and Country has_many trips
- [x ] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
  Trip belongs_to User and Country
- [ x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
  Users has_many Countries through Trips, Countries has_many Users through Trips
- [x ] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
  Trip.recommend?, Trip.year, Trip.comment
- [ x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  User, Country, Trip
- [ x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
  Trip.twentieth_century URL: /trips?utf8=✓&year=2010-2015&commit=Filter
- [x ] Include signup (how e.g. Devise)
  Through Users#new/create
- [ x] Include login (how e.g. Devise)
  Through Sessions#new/create
- [ x] Include logout (how e.g. Devise)
  Through Sessions#destroy
- [ x] Include third party signup/login (how e.g. Devise/OmniAuth)
  Through OmniAuth Facebook, Sessions#create
- [ x] Include nested resource show or index (URL e.g. users/2/recipes)
  users/2/trips/10
- [ x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
  users/1/trips/new
- [ x] Include form display of validation errors (form URL e.g. /recipes/new)
  users/1/trips/new 

Confirm:
- [ x] The application is pretty DRY
- [ x] Limited logic in controllers
- [ x] Views use helper methods if appropriate
- [ x] Views use partials if appropriate
