class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :invoice_id
      t.integer :computer_id
      t.integer :device_id
      t.integer :vendor_id
      t.string :serial_number
      t.string :model_number
      t.string :name
      t.text :description
      t.boolean :scrap
      t.boolean :stock
      t.boolean :faulty
      t.datetime :faulty_date
      t.boolean :returned
      t.datetime :returned_date
      t.datetime :repaired_date
      t.string :transferred_from
      t.string :transferred_to
      t.string :branch
      t.string :warranty
      t.string :provider
      t.boolean :peripheral
      t.boolean :deleted
      t.datetime :deleted_at
      t.boolean :is_accessory

      t.timestamps
    end
  end
end
