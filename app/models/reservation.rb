class Reservation < ActiveRecord::Base
  has_one :vacation_packet, dependent: :destroy
  has_one :game, dependent: :destroy
  has_one :food_kid, dependent: :destroy
  has_one :food_adult, dependent: :destroy
  has_one :additional_packet, dependent: :destroy
 
end
