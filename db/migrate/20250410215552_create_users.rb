class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password
      t.string :email
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
