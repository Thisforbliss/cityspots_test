class CreateHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :houses do |t|
      t.float :beds
      t.float :baths
      t.string :city
      t.string :state
      t.string :address
      t.integer :price
      t.references  :seller, foreign_key: true 
      t.references  :buyer, foreign_key:true

      t.timestamps
    end
  end
end
