class Review < ApplicationRecord
    has_one_attached :image
    
    belongs_to :package
    
    
    validates :title, presence: true
    validates :stars, presence: true, :inclusion => {:in => 0..5, :message => "Value should be between 0 and 5"}
    
    
    
end
