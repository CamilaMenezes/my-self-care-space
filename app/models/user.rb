class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :services, through: :orders, dependent: :destroy
  has_many :sold_services, class_name: "Service", dependent: :destroy
  has_one_attached :photo
  has_many :images, dependent: :destroy

  validates :name, presence: true
end
