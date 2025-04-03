class CreateBrands < ActiveRecord::Migration[8.0]
  def change
    create_table :brands do |t|
      t.string :name
      t.text :description
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
