class Item < ApplicationRecord
  validates :price, :description, presence: true  

  has_many :purchases
end
