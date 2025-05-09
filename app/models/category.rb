class Category < ApplicationRecord
  has_many :brands

  validates :name, :description, presence: true
  validates :name, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "description", "id", "name", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "brands" ]
  end
end
