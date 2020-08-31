class Service < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many :users, through: :orders
end
