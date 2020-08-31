class Order < ApplicationRecord
  belongs_to :user
  belongs_to :service
  validates :final_price, presence: true
  validates :reservation, presence: true
  validates :status, presence: true, inclusion: { in: ["Confirmado", "Em espera", "Cancelado"] }
end
