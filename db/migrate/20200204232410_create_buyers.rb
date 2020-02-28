class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :password_digest

      t.timestamps
    end
  end
end
