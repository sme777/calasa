class User < ApplicationRecord
   has_secure_password
   has_many :events
   has_many :fundraiser
   has_one_attached :image
end
