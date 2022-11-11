class User < ApplicationRecord
    has_many :reviews
    has_secure_password
    
    validates :name, presence: :true
    validates :email, format: { with: /@/, message: "must have an @" }, uniqueness: :true
    
    def self.new_from_hash(user_hash)
        user = User.new user_hash
        user.password_digest = 0
        user
    end
end
