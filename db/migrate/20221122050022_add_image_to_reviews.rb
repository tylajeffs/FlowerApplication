class AddImageToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :image, :string
  end
end
