class CreateSellers < ActiveRecord::Migration[6.0]
  def change
    create_table :sellers do |t|
      t.string :email
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
