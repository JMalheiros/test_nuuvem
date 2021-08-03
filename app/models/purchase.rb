class Purchase < ApplicationRecord
  validates :purchaser_name, :item_count, presence: true

  belongs_to :item
  belongs_to :merchant

  delegate :price, :description, to: :item, prefix: true
  delegate :address, :name, to: :merchant, prefix: true
end
