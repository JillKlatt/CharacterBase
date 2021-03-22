class User < ActiveRecord::Base
    has_secure_password
    has_many :characters
    validates :email, uniqueness: true
end