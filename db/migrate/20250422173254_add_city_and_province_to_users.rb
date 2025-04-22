class AddCityAndProvinceToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :city, :string
    add_column :users, :province, :string
  end
end
