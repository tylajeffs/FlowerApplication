class User < ApplicationRecord
    has_secure_password
    
    validates :name, presence: :true
    validates :email, format: { with: /@/, message: "must have an @" }, uniqueness: :true
end
