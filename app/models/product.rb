class Product < ApplicationRecord
  belongs_to :brand

  has_one_attached :image

  validates :name, :price, :description, :stock_quantity, presence: true

  def self.ransackable_associations(auth_object = nil)
    [ "brand" ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "brand_id", "created_at", "description", "id", "name", "price", "stock_quantity", "updated_at" ]
  end
end
