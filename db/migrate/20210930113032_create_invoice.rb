class CreateInvoice < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.datetime :issue_date
      t.datetime :maturity_date
      t.float :amount
      t.string :vendor_name
      t.timestamps
    end
  end
end
