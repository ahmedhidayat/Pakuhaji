class Admin < ActiveRecord::Base
   attr_accessor :password
   before_save :add_salt_and_hash
    
    def add_salt_and_hash
            unless password.blank?
                self.password_salt = BCrypt::Engine.generate_salt
                self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)

            end

        end
end
