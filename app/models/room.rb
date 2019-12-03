class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users
  accepts_nested_attributes_for :room_users
  has_many :messages
end
