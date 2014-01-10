class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :serial_number
      t.integer :vendor_id
      t.integer :purchase_order_id
      t.datetime :purchase_date
      t.string :mode
      t.text :note
      t.float :cost

      t.timestamps
    end
  end
end
