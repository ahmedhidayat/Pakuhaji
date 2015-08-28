require 'acts_as_xlsx'
class Reservation < ActiveRecord::Base
  acts_as_xlsx columns: [:id, :created_at]
  #Relations
  has_many :reservation_games, dependent: :destroy
  has_many :reservation_additional_packets, dependent: :destroy
  has_many :reservation_food, dependent: :destroy
  belongs_to :customer
  
  #Validation
  validates :date_booked, :presence => {:message => "Tanggal Tidak Boleh Kosong"}  
  validates :kid_count, :presence => {:message => "Jumlah Anak Tidak Boleh Kosong"}
  validates :adult_count, :presence => {:message => "Jumlah Dewasa Tidak Boleh Kosong"}, length: { maximum: 12 }  

#transaction_code
 def self.transaction_code
    date = DateTime.now

    transaction_code = "#{self.order("id ASC").last.id + 1}" rescue "1"
    zero = ""
    (3 - transaction_code.size).times do
      zero += "0"
    end
    "#{date.strftime("%m%y")}#{zero}#{transaction_code}"
  end
  
end
