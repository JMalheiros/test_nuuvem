require 'csv'

class PurchaseCreator
  def initialize(list:)
    @list = list
  end

  def self.perform(list:)
    new(list: list).perform
  end

  def perform
    @list.file.attachment.blob.open do |file|
      table = CSV.table(file.path, { headers: true, col_sep: "\t" })
      (0...table.length).each do |row_number|
        merchant_id = purchase_merchant(table[row_number][:merchant_name],table[row_number][:merchant_address])
        item_id = purchase_item(table[row_number][:item_description],table[row_number][:item_price])

        purchase = Purchase.new(purchaser_name: table[row_number][:purchaser_name] ,item_count: table[row_number][:purchase_count] ,purchase_list_upload_id: @list.id, merchant_id: merchant_id ,item_id: item_id)
        purchase.save
      end
    end
  end

  private

  def purchase_merchant(name, address)
    if Merchant.where(name: name, address: address).first.present?
      merchant = Merchant.where(name: name, address: address).first
    else
      merchant = Merchant.new(name: name, address: address)
      merchant.save
    end

    merchant.id
  end

  def purchase_item(description,price)
    if Item.where(description: description, price: price).first.present?
      item = Item.where(description: description, price: price).first
    else
      item = Item.new(description: description, price: price)
      item.save
    end

    item.id
  end
end
