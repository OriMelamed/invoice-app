class AddBuyerIdToInvoice < ActiveRecord::Migration[6.1]
  def change
    add_column :invoices, :buyer_id, :int
  end
end
