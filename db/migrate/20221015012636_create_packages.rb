class CreatePackages < ActiveRecord::Migration[7.0]
  def change
    create_table :packages do |t|
      t.string :name
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
