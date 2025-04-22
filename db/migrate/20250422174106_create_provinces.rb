class CreateProvinces < ActiveRecord::Migration[8.0]
  def change
    create_table :provinces do |t|
      t.string :name
      t.string :abbreviation
      t.decimal :pst

      t.timestamps
    end
  end
end
