class User < ApplicationRecord
  belongs_to :province
  has_many :user_roles
  has_many :roles, through: :user_roles

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :username, :address, :city, :province, :phone, presence: true
  validates :username, uniqueness: true
end
