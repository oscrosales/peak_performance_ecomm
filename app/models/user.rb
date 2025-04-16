class User < ApplicationRecord
  has_many :user_roles
  has_many :roles, through: :user_roles

  validates :name, :username, :password, :email, :address, :phone, presence: true
  validates :name, :username, :email, :phone, uniqueness: true
end
