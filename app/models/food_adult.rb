class FoodAdult < ActiveRecord::Base
  belongs_to :reservation,dependent: :delete
end
