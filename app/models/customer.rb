class Customer < ActiveRecord::Base
  has_many :reservations
  validates :name, :presence => {:message => "Nama Tidak Boleh Kosong"}  
  validates :address, :presence => {:message => "Alamat Tidak Boleh Kosong"}
  validates :telephone, :presence => {:message => "Telepon Tidak Boleh Kosong"}, length: { maximum: 12 }  
  validates :email, :presence => {:message => "Email Tidak Boleh Kosong"}
end
