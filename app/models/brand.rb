class Brand < ApplicationRecord
  belongs_to :category
  has_many :products

  has_one_attached :image

  validates :name, :description, presence: true
  validates :name, uniqueness: true

  def self.ransackable_associations(auth_object = nil)
    [ "category" ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "category_id", "created_at", "description", "id", "name", "updated_at" ]
  end
end
