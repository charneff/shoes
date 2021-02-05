class User < ApplicationRecord
    has_secure_password
    has_many :shoes
    has_many :brands, through: :shoes

    def self.create_from_omniauth(auth)
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['first_name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(12)
        end 
    end 

    def self.create_from_omniauth_github(auth)
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['nickname']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(12)
            byebug
        end 
    end 
end
