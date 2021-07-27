class Purchase < ApplicationRecord
  validates :purchaser_name, :item_count, presence: true

  belongs_to :item
  belongs_to :merchant
end
