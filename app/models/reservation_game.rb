class ReservationGame < ActiveRecord::Base
	belongs_to :reservation
	belongs_to :game
end
