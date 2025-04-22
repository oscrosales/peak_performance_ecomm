class AddHstToProvinces < ActiveRecord::Migration[8.0]
  def change
    add_column :provinces, :hst, :boolean
  end
end
