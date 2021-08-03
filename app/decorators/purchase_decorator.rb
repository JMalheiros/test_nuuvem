class PurchaseDecorator < ApplicationDecorator
  delegate_all
  
  def created_at
    return '' if object.created_at.blank?

    object.created_at.strftime('%d/%m/%Y %H:%M')
  end

  def item_price
    return '' if object.item_price.blank?

    "R$ " + object.item_price.to_s
  end
end
