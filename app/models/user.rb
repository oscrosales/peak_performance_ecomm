class User < ApplicationRecord
  belongs_to :province
  has_many :user_roles
  has_many :roles, through: :user_roles

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :username, :address, :city, :province, :postal_code, :phone, presence: true
  validates :username, uniqueness: true
  validates :postal_code, format: { with: /\A[ABCEGHJ-NPRSTVXY]\d[ABCEGHJ-NPRSTV-Z] ?\d[ABCEGHJ-NPRSTV-Z]\d\z/i,
                                    message: "Must be a valid postal code" }
end
