class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.integer :vendor_id
      t.integer :invoice_id
      t.string :os
      t.string :os_version
      t.string :warranty
      t.string :provider
      t.boolean :scrap, :default => false
      t.boolean :stock, :default => true
      t.boolean :faulty, :default => false
      t.datetime :faulty_date
      t.boolean :returned, :default => false
      t.datetime :returned_date
      t.datetime :repaired_date
      t.boolean :deleted, :default => false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
