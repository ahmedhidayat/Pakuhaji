class FoodKid < ActiveRecord::Base
  belongs_to :reservation,dependent: :delete
end
