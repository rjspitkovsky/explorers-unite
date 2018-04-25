# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

billy = User.create(name: "Billy", email: "drbilly@gmail.com", password: "theman", favorite_country: "Grenada")
luke = User.create(name: "Luke", email: "adventurejunky@msn.com", password: "bassplayer", favorite_country: "Grenada")
carson = User.create(name: "Carson", email: "carsonesq@yahoo.com", password: "lawyerup", favorite_country: "USA")
neil = User.create(name: "Neil", email: "coolhandneil@gmail.com", password: "trekkie", favorite_country: "France")

grenada = Country.create(name: "Grenada")
usa = Country.create(name: "USA")
france = Country.create(name: "France")
india = Country.create(name: "India")
netherlands = Country.create(name: "Netherlands")

trip4 = Trip.create(user_id: billy.id, country_id: grenada.id, recommend?: true, year: 2014, comment: "I went down there for work but I did enjoy the weather.")
trip5 = Trip.create(user_id: billy.id, country_id: france.id, recommend?: false, year: 2008, comment: "Everyone was mean because I was American.")
trip6 = Trip.create(user_id: luke.id, country_id: 1, recommend?: true, year: 2011, comment: "Nothing can beat watching the sun rise on the beach in Spain.")
trip7 = Trip.create(user_id: neil.id, country_id: netherlands.id, recommend?: true, year: 2005, comment: "You may not remember anything, but somehow you will know you had a good time.")
trip8 = Trip.create(user_id: carson.id, country_id: usa.id, recommend?: true, year: 2016, comment: "You can smell freedom in the air in America. It's beautiful.")
trip9 = Trip.create(user_id: 1, country_id: netherlands.id, recommend?: true, year: 2011, comment: "The party doesn't start until after midnight here. If I didn't see the sunrise, that meant it was an early night.")
trip10 = Trip.create(user_id: 2, country_id: india.id, recommend?: false, year: 2015, comment: "Bring your own food.")
