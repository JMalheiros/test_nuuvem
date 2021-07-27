class Item < ApplicationRecord
  validates :price, :description, presence: true  
end
