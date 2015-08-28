class Food < ActiveRecord::Base
  has_many :reservation_food, dependent: :destroy
   scope :kid, -> {where(category: 'anak')}
   scope :adult, -> {where(category: 'dewasa')}
end
