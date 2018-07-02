class User < ApplicationRecord
  has_secure_password
  has_many :trips
  has_many :countries, through: :trips
  validates :name, presence: true
  validates :favorite_country, presence: true, unless: :logged_in_through_facebook
  validates :password, length: {minimum: 6}, unless: :logged_in_through_facebook
  validates :email, uniqueness: true
  scope :most_trips_taken, -> { joins(:trips).group('trips.user_id').order("count(trips.user_id) desc").limit(1)}

  def logged_in_through_facebook
    #uid is an attribute only given if logged on through facebook
    !!self.uid
  end

  def self.find_or_create_by_omniauth(auth_hash)
    oauth_email = auth_hash['info']['email']
    # Either finding a user who has already logged on through Facebook through their email or creating one based on their email and name given by Facebook Oauth. The password is randomly generated and uid is a value that lets the program know the user was created through FB 
      where(:email => oauth_email).first_or_create do |user|
        user.password = SecureRandom.hex
        user.name = auth_hash['info']['name']
        user.uid = auth_hash['uid']
      end
    end





end
