class User < ApplicationRecord
    validates :name, presence: :true
    validates :email, format: { with: /@/, message: "must have an @" }
end
