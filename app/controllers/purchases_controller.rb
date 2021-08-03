class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.all
    @total_income = all_time_gross_income
  end

  private

  def all_time_gross_income
    Purchase.sum {|purchase| purchase.item_count*purchase.item_price }
  end
end
