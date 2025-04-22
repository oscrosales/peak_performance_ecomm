class Province < ApplicationRecord
  has_many :users

  validates :name, :abbreviation, :pst, presence: true
  validates :name, :abbreviation, uniqueness: true
  validates :pst, numericality: true
end
