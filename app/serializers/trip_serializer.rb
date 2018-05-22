class TripSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :year, :recommend?, :comment
  belongs_to :country
end
