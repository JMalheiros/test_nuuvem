class PurchaseListUpload < ApplicationRecord
  has_one_attached :file

  has_many :purchases
  has_many :merchants, through: :purchases
  has_many :items, through: :purchases
  
  validates :file, presence: true

  def total_income
    purchases.sum {|purchase| purchase.item_count*purchase.item_price }
  end
end
