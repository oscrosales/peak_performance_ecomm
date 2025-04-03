class Product < ApplicationRecord
  belongs_to :brand

  validates :name, :price, :description, :stock, presence: true
end
