class Service < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  has_many :users, through: :orders
end
