class Restaurant < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :chef_name, presence: true
  validates :stars, inclusion: { in: 1..5 }
  has_many :reviews, dependent: :destroy
end
