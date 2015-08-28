class ReservationFood < ActiveRecord::Base
  belongs_to :reservation 
  belongs_to :food
end
