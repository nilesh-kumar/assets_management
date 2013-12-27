class CreateComputers < ActiveRecord::Migration
  def change
    create_table :computers do |t|
      t.string :name
      t.integer :vendor_id
      t.integer :invoice_id
      t.string :ip_address
      t.string :os
      t.string :os_version
      t.boolean :laptop
      t.string :branch
      t.string :provider
      t.string :warranty
      t.boolean :deleted
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
